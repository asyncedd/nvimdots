local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "catppuccin/nvim",
    config = function()
      coroutine.resume(coroutine.create(function()
        require("ui.catppuccin")
      end))
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      require("ui.map")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ui.blankline")
    end,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("ui.indentscope")
    end,
    keys = {
      "viii",
      "vaii",
      "viai",
      "vaai",
    },
    init = lazyLoad("mini.indentscope"),
  },
  {
    "folke/noice.nvim",
    config = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "glepnir/dashboard-nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. "dashboard-nvim", {}),
        callback = function()
          local file = vim.fn.expand("%")
          local condition = file == ""

          if condition then
            vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. "dashboard-nvim")

            -- dont defer for treesitter as it will show slow highlighting
            -- This deferring only happens only when we do "nvim filename"
            require("lazy").load({ plugins = "dashboard-nvim" })
          end
        end,
      })
    end,
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      coroutine.resume(coroutine.create(function()
        require("ui.heirline")
      end))
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "gen740/SmoothCursor.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.animate",
    event = {
      "VeryLazy",
    },
    config = function()
      require("ui.animate")
    end,
  },
  {
    "edluffy/specs.nvim",
    config = function()
      require("ui.specs")
    end,
    event = {
      "VeryLazy",
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("ui.illuminate")
    end,
    event = "VeryLazy",
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    init = lazyLoad("nvim-ts-rainbow2"),
    config = function()
      require("ui.rainbow")
    end,
  },
}
