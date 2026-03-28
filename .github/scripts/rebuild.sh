#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for facebook/lexical
# Runs on existing source tree (no clone). Current dir is the docusaurus site root
# (packages/lexical-website contents), containing translated i18n files.
#
# Strategy: clone full source to /tmp, install workspace deps there,
# copy translated i18n content in, build, then copy build/ back.

REPO_URL="https://github.com/facebook/lexical"
CURRENT_DIR="$(pwd)"
SOURCE_DEPS_DIR="/tmp/lexical-rebuild-source"

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

# --- Clone source for workspace dependencies ---
if [ ! -d "$SOURCE_DEPS_DIR" ]; then
    git clone --depth 1 "$REPO_URL" "$SOURCE_DEPS_DIR"
fi

cd "$SOURCE_DEPS_DIR"

# --- Install workspace dependencies ---
pnpm install --frozen-lockfile

# --- Pre-generate docs/packages ---
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

# --- Copy translated i18n content from staging repo into source ---
if [ -d "${CURRENT_DIR}/i18n" ]; then
    cp -r "${CURRENT_DIR}/i18n/." "${SOURCE_DEPS_DIR}/packages/lexical-website/i18n/"
fi

# --- Build from source (has full workspace + node_modules) ---
cd "${SOURCE_DEPS_DIR}/packages/lexical-website"
pnpm run build

# --- Copy build output back to staging repo ---
cp -r "${SOURCE_DEPS_DIR}/packages/lexical-website/build" "${CURRENT_DIR}/build"

echo "[DONE] Build complete."
