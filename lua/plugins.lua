-- Add plugins
vim.pack.add({
   {  -- Copilot
      src = "https://github.com/github/copilot.vim",
   },
   {  -- Color scheme
      src = "https://codeberg.org/jthvai/lavender.nvim",
   },
   {  -- Transparent background
      src = "https://github.com/xiyaowong/transparent.nvim",
   },
   {  -- Tree-sitter (for syntax highlighting and some plugins)
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
   },
   {  -- Auto pairs
      src = "https://github.com/windwp/nvim-autopairs",
   },
   {  -- Adds vertical lines to mark indents
      src = "https://github.com/lukas-reineke/indent-blankline.nvim",
   },
   {  -- For icons in oil (file explorer)
      src = "https://github.com/nvim-mini/mini.icons",
   },
   {  -- File explorer (Steve's oil)
      src = "https://github.com/stevearc/oil.nvim",
   },
})

-- Set color scheme
vim.cmd.colorscheme("lavender")

-- Install tree-sitter parsers
require("nvim-treesitter").install({ "python", "arduino" })

-- Plugin configurations
require("nvim-autopairs").setup()
require("ibl").setup({ indent = { char = "┊" }, })
require("mini.icons").setup()
require("oil").setup()
