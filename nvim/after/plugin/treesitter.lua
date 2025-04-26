-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
-- require("nvim-tree").setup()
--
require('project_nvim').setup({

})

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 45,
  },
  renderer = {
    group_empty = false,
  },
  filters = {
    dotfiles = true,
    git_clean = false,
    no_buffer = false,
    custom = {
        'node_modules',
        "^.git$",
    },
  },
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    -- update_root = true
  },
})

-- This closes Nvim-tree when it's the only open buffer left
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    -- Check for unsaved buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, "modified") then
        -- If any buffer is modified, show a warning and stop quitting
        vim.notify("You have unsaved changes!", vim.log.levels.WARN)
        return
      end
    end

    -- Collect all NvimTree windows
    local tree_wins = {}
    local wins = vim.api.nvim_list_wins()

    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "NvimTree" then
        table.insert(tree_wins, win)
      end
    end

    -- If only one non-NvimTree window exists, close NvimTree before quitting
    if #tree_wins == #wins - 1 then
      for _, win in ipairs(tree_wins) do
        vim.api.nvim_win_close(win, true)
      end
    end
  end
})


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {"go", "java", "javascript", "rust", "bash", "arduino", "css", "html", "comment", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "c" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c"},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
