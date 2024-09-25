local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  ui = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("mason").setup({
  ui = {
    check_outdated_packages_on_open = false,
  },
})

-- Configuración de transparencia
vim.opt.termguicolors = true -- Habilitar colores de 24 bits
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])

-- Configuración del tema
vim.cmd([[colorscheme tokyonight]])
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true

-- Personalizar la notificación de plugins
vim.notify = function(msg, log_level, opts)
  if msg:match("plugin.*installed") or msg:match("plugin.*updated") then
    return
  end
  vim.api.nvim_echo({ { msg } }, true, {})
end
