return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",  -- lazy-load when Neovim is idle
  opts = {
    options = {
      indicator = { icon = ' ' },
      show_close_icon = false,
      tab_size = 1,
      max_name_length = 25,
      offsets = {
        {
          filetype = 'neo-tree',
          text = '  Files',
          highlight = 'StatusLine',
          text_align = 'left',
        },
      },
      separator_style = { '|', '|', '|', '|', '|' },
      modified_icon = '',
      custom_areas = {
        left = function()
          return {
            { text = '    ', fg = '#8fff6d' },
          }
        end,
      },
    },
    highlights = {
      fill = {
        bg = { attribute = 'bg', highlight = 'BufferlineFill' },
      },
    },
  },
}

