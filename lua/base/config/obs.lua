require('obsidian').setup({
    workspaces = {
        {
          name = "math",
          path = "~/vaults/math",
        },
    },
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
        local correct_name = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            -- correct_name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9]", ""):lower()
            correct_name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9A-Яа-я]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                correct_name = correct_name .. string.char(math.random(65, 90))
            end
        end
        return correct_name
    end,
})

-- need for some obsidian features
vim.opt.conceallevel = 2
