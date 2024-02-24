return {
    {
        'navarasu/onedark.nvim',
        config = function()
            local onedark = require("onedark")
            onedark.setup {
                style = 'darker',
                transparent = true,
                code_style = {
                    comments = 'none',
                },
            }
            onedark.load()
        end
    },
}
