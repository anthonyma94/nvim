-- Buffer tabs at the top
return {{
    "nvim-mini/mini.tabline",
    version = "^0.14",
    event = "VeryLazy",
    config = function()
        require("mini.tabline").setup()
    end
}}
