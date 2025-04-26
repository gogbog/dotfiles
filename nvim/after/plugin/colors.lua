
-- Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
-- If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
-- (see <http://sunaku.github.io/tmux-24bit-color.html#usage> for more information.)

vim.cmd("syntax on")
-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },

    colors = {
        redish = "#c9626b",
    },
    highlights = {
        ["@property"] = {fg = '$redish'} -- Alternative if `@field` doesn't work
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

require('onedark').load()

function ColorMyPencils(color)

    -- Hide the characters in FloatBorder
    vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })

    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })
    -- Hide the characters in CursorLineBg
    vim.api.nvim_set_hl(0, 'CursorLineBg', {
        fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
    })

    --    vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
    --    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
    --
    -- vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
    --
    --    vim.api.nvim_set_hl(0, "BufferlineFill", { bg = "#292e38" })
    --    vim.api.nvim_set_hl(0, "BufferlineBackground", { bg = "#616e87" })
    --
end


ColorMyPencils()



