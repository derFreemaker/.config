local t = {}

---@param command argparse.Command
function t.config(command)
    command:command_target("device_command")

    local device_commands_path = "./commands/device/commands/"
    for file in lfs.dir(device_commands_path) do
        local attr = lfs.attributes(device_commands_path .. file)
        if attr.mode == "file" then
            file = file:match("(.+)%..+$") or file
            command
                :command(file, "run " .. file .. " scripts")
                :argument("tools", "All the tools the command should act on.")
                    :args("*")
        end
    end
end

function t.execute()
    print("running in device mode")

    -- register all tools
    require("register")

    -- call command
    require("commands.device.commands." .. config.args.device_command)
end

return t
