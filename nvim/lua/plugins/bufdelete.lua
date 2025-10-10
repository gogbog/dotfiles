return {
  "famiu/bufdelete.nvim",
  -- Keymap for normal mode to delete current buffer
  config = function()
    vim.keymap.set("n", "<leader>q", function()
      require("bufdelete").bufdelete(0)  -- 0 = current buffer
    end, { noremap = true, silent = true, desc = "Delete current buffer" })
  end
}
