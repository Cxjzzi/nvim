-- Editing Settings
vim.opt.number = true -- Gives me line numbers
vim.opt.cursorline = true --Gives me the wondering highlight
vim.opt.wrap = true --Lets the words wrap rather then go off screen
vim.cmd.colorscheme("catppuccin") -- Sets this as default color scheme, rmb to get to color scheme : colo 	(space then tab)

vim.opt.expandtab = true --Makes tabs as spaces instead of char

vim.opt.cindent = true -- Autoindents like in c 

--Sets the tab size
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.softtabstop = 3

vim.opt.spell = true --Spellcheck on comments and text 

vim.opt.clipboard = "unnamedplus" -- Changes program clipboard to windows clipboard

-- vim.opt.statusline

vim.opt.splitright = true -- New vertical splits go to the right
vim.opt.splitbelow = true -- New horizontal splits go below

-- Adding Plug In

vim.pack.add({
   {
      src = "https://github.com/github/copilot.vim"
   }
})
   
--
