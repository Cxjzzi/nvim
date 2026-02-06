-- Editing Settings
vim.opt.number = true       -- Gives me line numbers
vim.opt.cursorline = true   -- Gives me the wondering highlight
vim.opt.wrap = true         -- Lets the words wrap rather than go off screen
vim.opt.linebreak = true    -- Wraps at word boundaries
vim.opt.breakindent = true  -- Wraps indent to match 1st line
vim.opt.spell = true        -- Spellcheck on comments and text

-- Windowing behaviour
vim.opt.splitright = true      -- New vertical splits go to the right
vim.opt.splitbelow = true      -- New horizontal splits go below
vim.opt.winborder = "rounded"  -- Rounded borders for floating windows

-- Set up status column
vim.opt.signcolumn = "yes"         -- Always show signcolumn
vim.opt.statuscolumn = " %s %l  "  -- Configure statuscolumn
vim.opt.showmode = false           -- Hides mode since statusline shows it

-- Misc
vim.opt.clipboard = "unnamedplus"  -- Changes program clipboard to windows clipboard
vim.opt.autochdir = true           -- Changes working directory to the file I'm editing
