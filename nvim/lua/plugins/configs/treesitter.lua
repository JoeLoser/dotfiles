local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

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

treesitter.setup(options)
