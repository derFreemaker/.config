local lfs = require("lua-config.third-party.lfs")

if not config.env.is_windows then
    print("my config is windows only")
    os.exit(1)
end

config.args_parser:command_target("command")
config.args_parser:flag("-v --verbose")

---@type table<string, fun()>
local commands = {}
for dir in lfs.dir("./commands") do
    local attr = lfs.attributes("./commands/" .. dir)
    if not attr or attr.mode ~= "directory" or dir == "." or dir == ".." then
        goto continue
    end
    if not lfs.exists("./commands/" .. dir .. "/config.lua") then
        print("missing config file for command: " .. dir)
        goto continue
    end

    local command_config = require("commands." .. dir .. ".config")
    local command = config.args_parser
        :command(dir)
    command_config.config(command)
    commands[dir] = command_config.execute

    ::continue::
end

config.parse_args()

---@type lua-term
local term = require("tools.term")
terminal = term.asci_terminal(io.stdout)
terminal_body = term.components.group("body", terminal)
terminal_footer = term.components.group("footer", terminal)
terminal_status_bar = term.components.group("status_bar", terminal)

function print(...)
    terminal_body:print(...)
end

local _verbose = config.args.verbose
---@param ... any
function verbose(...)
    if not _verbose then
        return
    end
    print(...)
end

---@param ... any
function fatal(...)
    print(...)
    os.exit(1)
end

-- execute chosen command init
commands[config.args.command]()

terminal_status_bar:remove(true)
