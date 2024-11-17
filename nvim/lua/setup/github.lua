local key = require("lib.key")

function I(cond)
    return function(a, b)
        if cond then
            return a
        end
        return b
    end
end

local gcIsOn = true
-- toggle github copilot
key.set('n', 'q', function()
    local comd = I(gcIsOn)(":Copilot disable", ":Copilot enable")
    vim.cmd(comd)
    gcIsOn = not gcIsOn
    print("Github Copilot is now " .. (gcIsOn and "enabled" or "disabled"))
end)

