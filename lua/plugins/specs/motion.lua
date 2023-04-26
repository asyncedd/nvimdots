return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion(\"w\")<CR>", mode = { "n", "v", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion(\"e\")<CR>", mode = { "n", "v", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion(\"b\")<CR>", mode = { "n", "v", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion(\"ge\")<CR>", mode = { "n", "v", "o", "x" } },
    },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      -- The below settings make Leap's highlighting closer to what you've been
      -- used to in Lightspeed.

      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
      vim.api.nvim_set_hl(0, "LeapMatch", {
        -- For light themes, set to 'black' or similar.
        fg = "white", bold = true, nocombine = true,
      })
      -- Of course, specify some nicer shades instead of the default "red" and "blue".
      vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
        fg = "pink", bold = true, nocombine = true,
      })
      vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
        fg = "blue", bold = true, nocombine = true,
      })
      -- Try it without this setting first, you might find you don't even miss it.
      require("leap").opts.highlight_unlabeled_phase_one_targets = true

      require("leap").add_default_mappings()
    end,
    keys = {
      { "s", mode = { "n", "v", "o", "x" } },
      { "S", mode = { "n", "v", "o", "x" } },
      { "x", mode = { "v", "o" } },
      { "X", mode = { "v", "o" } },
      {
        "<leader>s",
        function()
          local function get_line_starts(winid)
            local wininfo =  vim.fn.getwininfo(winid)[1]
            local cur_line = vim.fn.line('.')

            -- Get targets.
            local targets = {}
            local lnum = wininfo.topline
            while lnum <= wininfo.botline do
              local fold_end = vim.fn.foldclosedend(lnum)
              -- Skip folded ranges.
              if fold_end ~= -1 then
                lnum = fold_end + 1
              else
                if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
                lnum = lnum + 1
              end
            end
            -- Sort them by vertical screen distance from cursor.
            local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
            local function screen_rows_from_cur(t)
              local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
              return math.abs(cur_screen_row - t_screen_row)
            end
            table.sort(targets, function (t1, t2)
              return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
            end)

            if #targets >= 1 then
              return targets
            end
          end

          -- Usage:
          local winid = vim.api.nvim_get_current_win()
          require('leap').leap {
            target_windows = { winid },
            targets = get_line_starts(winid),
          }
        end,
        mode = { "o", "v", "n" },
      },
    },
  },
  {
    "ggandor/flit.nvim",
    config = true,
    keys = {
      { "f", mode = { "n", "x" } },
      { "F", mode = { "n", "x" } },
      { "t", mode = { "n", "x" } },
      { "T", mode = { "n", "x" } },
    },
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
  {
    "ggandor/leap-spooky.nvim",
    config = true,
    keys = {
      "d",
      "y",
      "g",
      "zf",
      "c",
      "g~",
      "gu",
      "gU",
      "g?",
      "<",
      ">",
      "gq",
      "!",
      "=",
    },
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
  {
    "ziontee113/syntax-tree-surfer",
    opts = {
      left_hand_side = "qwertyasdfghzxcvb",
      right_hand_side = "jkl;oiu.,mpy/n",
    },
    config = true,
    cmd = {
      "STSPrintNodesAtCursor",
    },
    keys = {
      {
        "<leader>ss",
        function()
          require("syntax-tree-surfer").targeted_jump({
            "function",
            "arrow_function",
            "function_definition",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
            --"field",
            "table_constructor",
            "identifier",
            "expression_list",
            "return_statement",
            -- "chunk",
          })
        end,
      },
    }
  },
}
