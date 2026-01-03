return {
  { "L3MON4D3/LuaSnip" },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    config = function()
      require("blink.cmp").setup({
        snippets = { preset = "luasnip" },
        completion = {
          documentation = { auto_show = true },
        },
      })
    end,
  },
}
