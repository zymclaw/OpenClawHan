# OpenClaw 纯汉化版

[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

> OpenClaw 官方仓库的纯翻译版本，无商业注入，无第三方 API 推广。

## 关于本项目

本项目是 [OpenClaw](https://github.com/openclaw/openclaw) 的简体中文翻译版本，只包含翻译规则，不包含任何商业推广或第三方服务。

**与原汉化版的区别：**
- ✅ 纯翻译规则，无商业注入
- ✅ 无胜算云等第三方 API 推广
- ✅ 无功能面板注入（不向第三方发送数据）
- ✅ 不收集用户 API Key

## 工作原理

本项目通过文本替换规则实现汉化：

1. 从 OpenClaw 官方仓库拉取源码
2. 应用翻译规则（`translations/` 目录）
3. 重新构建并发布

## 翻译规则

翻译规则位于 `translations/` 目录：

```
translations/
├── cli/          # CLI 命令行翻译
├── commands/     # 命令输出翻译
├── dashboard/    # Dashboard 网页界面翻译
├── wizard/       # 向导翻译
├── tui/          # TUI 界面翻译
├── extensions/   # 扩展翻译
└── config.json   # 翻译配置
```

每个翻译文件是 JSON 格式，指定源文件和替换规则：

```json
{
  "file": "src/cli/banner.ts",
  "description": "CLI 横幅标题",
  "replacements": {
    "🦞 OpenClaw": "🦞 OpenClaw 中文版"
  }
}
```

## 构建方式

本项目使用 GitHub Actions 自动构建：

1. 每小时同步 OpenClaw 官方仓库
2. 应用翻译规则
3. 发布到 npm

## 使用方法

```bash
# 安装（发布后可用）
npm install -g openclaw-zh-clean

# 或使用 npx（无需安装）
npx openclaw-zh-clean
```

## 贡献翻译

欢迎提交 PR 改进翻译：

1. Fork 本仓库
2. 在 `translations/` 目录添加或修改翻译规则
3. 提交 PR

## 许可证

MIT License

本项目基于 OpenClaw 官方仓库，遵循 MIT 许可证。

## 致谢

- [OpenClaw](https://github.com/openclaw/openclaw) - 官方项目
- 原汉化项目贡献者
