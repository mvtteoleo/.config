return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup()
        vim.keymap.set("n", "-", oil.toggle_float, {})
        vim.keymap.set("n", "<leader>e", function()
            vim.cmd("vsplit")
            vim.cmd("vertical resize 30")
            require("oil").open()
        end, { desc = "Open Oil file explorer in vertical split" })

    end,
}
