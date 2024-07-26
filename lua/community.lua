-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- UI
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- Editor
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  -- Utility
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  -- Completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.lua" },
}
