local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  git = {
    ignore = false
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" }
  },
})


local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end
-- Open nvim-tree when you open and start Neovim
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
