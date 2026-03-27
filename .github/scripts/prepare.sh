#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/facebook/lexical"
BRANCH="main"
REPO_DIR="source-repo"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Node.js setup via nvm ---
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
# shellcheck source=/dev/null
source "${NVM_DIR}/nvm.sh"

nvm install 22
nvm use 22

# --- pnpm setup ---
corepack enable
corepack prepare pnpm@latest --activate

# --- Clone (skip if already exists) ---
if [ ! -d "$REPO_DIR" ]; then
    git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"

# --- Install dependencies from root (workspace monorepo) ---
pnpm install --frozen-lockfile

# --- Apply fixes.json if present ---
FIXES_JSON="$SCRIPT_DIR/fixes.json"
if [ -f "$FIXES_JSON" ]; then
    echo "[INFO] Applying content fixes..."
    node -e "
    const fs = require('fs');
    const path = require('path');
    const fixes = JSON.parse(fs.readFileSync('$FIXES_JSON', 'utf8'));
    for (const [file, ops] of Object.entries(fixes.fixes || {})) {
        if (!fs.existsSync(file)) { console.log('  skip (not found):', file); continue; }
        let content = fs.readFileSync(file, 'utf8');
        for (const op of ops) {
            if (op.type === 'replace' && content.includes(op.find)) {
                content = content.split(op.find).join(op.replace || '');
                console.log('  fixed:', file, '-', op.comment || '');
            }
        }
        fs.writeFileSync(file, content);
    }
    for (const [file, cfg] of Object.entries(fixes.newFiles || {})) {
        const c = typeof cfg === 'string' ? cfg : cfg.content;
        fs.mkdirSync(path.dirname(file), {recursive: true});
        fs.writeFileSync(file, c);
        console.log('  created:', file);
    }
    "
fi

# --- Pre-generate docs/packages ---
# The package-docs plugin (./plugins/package-docs) generates docs/packages from
# each package's README.md. This plugin's loadContent is NOT called by
# write-translations (it has no getTranslationFiles), but plugin-content-docs
# requires docs/packages to exist when processing the sidebar. We run the logic
# manually here before calling write-translations.
node -e "
const path = require('path');
const fs = require('fs');
const glob = require('glob');
const {PackageMetadata} = require('./scripts/shared/PackageMetadata');
const GITHUB_REPO_URL = 'https://github.com/facebook/lexical';
const editUrl = GITHUB_REPO_URL + '/tree/main/packages/';
const packageFrontMatter = { lexical: 'sidebar_position: 1\nsidebar_label: lexical (core)' };
const baseDir = path.resolve('packages');
const targetDir = path.resolve('packages/lexical-website/docs/packages');
fs.mkdirSync(targetDir, {recursive: true});
const oldTargets = new Set(glob.sync(path.resolve(targetDir, '*.md'), {windowsPathsNoEscape: true}));
for (const srcPath of glob.sync(baseDir + '/*/README.md', {windowsPathsNoEscape: true})) {
  const jsonPath = path.resolve(path.dirname(srcPath), 'package.json');
  if (!fs.existsSync(jsonPath)) continue;
  const metadata = new PackageMetadata(jsonPath);
  if (metadata.isPrivate()) continue;
  const folderName = metadata.getDirectoryName();
  const targetPath = path.resolve(targetDir, folderName + '.md');
  const customEditUrl = editUrl.replace(/\/\$/, '') + '/' + folderName + '/README.md';
  const extra = packageFrontMatter[folderName];
  const frontMatter = [
    '# Do not edit! Generated from ' + path.relative(path.dirname(targetPath), srcPath),
    extra,
    'custom_edit_url: ' + customEditUrl,
  ].filter(Boolean).map(s => s.trim()).join('\n');
  fs.writeFileSync(targetPath, '---\n' + frontMatter + '\n---\n\n' + fs.readFileSync(srcPath, 'utf-8'));
  oldTargets.delete(targetPath);
}
for (const oldPath of oldTargets) fs.unlinkSync(oldPath);
console.log('Generated docs/packages directory');
"

echo "[DONE] Repository is ready for docusaurus commands."
