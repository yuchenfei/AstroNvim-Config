-- { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/bars-and-lines/bufferline-nvim/init.lua
-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
-- https://github.com/AstroNvim/astrocore/blob/main/lua/astrocore/buffer.lua
-- https://www.lazyvim.org/plugins/ui#bufferlinenvim

return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      -- bufferline mappings
      for lhs, map in pairs {
        ["<Leader>c"] = false,
        ["<Leader>C"] = false,
        ["<Leader>b\\"] = false,
        ["<Leader>b|"] = false,
        ["<Leader>bb"] = { "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
        ["<Leader>bd"] = { function() require("astrocore.buffer").close() end, desc = "Delete buffer" },
        ["<Leader>bD"] = { function() require("astrocore.buffer").close(0, true) end, desc = "Delete buffer (Force)" },
        ["<Leader>bp"] = { "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        ["<Leader>bP"] = { "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
        ["[b"] = { "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
        ["]b"] = { "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        [">b"] = false,
        ["<b"] = false,
        -- Astrocore.buffer sort not working with bufferline
        -- ["<Leader>bs"] = false,
        ["<Leader>bsr"] = false,
        ["<Leader>bsp"] = false,
        ["<Leader>bsi"] = false,
        ["<Leader>bsm"] = false,
        ["<Leader>bse"] = { function() require("bufferline").sort_by "extension" end, desc = "By extension" },
        ["<Leader>bsd"] = { function() require("bufferline").sort_by "directory" end, desc = "By directory" },
        ["<Leader>bst"] = { function() require("bufferline").sort_by "tabs" end, desc = "By tabs" },
      } do
        maps.n[lhs] = map
      end
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.tabline = nil end,
  },
}
