vim.api.nvim_create_autocmd("FileType", {
   pattern = { "*" },
   callback = function(type)
      -- Enable highlighting from tree-sitter
      local lang = vim.treesitter.language.get_lang(type.match)
      if vim.treesitter.language.add(lang) then
         vim.treesitter.start()
      end
      -- Set tab/indentation options
      vim.opt.expandtab = true
      vim.opt.formatoptions = ""
      vim.opt.cindent = true
      -- Set default indent width
      vim.opt.shiftwidth = 3
      vim.opt.tabstop = 3
      vim.opt.softtabstop = 3
   end
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "python" },
   callback = function()
      -- Use four-space indents for Python files
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "markdown" },
   callback = function()
      -- Use two-space indents for markdown files
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
   end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
   callback = function()
      local ftype = vim.bo.filetype
      if ftype == "lua" then
         -- Format Lua files using LSP
         vim.lsp.buf.format()
      end
   end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
   callback = function()
      local ftype = vim.bo.filetype
      if ftype == "c" or ftype == "cpp" or ftype == "arduino" then
         -- Format C/C++ and Arduino files using clang-format
         vim.cmd("silent !clang-format -i % --style=file:"
            .. vim.fn.stdpath("config") .. "/.clang-format")
      elseif ftype == "python" then
         -- Format Python files using Ruff
         vim.cmd("silent !ruff format %")
      end
   end,
})
