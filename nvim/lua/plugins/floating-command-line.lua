return{
   -- lazy.nvim
   {
       "folke/noice.nvim",
       event = "VeryLazy",
       dependencies = {
           -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
           "MunifTanjim/nui.nvim",
           -- OPTIONAL:
           --   `nvim-notify` is only needed, if you want to use the notification view.
           --   If not available, we use `mini` as the fallback
           "rcarriga/nvim-notify",
       },
       config = function ()
           require("noice").setup({
               lsp = {
                   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                   override = {
                       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                       ["vim.lsp.util.stylize_markdown"] = true,
                       ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                   },
               },
               -- you can enable a preset for easier configuration
               presets = {
                   bottom_search = true, -- use a classic bottom cmdline for search
                   command_palette = true, -- position the cmdline and popupmenu together
                   long_message_to_split = true, -- long messages will be sent to a split
                   inc_rename = false, -- enables an input dialog for inc-rename.nvim
                   lsp_doc_border = false, -- add a border to hover docs and signature help
               },
               notify = {
                   -- Set how long notifications stay visible (in milliseconds)
                   timeout = 2000,  -- example: 2000ms = 2 seconds
                   -- You can also configure the stages (animation)
                   stages = "fade_in_slide_out", -- default, or "fade", "slide", "static"
               },
           })

       end 
   }

}
