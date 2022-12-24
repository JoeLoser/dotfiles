local options = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "cmake",
    "dockerfile",
    "json",
    "llvm",
    "make",
    "ninja",
    "python",
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

require("nvim-treesitter.configs").setup(options)
