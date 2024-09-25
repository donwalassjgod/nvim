return {
  -- Habilita nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require('cmp')
      return {
        completion = {
          autocomplete = {}, -- Desactiva el autocompletado automático
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),            -- Usa Ctrl+Space para abrir el autocompletado
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Aceptar selección con Enter
        },
        sources = {
          { name = 'buffer' },   -- Completar desde el buffer actual
          { name = 'nvim_lsp' }, -- Habilitar autocompletado desde LSP
          -- Puedes agregar más fuentes si lo deseas
        },
      }
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    enabled = false, -- Desactiva lsp_signature.nvim
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local lspconfig = require('lspconfig')
      -- Configuración de servidores LSP
      lspconfig.pyright.setup {} -- Configuración para Python
      lspconfig.clangd.setup {}  -- Configuración para C++ con clangd
    end,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.lsp.signature = {
        auto_open = { enabled = false }, -- Desactivar apertura automática de firmas
      }
    end,
  },
}
