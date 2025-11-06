-- -- TODO: use file_ignore_patterns to ignore .git and third-party code.
-- -- For now, am just using a local .rgignore file within each project
-- ts = require("telescope")
-- ts.setup()
--
-- -- To get fzf loaded and working with telescope, you need to call
-- -- -- load_extension, somewhere after setup function:
-- ts.load_extension("fzf")
--
-- local builtin = require("telescope.builtin")
-- -- TODO: does this do hidden=true for find_files by using the builtin?
-- vim.keymap.set("n", "<leader>f", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>b", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -s. -B build -D CMAKE_BUILD_TYPE=Release && cmake --build build --config release && cmake --install build --prefix build",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
}

-- TODO: does this do hidden=true for find_files by using the builtin?
-- vim.keymap.set("n", "<leader>f", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>b", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
