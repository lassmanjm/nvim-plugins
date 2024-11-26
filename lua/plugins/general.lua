require("plugins.keymaps_and_options")
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
		"echasnovski/mini.files",
		version = "*",
		config = function()
			local mini_files = require("mini.files")
			mini_files.setup({})

			-- Open file explorer with leader-e
			vim.keymap.set("n", "<leader>e", mini_files.open)
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		lazy = false,
		config = function()
			require("vscode").setup({})
			vim.cmd.colorscheme("vscode")

			vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local auto_theme = require("lualine.themes.auto")
			auto_theme.normal.a.bg = "#0b93f4"
			auto_theme.normal.b.fg = "#3ca8f6"
			require("lualine").setup({ options = { theme = auto_theme } })
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"mechatroner/rainbow_csv",
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	"tpope/vim-commentary",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"bkad/CamelCaseMotion",
		config = function()
			vim.keymap.set("n", "\\w", "<Plug>CamelCaseMotion_w", { desc = "Start of next [W]ord" })
			vim.keymap.set("n", "\\b", "<Plug>CamelCaseMotion_b", { desc = "[B]eggining of previous Word" })
			vim.keymap.set("n", "\\e", "<Plug>CamelCaseMotion_e", { desc = "[E]nd of next word" })
			vim.keymap.set("n", "\\ge", "<Plug>CamelCaseMotion_ge", { desc = "[E]nd of previous word" })
		end,
	},
	{
		"easymotion/vim-easymotion",
		config = function()
			vim.keymap.set("n", "<leader>m", "<Plug>(easymotion-prefix)", { desc = "easy[M]otion" })
		end,
	},
	{
		"justinmk/vim-sneak",
		config = function()
			vim.keymap.set({ "n", "v" }, "gz", "zz", { desc = "[Z] center cursor on screen", silent = true })
			vim.keymap.set({ "n", "v", "o" }, "z", "<Plug>Sneak_s", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "Z", "<Plug>Sneak_S", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "f", "<Plug>Sneak_f", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "F", "<Plug>Sneak_F", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "t", "<Plug>Sneak_t", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "T", "<Plug>Sneak_T", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "s", "s", { silent = true })
			vim.keymap.set({ "n", "v", "o" }, "S", "S", { silent = true })
		end,
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		config = function()
			local animate = require("mini.animate")
			animate.setup({
				cursor = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
			})
		end,
	},
}
