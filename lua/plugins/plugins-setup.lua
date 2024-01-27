local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
    "folke/lazy.nvim", -- 更新自己
    "navarasu/onedark.nvim", -- 主题
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }, -- 底部栏
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }, -- 文档树
    "nvim-treesitter/nvim-treesitter", -- 语法高亮
    "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },
         -- 自动补全
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- 文件路径
    "windwp/nvim-autopairs", -- 自动补全括号
}

require("lazy").setup(plugins, opts)
