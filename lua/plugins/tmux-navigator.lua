return {
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Left split/pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Down split/pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Up split/pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Right split/pane" },
    },
  },
}
