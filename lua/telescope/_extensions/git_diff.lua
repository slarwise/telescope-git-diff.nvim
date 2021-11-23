local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugins requires nvim-telescope/telescope.nvim')
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local previewers = require "telescope.previewers"

local git_diff = function(opts)
    opts = opts or {}

    local diff_against = opts.diff_against or "main"

    local cmd = {"git", "diff", "--name-only", diff_against}

    pickers.new(opts, {
        prompt_title = string.format("Git diff %s", diff_against),
        finder = finders.new_oneshot_job(cmd, opts),
        previewer = previewers.git_file_diff.new(opts),
        sorter = conf.file_sorter(opts),
    }):find()
end

 return telescope.register_extension {
     exports = { git_diff = git_diff },
 }
