-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" }
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "zipPlugin",
        "tohtml",
        "rplugin",
        "spellfile",
        "shada",
        "tarPlugin",
        "tutor",
        -- "matchit",
        -- "matchparen",
      },
    },
  },
  install = {
    colorscheme = { "catppuccin", "tokyonight", "habamx" },
  },
  defaults = {
    lazy = true
  }
})
