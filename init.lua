-- lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
	"folke/lazy.nvim",
	"folke/tokyonight.nvim",
	"nvim-tree/nvim-tree.lua",
	"lewis6991/gitsigns.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"ibhagwan/fzf-lua",
	"yamatsum/nvim-cursorline",
	"nvim-lualine/lualine.nvim",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		}
	}
})

-- plugin setting
require('nvim-tree').setup()
require('gitsigns').setup()
require('ibl').setup()
require('nvim-cursorline').setup()
require('noice').setup()
require('lualine').setup()

-- color scheme setting
vim.o.background = "dark" -- or "light" for light mode
vim.cmd('colorscheme tokyonight')

-- keymap setting
vim.keymap.set('n', '<C-j>', '5<DOWN>');
vim.keymap.set('n', '<C-k>', '5<UP>');
vim.keymap.set('v', '<C-j>', '5<DOWN>');
vim.keymap.set('v', '<C-k>', '5<UP>');

vim.cmd("command! F  :FzfLua")
vim.cmd("command! FF :FzfLua files")
vim.cmd("command! FH :FzfLua oldfiles")
vim.cmd("command! FL :FzfLua blines")
vim.cmd("command! NT :NvimTreeToggle")
-- bug? https://github.com/neovim/neovim/issues/23590 CurSearch後カーソルが遅い問題
vim.cmd('hi! link CurSearch Search')
