return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = require("configs.ui.indent"),
    dependencies = {
      { "echasnovski/mini.indentscope", version = "*" }
    }
  },
  {
    "monkoose/matchparen.nvim",
    event = "BufReadPost",
    config = require("configs.ui.matcher")
  }
}
