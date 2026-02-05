#!/bin/bash
set -e

REPO="fak111/token_account"
INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_NAME="token"

# 创建目录
mkdir -p "$INSTALL_DIR"

# 下载脚本
echo "Installing token..."
curl -fsSL "https://raw.githubusercontent.com/${REPO}/main/token" -o "${INSTALL_DIR}/${SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${SCRIPT_NAME}"

# 检查 PATH
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    echo ""
    echo "Add this to your shell config (~/.bashrc or ~/.zshrc):"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "Done! Run 'token --help' to get started."
