local configFile = os.getenv("LOCALAPPDATA") .. "\\Arduino15\\arduino-cli.yaml"

return {
   cmd = { "arduino-language-server", "-cli-config", configFile, },
   filetypes = { "arduino" },
   root_dir = vim.fn.expand("%:p:h"),
   capabilities = {
      textDocument = { semanticTokens = vim.NIL },
      workspace = { semanticTokens = vim.NIL },
   },
}
