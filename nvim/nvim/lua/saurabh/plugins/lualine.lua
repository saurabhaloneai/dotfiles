return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    
    -- Gruvbox Hard Dark colors
    local colors = {
      bg = "#1d2021",        -- Hard background
      bg1 = "#3c3836",       -- Slightly lighter
      bg2 = "#504945",
      fg = "#ebdbb2",        -- Main foreground
      fg_dim = "#a89984",    -- Dimmed text
      
      -- Gruvbox accent colors
      red = "#fb4934",       -- Bright red
      green = "#b8bb26",     -- Bright green
      yellow = "#fabd2f",    -- Bright yellow
      blue = "#83a598",      -- Bright blue
      aqua = "#8ec07c",      -- Bright aqua
      purple = "#d3869b",    -- Bright purple
      orange = "#fe8019",    -- Bright orange
      
      inactive_bg = "#3c3836",
    }
    
    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg_dim, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg_dim },
        c = { bg = colors.inactive_bg, fg = colors.fg_dim },
      },
    }
    
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange }, -- Gruvbox orange
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
