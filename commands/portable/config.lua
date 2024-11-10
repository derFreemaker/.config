---@param command argparse.Command
return function(command)
    command:command_target("portable_command")

    local device_commands_path = "./commands/portable/commands/"
    for file in lfs.dir(device_commands_path) do
        local attr = lfs.attributes(device_commands_path .. file)
        if attr.mode == "file" then
            file = file:match("(.+)%..+$") or file
            command:command(file, "run " .. file .. " scripts")
        end
    end
end, function()
    print("running in portable mode")
    require("commands.portable.commands." .. config.args.portable_command)
end
