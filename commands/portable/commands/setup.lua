-- Write-Output "setting up..."

-- . "$PSScriptRoot/../utils.ps1"

-- $driveLetter = $pwd.drive.name + ":"
-- $Global:DriveLetter = $driveLetter

-- . "$driveLetter\Tools\misc\load.ps1"

-- # adding paths to enviorment variable ("PATH")
-- $paths = Get-Paths -DriveLetter $driveLetter
-- $paths_str = $paths -join ";"

-- Add-ENV -VariableName "PATH" -Value $paths_str
-- Set-ENV -VariableName "PATH_FREEMAKER_PORTABLE" -Value $paths_str

-- Set-ENV -VariableName "USERCONFIG_FREEMAKER_PORTABLE" -Value "$driveLetter/.config"
-- Set-ENV -VariableName "DRIVE_FREEMAKER_PORTABLE" -Value "$driveLetter"

-- # window manger
-- . "$PSScriptRoot/../glazewm/portable/setup.ps1"

print("setting up...")

-- we are expecting that the portable medium has following structure
--  <drive>
--      .config -- config root
--      tools
--          <tools...>
--              .config
--                  setup.lua
--                  cleanup.lua

local tools_dir = config.root_path .. "../tools/"
if not lfs.exists(tools_dir) or lfs.attributes(tools_dir).mode ~= "directory" then
    fatal("no tools directory found: " .. tools_dir)
end

for tool in lfs.dir(tools_dir) do
    local tool_path = tools_dir .. tool
    local attr = lfs.attributes(tool_path)
    if not attr or attr.mode ~= "directory" or tool == "." or tool == ".." then
        goto continue
    end

    ::continue::
end
