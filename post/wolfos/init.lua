ok, err = pcall(function()
    shell.run("wolfos/core.lua")
end)
shell.run("wolfos/crashes/boot.lua")