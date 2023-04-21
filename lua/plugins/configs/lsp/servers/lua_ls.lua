return {
  Lua = {
    runtime = {
      -- Tell the LS (langauge server) that we're using LuaJIT!
      version = "LuaJIT",
      path = {
	vim.split(package.path, ";"),
	"lua/?.lua",
	"lua/?/init.lua",
      },
      pathStrict = false,
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	[vim.fn.expand("data" .. "/lazy/lazy.nvim/lua/lazy")] = true,
      },
      MaxPreload = 100000,
      preloadFileSize = 10000,
    },
    telemetry = { enable = false },
  },
}

