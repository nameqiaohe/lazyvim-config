return {
  -- 设置 Catppuccin 为主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- 默认使用 mocha 变体
    },
  },

  -- Catppuccin 插件配置
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- 启动时加载
    priority = 1000, -- 高优先级确保先加载
    opts = {
      flavour = "mocha", -- 可选：latte, frappe, macchiato, mocha
      transparent_background = true, -- 透明背景（可选）
      styles = {
        comments = { "italic" }, -- 注释斜体（可选）
      },
      integrations = {
        cmp = true, -- 启用补全菜单样式
        telescope = true, -- 启用 Telescope 样式
      },
    },
  },
}
