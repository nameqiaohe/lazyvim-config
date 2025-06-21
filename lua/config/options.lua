-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
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
--vim.opt.tags = {
--  "/path/aaa_tags",
--  "/path/bbb_tags",
--}
