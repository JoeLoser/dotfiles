return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "‾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "│",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
		},
	},
}

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   pattern = "*",
--   callback = function()
--     vim.cmd [[
--       hi GitSignsChangeInline gui=reverse
--       hi GitSignsAddInline gui=reverse
--       hi GitSignsDeleteInline gui=reverse
--     ]]
--   end
-- })
