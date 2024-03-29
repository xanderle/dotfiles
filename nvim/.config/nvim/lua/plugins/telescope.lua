require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

require('telescope').load_extension('dap')
-- require('telescope').load_extension('octo')
-- require('telescope').load_extension('project')
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap("n", "<Leader>f", "[tele]", {})
vim.api.nvim_set_keymap("n", "[tele]f",
                        "<cmd>Telescope find_files theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]g",
                        "<cmd>Telescope live_grep theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]G",
                        "<cmd>Telescope git_status theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]b",
                        "<cmd>Telescope buffers theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]r",
                        "<cmd>Telescope lsp_references theme=get_dropdown<CR>",
                        {})
