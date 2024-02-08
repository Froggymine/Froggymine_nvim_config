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


require("lazy").setup({
        -- Themes
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

        {"nvim-lualine/lualine.nvim"},
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
            },
            lazy = false,
        },

        -- LSPs
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        {"neovim/nvim-lspconfig"},
})

-- Leaderkey set
vim.g.mapleader = ","
vim.g.maplocalleader = ","

--------------- Plugin setup ----------------

require('lualine').setup {}

require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = {
                enable = true,
        },
        indent = {
                enable = false,
        },
}

-- Commenter setup
require('Comment').setup()

-- LSP setup
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()

lspconfig.pyright.setup {
        settings = {
                pyright = {
                        typeCheckingMode = 'off'
                }
        }
}


-- Theme set
vim.cmd("colorscheme catppuccin-mocha")

-------------- VIM setup -------------------

-- Custom Commands
vim.api.nvim_create_user_command("EditConfig", "tabedit ~//.config//nvim//init.lua", {})

-- Relative line numbers
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.shiftwidth = 4
vim.opt.expandtab = true
