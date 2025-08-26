# Neovim 配置（基于 AstroNvim + lazy.nvim）

本仓库包含一个以 AstroNvim 为基础，通过 lazy.nvim 管理插件的 Neovim 配置。  
文档目的：帮助你理解当前配置的结构、如何启用/扩展配置以及添加新功能。

主要入口

- 配置入口：[`init.lua`](init.lua:1)
- lazy 配置：[`lua/lazy_setup.lua`](lua/lazy_setup.lua:1)
- 最后执行的自定义区：[`lua/polish.lua`](lua/polish.lua:1)
- 用户插件点：[`lua/plugins/user.lua`](lua/plugins/user.lua:1)
- 插件模块目录：[`lua/plugins/`](lua/plugins/treesitter.lua:1)

快速开始

1. 将本目录放到你的 Neovim 配置目录（本仓库已位于 /home/xiaot/.config/nvim）。
2. 启动 Neovim，配置会自动引导并在缺少 lazy.nvim 时尝试拉取它（见 [`init.lua`](init.lua:1-14)）。
3. 打开 Neovim 并运行 :Lazy 或者 :Lazy sync 来安装/同步插件。

关键配置解析

init.lua

- 负责引导 lazy.nvim 的安装与加载（见 [`init.lua`](init.lua:1-26)）。
- 在加载完成后会 require 两个主要模块：[`lazy_setup.lua`](lua/lazy_setup.lua:1) 与 [`polish.lua`](lua/polish.lua:1)（行见：[`init.lua`](init.lua:26-27)）。
- 包含 SSH 下的 OSC52 剪贴板适配实现（见 [`init.lua`](init.lua:29-41)）。
- 全局缩进/制表符设置：shiftwidth、tabstop、expandtab 等（见 [`init.lua`](init.lua:43-48)）。

lua/lazy_setup.lua

- 通过 require("lazy").setup(...) 声明 AstroNvim 和插件导入点（见 [`lua/lazy_setup.lua`](lua/lazy_setup.lua:1-16)）。
- 使用 import 机制加载内置与社区插件：{ import = "community" } 和 { import = "plugins" }（见行 14-15）。
- lazy.nvim 的 UI、install 以及 performance 选项也在此处调整（例：禁用 rtp 中的部分默认插件，见行 18-31）。

lua/polish.lua

- 该文件设计为“最后运行”的自定义位置，用于放置无法在其他配置点放置的纯 Lua 代码（但当前文件以防误触的方式被短路，见 [`lua/polish.lua`](lua/polish.lua:1)）。
- 启用方法：删除文件顶部的保护行（把第 1 行的 `if true then return end` 移除或注释）。

lua/plugins/

- 目录下每个文件都可以返回一个 LazySpec 来添加或覆盖插件配置，例如：[`lua/plugins/treesitter.lua`](lua/plugins/treesitter.lua:1)。
- 你可以创建新文件来管理不同类型的插件（lsp、completions、ui、lang 等），并在 lazy_setup 中通过 import 加载。

lua/plugins/user.lua

- 这是给用户自定义插件与覆盖的示例文件（当前被短路，见 [`lua/plugins/user.lua`](lua/plugins/user.lua:1)）。
- 启用方法：删除或修改第一行的短路语句，然后按照文件内示例添加/覆盖插件。
- 示例展示了如何覆盖默认插件的 opts 与 config，例如对 LuaSnip、nvim-autopairs 的扩展配置（参见文件内样例配置）。

常见操作与建议

- 启用单个文件：移除文件顶部的 `if true then return ...` 保护行，然后重启 Neovim 或运行 :Lazy sync。
- 安装/更新插件：在 Neovim 中使用 :Lazy install / :Lazy update / :Lazy sync。
- 调试加载问题：启动 Neovim 并查看 :messages 或使用 :Lazy log 来查看 lazy.nvim 的日志。

增加新功能的推荐组织方式

- 按功能（功能域）拆分 plugin 文件：
  - lua/plugins/lsp.lua
  - lua/plugins/completion.lua
  - lua/plugins/ui.lua
  - lua/plugins/lang/python.lua
- 每个文件返回一个 LazySpec 数组或单个表以清晰表达依赖与延迟条件（event、ft、cmd）。
- 需要在多个文件中共享的工具或 util，放到 lua/utils/ 或 lua/core/ 下。

示例：添加一个新的 Treesitter parser

```lua
-- 在 [`lua/plugins/treesitter.lua`](lua/plugins/treesitter.lua:1) 中启用并添加解析器
return {
  "nvim-treesitter/nvim-treesitter",
  opts = { ensure_installed = { "lua", "vim", "python", "javascript" } },
}
```

如何提交自定义配置（最佳实践）

- 以小步提交（每次添加 1-2 个插件并测试）。
- 在插件文件顶部写明目的与延迟加载条件（event/ft/cmd）。
- 如果覆盖 AstroNvim 的默认配置，先 require 默认配置并在其基础上扩展（参照 [`lua/plugins/user.lua`](lua/plugins/user.lua:50-56) 的示例）。

故障排查速查

- 无法启动或报错：查看是否误改了引导逻辑（[`init.lua`](init.lua:1-26)）。
- 插件未生效：确认对应插件文件已启用且执行了 :Lazy sync。
- 剪贴板在远端不可用：检查 OSC52 依赖的插件是否已安装，或暂时禁用 `vim.g.clipboard` 自定义。

进一步扩展点（建议）

- 将常用 keymap 集中到 lua/keymaps.lua，方便维护与审阅。
- 把 LSP 服务器配置放到 lua/lsp/ 目录并通过 mason 管理。
- 为每种语言添加单独的配置文件夹 lua/lang/{lang}.lua，便于按语言维护。

参考与命令汇总

- 编辑主配置：[`init.lua`](init.lua:1)
- 编辑 lazy 配置：[`lua/lazy_setup.lua`](lua/lazy_setup.lua:1)
- 启用自定义：编辑并启用 [`lua/polish.lua`](lua/polish.lua:1) 与 [`lua/plugins/user.lua`](lua/plugins/user.lua:1)

常用命令

```bash
nvim
# 在 Neovim 中：
:Lazy        " 打开 Lazy UI
:Lazy sync   " 同步插件（安装/删除/更新）
:Lazy update " 更新插件
```

最后说明

本文档为该仓库的快速上手与维护指南。按结构化方式组织插件与配置可以显著降低维护成本并提高可复用性。按照上文建议创建目录与文件后，记得把新的 lua 文件通过 import 或放入 lua/plugins/ 中以被 lazy 加载。
