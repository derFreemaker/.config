---@type lua-term
local term = require("tools.term")

---@class config.utils
local utils = {}

---@param command string
---@param display lua-term.segment_parent | nil
---@return boolean success
---@return integer exitcode
---@return string output
function utils.display_execute(command, display)
    display = display or terminal_body
    local handle = config.env.start_execute(command)

    local stream = term.components.stream.new("execute", display, handle, {
        before = term.colors.foreground_24bit(100, 100, 100) .. "> ",
        after = tostring(term.colors.reset)
    })
    stream:read_all()

    return config.env.end_execute(handle)
end

return utils
