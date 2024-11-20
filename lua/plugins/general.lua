requre("plugins.keymaps_and_options")
return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released

		config = function()
			require("barbar").setup()
			-- Keymappings for bar bar to switch and close buffers
			vim.keymap.set("n", "<leader>j", "<cmd>BufferPrevious<CR>")
			vim.keymap.set("n", "<leader>k", "<cmd>BufferNext<CR>")
			vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<CR>")
			vim.keymap.set("n", "<leader>X", "<cmd>BufferClose!<CR>")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = false, -- Turn into false from true by default
				}
			})

			-- Key mapping for opening and closing file tree
			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
			vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "[T]oggle Nvim [T]ree" })
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		lazy=false,
		config = function()
			vim.cmd.colorscheme("vscode")

			vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = '*',
		config = function()
			require("mini.statusline").setup({})
		end,
	},
}
