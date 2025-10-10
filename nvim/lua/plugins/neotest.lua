return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    ft = { "go", "lua" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
      {
        "fredrikaverpil/neotest-golang",
        version = "*",  -- Optional, but recommended; track releases
        build = function()
          vim.system({"go", "install", "gotest.tools/gotestsum@latest"}):wait() -- Optional, but recommended
        end,
      },
    },
    config = function()
      local config = {
        runner = "gotestsum", -- Optional, but recommended
      }

      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-golang")(config),
        },
      })

      -- Keybindings for running and debugging tests
      vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end, { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run all tests in file" })
      vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.fn.getcwd()) end, { desc = "Run all tests in project" })
      vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
      vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { desc = "Show test output" })
      vim.keymap.set("n", "<leader>tq", function() neotest.run.stop() end, { desc = "Stop running tests" })

      -- Optional debugging keymaps (requires nvim-dap + nvim-dap-go)
      if pcall(require, "dap-go") then
        local dapgo = require("dap-go")
        vim.keymap.set("n", "<leader>dr", function() dapgo.debug_test() end, { desc = "Debug nearest test" })
        vim.keymap.set("n", "<leader>df", function() dapgo.debug_test(vim.fn.expand("%")) end, { desc = "Debug all tests in file" })
        vim.keymap.set("n", "<leader>da", function() dapgo.debug_test(vim.fn.getcwd()) end, { desc = "Debug all tests in project" })
      end
    end,
  },
}
