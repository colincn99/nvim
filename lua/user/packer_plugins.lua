local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim"} -- Have packer manage itself
  use { "nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "18603eb" }
	use {"folke/which-key.nvim", commit = "4433e5e"}

  -- Editor Symbols
  use { "petertriho/nvim-scrollbar" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "chentoast/marks.nvim", commit = "76aca50"}

	-- Colorschemes
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }

	-- Cmp 
  use { "hrsh7th/nvim-cmp", commit = "ae644fe" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "hrsh7th/cmp-cmdline", commit = "d250c63"}
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

	-- Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine

	-- LSP
	use { "neovim/nvim-lspconfig", commit = "0b8165c" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	-- use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "nvimtools/none-ls.nvim", commit = "cfa65d8" }
  use { "RRethy/vim-illuminate", commit = "5eeb795" }
  use { "mechatroner/rainbow_csv", commit = "6955d13a65e0161e8dad488b6045441d527d62ec"}

	-- Telescope
	use { "nvim-telescope/telescope.nvim", commit = "721cdcae134eb5c564cb6c9df6c317c3854528ad"}
	use { "nvim-telescope/telescope-live-grep-args.nvim", commit = "851c0997d55601f2afd7290db0f90dc364e29f58"}

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", commit = "3de418e73d5b912096229aaeea8bb7aef5094e0d"}
  use { "nvim-treesitter/nvim-treesitter-textobjects", commit = "95cf394", after = "nvim-treesitter", requires = "nvim-treesitter/nvim-treesitter"}

	-- Git
	use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }
  use { "sindrets/diffview.nvim", commit ="3dc498c9777fe79156f3d32dddd483b8b3dbd95f" }

  -- Other
  use { "hedyhli/outline.nvim", commit = "8c6b11e4c27bca690bfde0c6ce35ba66a805dfa3" }
  use { "HiPhish/rainbow-delimiters.nvim", commit = "0543d6f"}
  use { "karb94/neoscroll.nvim", commit = "532dcc8"}
  use { "kylechui/nvim-surround", commit = "ec2dc76"}
  use { "alexghergh/nvim-tmux-navigation", commit = "4898c98"}
  use { "jessekelighine/vindent.vim", commit = "f8433c1"}
  use { "easymotion/vim-easymotion", commit = "b3cfab2"}
  use { "mikavilpas/yazi.nvim", commit = "ac97d7c"}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
