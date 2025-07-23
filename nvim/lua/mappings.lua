require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
-- vim.keymap.set("n", "<leader>fg", builtin.commands, { desc = "Telescope live_grep" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
