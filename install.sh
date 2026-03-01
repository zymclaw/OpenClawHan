#!/bin/bash
# ============================================================
# OpenClaw 纯汉化版 - 一键安装脚本
# 
# OpenClaw: 开源个人 AI 助手平台
# 官方网站: https://openclaw.ai/
# 汉化项目: https://github.com/zymclaw/OpenClawHan
#
# 用法:
#   curl -fsSL https://raw.githubusercontent.com/zymclaw/OpenClawHan/main/install.sh | bash
# ============================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════╗"
echo "║     🦞 OpenClaw 纯汉化版 安装脚本              ║"
echo "║     无商业注入 · 无第三方推广                  ║"
echo "╚═══════════════════════════════════════════════╝"
echo -e "${NC}"

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}错误: 未检测到 Node.js，请先安装 Node.js 22+${NC}"
    echo -e "下载地址: ${BLUE}https://nodejs.org/${NC}"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 22 ]; then
    echo -e "${YELLOW}警告: Node.js 版本过低 (当前: $(node -v))，建议升级到 22+${NC}"
fi

echo -e "${GREEN}✓ Node.js $(node -v)${NC}"

# 检查 npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}错误: 未检测到 npm${NC}"
    exit 1
fi

echo -e "${GREEN}✓ npm $(npm -v)${NC}"

# 卸载原版（如果已安装）
if npm list -g openclaw &> /dev/null; then
    echo -e "${YELLOW}正在卸载原版 OpenClaw...${NC}"
    npm uninstall -g openclaw
fi

# 卸载商业汉化版（如果已安装）
if npm list -g @qingchencloud/openclaw-zh &> /dev/null; then
    echo -e "${YELLOW}正在卸载商业汉化版...${NC}"
    npm uninstall -g @qingchencloud/openclaw-zh
fi

# 安装纯汉化版
echo -e "${CYAN}正在安装 OpenClaw 纯汉化版...${NC}"
npm install -g openclaw-zh-clean

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           🎉 安装完成！                        ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "下一步:"
echo -e "  ${CYAN}openclaw onboard${NC}    初始化配置"
echo -e "  ${CYAN}openclaw gateway${NC}    启动网关"
echo -e "  ${CYAN}openclaw dashboard${NC}  打开控制台"
echo ""
echo -e "文档: ${BLUE}https://github.com/zymclaw/OpenClawHan${NC}"
