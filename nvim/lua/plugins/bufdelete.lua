return {
  "famiu/bufdelete.nvim",
  keys = {
    { "<leader>q", function() require("bufdelete").bufdelete(0) end, desc = "Delete current buffer" },
  },
}
