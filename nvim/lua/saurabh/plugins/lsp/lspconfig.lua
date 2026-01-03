return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason-org/mason-lspconfig.nvim" },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end

        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        map("n", "gd", vim.lsp.buf.definition, "Definition")
        map("n", "gi", vim.lsp.buf.implementation, "Implementation")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      end,
    })

    -- Diagnostic config
    vim.diagnostic.config({
      virtual_text = true,
      underline = true,
    })

    -- Mason setup
    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      },
    })
  end,
}
