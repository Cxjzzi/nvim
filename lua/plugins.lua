-- Adding Plug In

vim.pack.add({
   -- Copilot
   {
      src = "https://github.com/github/copilot.vim"
   },

   -- Color Scheme
   {
      src = "https://codeberg.org/jthvai/lavender.nvim"
   },

   -- Transparent Background
   {
      src = "https://github.com/xiyaowong/transparent.nvim"
   },

   -- Tree Sitter (Syntax Highlighting)
   {
      src = "https://github.com/nvim-treesitter/nvim-treesitter"
   },

   -- Auto Pairs
   {
      src = "https://github.com/windwp/nvim-autopairs"
   },


   -- Adds the lines to the indents
   {
      src = "https://github.com/lukas-reineke/indent-blankline.nvim"
   },

   -- For organizing oil (file explorer)
   {
      src = "https://github.com/nvim-mini/mini.icons"
   },
   -- File Explorer (steve's oil)
   {
      src = "https://github.com/stevearc/oil.nvim"
   },

})

vim.cmd.colorscheme("lavender")

-- Plugin Configurations

-- Install Tree Sitter Parsers
require("nvim-treesitter").install({ "python", "arduino" })

-- Auto Start Tree Sitter Based On File Type
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "*" },
   callback = function(type)
      local lang = vim.treesitter.language.get_lang(type.match)
      if vim.treesitter.language.add(lang) then
         vim.treesitter.start()
      end
   end,
})

-- Enable Auto Pairs
require("nvim-autopairs").setup()

-- Enable Indent Blankline
require("ibl").setup({
   indent = {
      char = "┊",
   },
})

-- Enable Mini Icons
require("mini.icons").setup()

-- Enable Oil
require("oil").setup()
