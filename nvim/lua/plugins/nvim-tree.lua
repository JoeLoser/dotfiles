return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "v1.14.0", -- Recommended to use a specific version tag like "v1.23"
		lazy = false, -- Set to false to load on startup, or true to lazy-load on an event
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Optional, for file icons
		},
		config = function()
			-- Disable Netrw (strongly advised)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- Setup nvim-tree with default settings or your customizations
			require("nvim-tree").setup({
				-- Your nvim-tree configuration options here
				-- For example:
				sync_root_with_cwd = true,
				-- respect_gitignore = true,
				-- view = {
				--   width = 30,
				-- },
			})

			-- Optional: Keymap to toggle nvim-tree
			vim.keymap.set("n", "<leader>r", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
			vim.keymap.set("n", "<leader>bn", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree file" })
		end,
	},
}
