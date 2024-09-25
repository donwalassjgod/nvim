-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.lsp.handlers["textDocument/hover"] = function() end
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

-- Habilitar transparencias al iniciar Neovim
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

-- Asegúrate de que la línea actual también sea transparente
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })   -- Fondo de la línea del cursor
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' }) -- Número de línea en el cursor

-- Autocomandos para aplicar la configuración al cambiar el esquema de color
vim.cmd([[
augroup TransparentBackground
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
  autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  autocmd ColorScheme * highlight CursorLine ctermbg=none guibg=none
  autocmd ColorScheme * highlight CursorLineNr ctermbg=none guibg=none
augroup END
]])

-- Establecer un esquema de color (opcional)
vim.cmd("colorscheme tokyonight") -- Cambia esto por tu esquema preferido
