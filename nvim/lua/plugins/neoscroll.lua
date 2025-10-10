return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      -- Keys mapped to default scrolling animations
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'},

      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches scrolloff
      cursor_scrolls_alone = true, -- Cursor keeps scrolling if window can't scroll further
      easing_function = nil,       -- Default easing function
      pre_hook = nil,              -- Function before scrolling
      post_hook = nil,             -- Function after scrolling
      performance_mode = false,    -- Disable performance mode
    })
  end,
}

