vim.opt.clipboard = "unnamedplus"
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
