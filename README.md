# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


# nvim & Lazyvim

## 1. 快捷键

| 快捷键         | 说明                        |
|---------------|----------------------------|
| Ctrl - ]      | 函数跳转                     |
| Ctrl - O      | 返回上一个位置                |
| Space - Space | 搜索并打开文件                |
| Space - E     | 打开文件树/侧边栏 - 项目的根目录 |
| Space - e     | 打开文件树/侧边栏 - 当前工作目录 |
| [             |                            |
| ]             |                            |
|               |                            |
| Space - f - f | 搜索文件                    |
|               |                            |
| Ctrl - *      | 高亮选中的关键字              |
| Space - /     | 匹配关键字                  |


## 2. 安装 neovim
- lazyvim 要求安装的 neovim 版本要高于 0.9.0，所以在安装 neovim 之前要先查看通过 apt 安装的 neovim 版本
  `apt show neovim`

- 若显示 待安装的 neovim 版本小于 0.9.0，需要通过如下方式来更新待安装的 neovim 版本
  ```
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt update
  sudo apt install neovim    # 这个方式安装会出现 blink.cmp(string.buffer 找不到) 插件异常的问题
  
  Ubuntu22.04推荐的安装方式：
    下载 nvim-linux-x86_64.appimage
    sudo mv nvim-linux-x86_64.appimage /usr/bin/nvim
    sudo chmod +x nvim
  ```
  
- 若要卸载之前的neovim，需要执行如下操作
  ```
  # 卸载neovim
  sudo apt purge neovim
  
  # 删除配置文件
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  
  # 或者备份之前的配置
    # required
    mv ~/.config/nvim{,.bak}
  
    # optional but recommended
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}
  ```

- 安装后锁定版本，禁止自动升级
  ```
  # 安装了neovim某个版本并希望锁定它，以防止以后自动升级
  sudo apt-mark hold neovim
  
  # 想解除版本锁定，可以执行
  sudo apt-mark unhold neovim
  ```

## 3. 终端字体配置

### 3.1 下载 Nerd Font 字体
- 打开 https://www.nerdfonts.com/font-downloads
- 下载如下推荐字体
  - JetBrainsMono Nerd Font
  - FiraCode Nerd Font
  - Hack Nerd Font
- 解压下载的字体 xx.zip，将其中的 .ttf 字体文件复制到本地字体目录
  ```
  mkdir -p ~/.local/share/fonts
  unzip FiraCode.zip -d FiraCode
  cp *.ttf ~/.local/share/fonts
  ```
- 刷新字体缓存
  `fc-cache -fv`

### 3.2 设置终端字体
- 打开终端 -> 右键 -> 首选项
- 找到当前正在使用的配置，将其中的字体改为刚下载的 Nerd Font 字体
- 重新打开终端查看效果


## 4. Lazyvim配置

[neovimcraft/LazyVim](https://neovimcraft.com/plugin/LazyVim/LazyVim/)
[Lazyvim 从零开始配置](https://fanlumaster.github.io/2023/11/25/Lazyvim-configure-from-scratch/)
[neovimcraft](https://neovimcraft.com/)

### 4.1 安装lazyvim

- 安装依赖
```
安装 neovim
安装 Nerd Font 字体
安装 git curl ripgrep fd-find
```

- 安装lazyvim
安装完之后，第一次打开nvim会有一个安装插件的步骤，插件安装完之后，如下图所示
![lazyvim安装完插件](../images/Linux/installed-lazyvim.png)

- 检查是否安装成功、加载插件
```
:LazyHealth
```

### 4.2 更改主题，修改 ~/.config/nvim/lua/plugins/colorscheme.lua
  - 主题网站 [Trending Neovim Colorschemes](https://dotfyle.com/neovim/colorscheme/trending)
  ```
  -- 会自动下载 Catppuccin，在下次启动 nvim 时生效
  $ cat plugins/colorscheme.lua 
  return {
    -- 设置 Catppuccin 为主题
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",  -- 默认使用 mocha 变体
      },
    },

    -- Catppuccin 插件配置
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,    -- 启动时加载
      priority = 1000, -- 高优先级确保先加载
      opts = {
        flavour = "mocha", -- 可选：latte, frappe, macchiato, mocha
        transparent_background = true, -- 透明背景（可选）
        styles = {
          comments = { "italic" }, -- 注释斜体（可选）
        },
        integrations = {
          cmp = true,         -- 启用补全菜单样式
          telescope = true,   -- 启用 Telescope 样式
        },
      },
    },
  }
  ```
  或
  ```
  return {
    -- add gruvbox
    { "rebelot/kanagawa.nvim" },
  
    -- Configure LazyVim to load gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "kanagawa",
      },
    },
  }
  ```

### 4.3 自定义配置
```
-- 禁用自动格式化功能
vim.g.autoformat = false

vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_cursor_vfx_mode = "torpedo"
vim.g.neovide_cursor_vfx_particle_density = 100.0
vim.g.neovide_floating_shadow = false
-- 启用 IME 输入法支持（对中文/日文等输入很重要）
vim.g.neovide_input_ime = true
-- 打字时自动隐藏鼠标光标
vim.g.neovide_hide_mouse_when_typing = true

local opt = vim.opt

-- 禁用拼写检查
opt.spell = false
-- 设置隐藏级别为 0
opt.conceallevel = 0
-- 开启 wrap 自动折行
opt.wrap = true
-- 禁用相对行号
opt.relativenumber = false

vim.o.tabstop = 4 -- 设置 Tab 为 4 个空格
vim.o.shiftwidth = 4 -- 设置缩进宽度为 4 个空格
vim.o.expandtab = true -- 使用空格替代 Tab

-- 设置 tags 文件的位置，指定多个tags文件
vim.opt.tags = {
  "/path/aaa_tags",
  "/path/bbb_tags",
}

```

### 4.4 lazyvim的swap文件
```
~/.local/state/nvim/swap
```

### 4.5 lazyvim 剪贴板异常

- 查看 当前使用的是 X11（Xorg） 还是 Wayland 桌面环境
```
echo $XDG_SESSION_TYPE
输出
x11 → 表示正在使用 X11
wayland → 表示正在使用 Wayland
```

- 安装剪贴板支持工具
```
X11
sudo apt install xclip

Wayland
sudo apt install wl-clipboard
```

