-- Reference
-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/heirline-nvchad-statusline/init.lua

return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      local file_format = status.provider.file_format()
      local get_icon = require("astroui").get_icon
      local lualine_mode = require("astroui.status.hl").lualine_mode
      -- local C = require("catppuccin.palettes").get_palette()

      local SystemMap = {
        -- type = { icon_name, name }
        unix = { "Unix", "LF" },
        dos = { "Win", "CRLF" },
        mac = { "Mac", "CR" },
      }

      local isScreenWidthWide = function()
        local width = status.utils.width()
        return width > 100
      end

      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          mode_text = { padding = { left = 1, right = 1 } },
        },
        status.component.git_branch { padding = { left = 1 } },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp {
          lsp_client_names = {
            truncate = 0.15,
          },
          surround = { separator = "right" },
        },
        status.component.virtual_env(),
        -- File Encoding
        status.component.builder {
          { provider = function() return get_icon("FileEncoding", 1) end },
          { provider = "file_encoding" },
          update = { "BufEnter", "WinEnter" },
          surround = {
            separator = "right",
            condition = isScreenWidthWide,
          },
        },
        -- File Format
        status.component.builder {
          {
            provider = function()
              local format = file_format():lower()
              local icon = SystemMap[format] and SystemMap[format][1] or ""
              return get_icon(icon, 1)
            end,
          },
          {
            provider = function()
              local format = file_format():lower()
              return SystemMap[format][2]
            end,
          },
          update = { "BufEnter", "WinEnter" },
          surround = {
            separator = "right",
            condition = status.condition.is_file,
          },
        },
        status.component.file_info {
          file_modified = false,
          file_read_only = false,
          surround = { separator = "none" },
        },
        status.component.nav {
          ruler = {
            icon = { kind = "CurrentLine" },
          },
          percentage = {
            icon = { kind = "ScrollText", padding = { right = 1 } },
          },
          scrollbar = false,
          padding = { left = 1, right = 1 },
          surround = {
            separator = "right",
            color = { main = lualine_mode("normal", "None") },
          },
        },
      }
    end,
  },
}
