# ============================================================
# OpenClaw 纯汉化版 - 一键安装脚本 (Windows PowerShell)
# 
# OpenClaw: 开源个人 AI 助手平台
# 官方网站: https://openclaw.ai/
# 汉化项目: https://github.com/zymclaw/OpenClawHan
#
# 用法:
#   irm https://raw.githubusercontent.com/zymclaw/OpenClawHan/main/install.ps1 | iex
# ============================================================

param(
    [switch]$Nightly
)

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     🦞 OpenClaw 纯汉化版 安装脚本              ║" -ForegroundColor Cyan
Write-Host "║     无商业注入 · 无第三方推广                  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 检查 Node.js
try {
    $nodeVersion = node -v
    $nodeMajor = [int]($nodeVersion -replace 'v(\d+).*', '$1')
    
    if ($nodeMajor -lt 22) {
        Write-Host "警告: Node.js 版本过低 (当前: $nodeVersion)，建议升级到 22+" -ForegroundColor Yellow
    } else {
        Write-Host "✓ Node.js $nodeVersion" -ForegroundColor Green
    }
} catch {
    Write-Host "错误: 未检测到 Node.js，请先安装 Node.js 22+" -ForegroundColor Red
    Write-Host "下载地址: https://nodejs.org/" -ForegroundColor Blue
    exit 1
}

# 检查 npm
try {
    $npmVersion = npm -v
    Write-Host "✓ npm $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "错误: 未检测到 npm" -ForegroundColor Red
    exit 1
}

# 卸载原版
if (npm list -g openclaw 2>$null) {
    Write-Host "正在卸载原版 OpenClaw..." -ForegroundColor Yellow
    npm uninstall -g openclaw
}

# 卸载商业汉化版
if (npm list -g @qingchencloud/openclaw-zh 2>$null) {
    Write-Host "正在卸载商业汉化版..." -ForegroundColor Yellow
    npm uninstall -g @qingchencloud/openclaw-zh
}

# 安装纯汉化版
Write-Host "正在安装 OpenClaw 纯汉化版..." -ForegroundColor Cyan
npm install -g openclaw-zh-clean

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║           🎉 安装完成！                        ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "下一步:" -ForegroundColor White
Write-Host "  openclaw onboard    初始化配置" -ForegroundColor Cyan
Write-Host "  openclaw gateway    启动网关" -ForegroundColor Cyan
Write-Host "  openclaw dashboard  打开控制台" -ForegroundColor Cyan
Write-Host ""
Write-Host "文档: https://github.com/zymclaw/OpenClawHan" -ForegroundColor Blue
