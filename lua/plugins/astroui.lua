-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin-mocha",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      -- add new user interface icon
      VimIcon = "",
      CurrentLine = "",
      ScrollText = "",
      FileEncoding = "󰉿",
      Win = "", -- e70f
      Mac = "", -- e711
      Unix = "", -- e712
    },
    -- modify variables used by heirline but not defined in the setup call directly
    status = {
      -- define the separators between each section
      separators = {
        left = { "", " " }, -- separator for the left side of the statusline
        right = { " ", "" }, -- separator for the right side of the statusline
      },
      -- add new colors that can be used by heirline
      colors = function(hl)
        local get_hlgroup = require("astroui").get_hlgroup
        hl.mode_fg = get_hlgroup("TabLine").bg
        hl.lsp_fg = get_hlgroup("Comment").fg
        hl.nav_fg = hl.mode_fg
        return hl
      end,
      attributes = {
        mode = { bold = true },
      },
      icon_highlights = {
        -- file_icon = {
        --   statusline = false,
        -- },
      },
    },
  },
}
