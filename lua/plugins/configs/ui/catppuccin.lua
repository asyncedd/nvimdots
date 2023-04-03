require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  custom_highlights = function(cp)
    return {
      NormalFloat = { bg = cp.crust },
      FloatBorder = { bg = cp.crust, fg = cp.crust }, VertSplit = { bg = cp.base, fg = cp.surface0 },
      CursorLineNr = { fg = cp.mauve, style = { "bold" } },
      Pmenu = { bg = cp.crust, fg = "" },

      TelescopeSelection = { bg = cp.surface0 },
      TelescopePromptCounter = { fg = cp.mauve, style = { "bold" } },
      TelescopePromptPrefix = { bg = cp.surface0 },
      TelescopePromptNormal = { bg = cp.surface0 },
      TelescopeResultsNormal = { bg = cp.mantle },
      TelescopePreviewNormal = { bg = cp.crust },
      TelescopePromptBorder = { bg = cp.surface0, fg = cp.surface0 },
      TelescopeResultsBorder = { bg = cp.mantle, fg = cp.mantle },
      TelescopePreviewBorder = { bg = cp.crust, fg = cp.crust },
      TelescopePromptTitle = { fg = cp.surface0, bg = cp.surface0 },
      TelescopeResultsTitle = { fg = cp.mantle, bg = cp.mantle },
      TelescopePreviewTitle = { fg = cp.crust, bg = cp.crust },
      IndentBlanklineChar = { fg = cp.surface0 },
      IndentBlanklineContextChar = { fg = cp.surface2 },
      GitSignsChange = { fg = cp.peach },
      NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
      NvimTreeExecFile = { fg = cp.text },

      ["@lsp.type.parameter"] = { fg = cp.red },
      ["@lsp.type.variable"] = { fg = cp.pink },
      ["@lsp.type.function"] = { fg = cp.blue },

      ["@variable"] = { fg = cp.pink },
      ["@parameter"] = { fg = cp.red },

    }
  end,
  color_overrides = {
    mocha = {
      -- base = "#000000",
      -- mantle = "#000000",
      -- crust = "#000000",

      rosewater = "#F5E0DC",
      flamingo = "#F2CDCD",
      mauve = "#DDB6F2",
      pink = "#F5C2E7",
      red = "#F28FAD",
      maroon = "#E8A2AF",
      peach = "#F8BD96",
      yellow = "#FAE3B0",
      green = "#ABE9B3",
      blue = "#96CDFB",
      sky = "#89DCEB",
      teal = "#B5E8E0",
      lavender = "#C9CBFF",

      text = "#D9E0EE",
      subtext1 = "#BAC2DE",
      subtext0 = "#A6ADC8",
      overlay2 = "#C3BAC6",
      overlay1 = "#988BA2",
      overlay0 = "#6E6C7E",
      surface2 = "#6E6C7E",
      surface1 = "#575268",
      surface0 = "#302D41",

      base = "#1E1E2E",
      mantle = "#1A1826",
      crust = "#161320",
    },
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "bold" },
    keywords = { "bold" },
    strings = {},
    variables = {},
    numbers = { "bold" },
    booleans = { "bold" },
    properties = {},
    types = { "bold" },
    operators = {},
  },
  integrations = {
    mini = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "underline" },
        warnings = { "undercurl" },
        information = { "underline" },
      },
    },
    cmp = true,
    treesitter = true,
    ts_rainbow2 = true,
    noice = true,
  },
  compile = {
    enabled = true,
  },
})

