-- Set mode names
local modeNames = {
   ["n"] = "NORMAL",
   ["i"] = "INSERT",
   ["v"] = "VISUAL",
   ["V"] = "VISUAL LINE",
   [""] = "VISUAL BLOCK",
   ["s"] = "SELECT",
   ["S"] = "SELECT LINE",
   [""] = "SELECT BLOCK",
   ["c"] = "COMMAND",
   ["R"] = "REPLACE",
   ["t"] = "TERMINAL",
}

-- Create custom highlight groups for different modes
local modeHighlights = {
   ["n"] = "StatusLineNormal",
   ["i"] = "StatusLineInsert",
   ["v"] = "StatusLineVisual",
   ["V"] = "StatusLineVisual",
   [""] = "StatusLineVisual",
   ["s"] = "StatusLineSelect",
   ["S"] = "StatusLineSelect",
   [""] = "StatusLineSelect",
   ["c"] = "StatusLineCommand",
   ["R"] = "StatusLineReplace",
   ["t"] = "StatusLineTerminal",
}
local modeBorderHighlights = {
   ["n"] = "StatusLineBorderNormal",
   ["i"] = "StatusLineBorderInsert",
   ["v"] = "StatusLineBorderVisual",
   ["V"] = "StatusLineBorderVisual",
   [""] = "StatusLineBorderVisual",
   ["s"] = "StatusLineBorderSelect",
   ["S"] = "StatusLineBorderSelect",
   [""] = "StatusLineBorderSelect",
   ["c"] = "StatusLineBorderCommand",
   ["R"] = "StatusLineBorderReplace",
   ["t"] = "StatusLineBorderTerminal",
}

-- Function to generate status line content
MyStatusline = function()
   local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 1)
   local output = ""
       -- Say what mode we're in
       .. "%#" .. modeHighlights[mode] .. "#"
       .. " " .. modeNames[mode] .. " "
       -- Fancy border thing
       .. "%#" .. modeBorderHighlights[mode] .. "#"
       .. "󰧂 󰋑 󰫣"
       -- Path to file being edited
       .. "%##"
       .. " %<%F "
       -- Show if file has been changed
       .. "%#CursorLineNr#"
       .. "%{&modified ? '󱞈' : ''}"
       -- Rest of status line
       .. "%##"
       .. "%="  -- Fills spacing to right

   -- Show errors/warnings/etc. from LSP
   local count = vim.diagnostic.count()
   local signs = vim.diagnostic.config().signs.text
   if count[1] ~= nil then
      output = output .. "%#DiagnosticError# " .. signs[1] .. " " .. count[1] .. " "
   end
   if count[2] ~= nil then
      output = output .. "%#DiagnosticWarn# " .. signs[2] .. " " .. count[2] .. " "
   end
   if count[3] ~= nil then
      output = output .. "%#DiagnosticInfo# " .. signs[3] .. " " .. count[3] .. " "
   end
   if count[4] ~= nil then
      output = output .. "%#DiagnosticHint# " .. signs[4] .. " " .. count[4] .. " "
   end
   return output
end

-- Create auto-command to trigger when color scheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      -- Get terminal colors from color scheme
      local red = vim.g.terminal_color_1
      local green = vim.g.terminal_color_2
      local yellow = vim.g.terminal_color_3
      local blue = vim.g.terminal_color_4
      local purple = vim.g.terminal_color_5
      local cyan = vim.g.terminal_color_6
      local white = vim.g.terminal_color_7
      -- Set custom highlight groups
      local statusbg = "#" .. string.format("%06x", vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg)
      vim.api.nvim_set_hl(0, "StatusLineNormal", { fg = statusbg, bg = purple, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineVisual", { fg = statusbg, bg = blue, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineInsert", { fg = statusbg, bg = yellow, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineSelect", { fg = statusbg, bg = green, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineReplace", { fg = statusbg, bg = red, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineCommand", { fg = statusbg, bg = cyan, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineTerminal", { fg = statusbg, bg = white, bold = true })
      vim.api.nvim_set_hl(0, "StatusLineBorderNormal", { fg = purple })
      vim.api.nvim_set_hl(0, "StatusLineBorderVisual", { fg = blue })
      vim.api.nvim_set_hl(0, "StatusLineBorderInsert", { fg = yellow })
      vim.api.nvim_set_hl(0, "StatusLineBorderSelect", { fg = green })
      vim.api.nvim_set_hl(0, "StatusLineBorderReplace", { fg = red })
      vim.api.nvim_set_hl(0, "StatusLineBorderCommand", { fg = cyan })
      vim.api.nvim_set_hl(0, "StatusLineBorderTerminal", { fg = white })
      -- Format status line
      vim.opt.statusline = "%!v:lua.MyStatusline()"
   end
})
