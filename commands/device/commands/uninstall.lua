config.env.check_admin()

local tools = require("tools.tools")

if config.args.name then
    if not tools.uninstall_tool(config.args.name) then
        terminal_body:print("failed to uninstall '" .. config.args.name .. "'")
    end
    return
end

tools.uninstall()
