return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "bash", "c", "html", "javascript", "json", "lua",
        "markdown", "python", "typescript", "vim", "yaml",
      },
    })
  end,
}
