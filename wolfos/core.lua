term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
function Drawheader()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.gray)
    term.clearLine()
    term.setBackgroundColor(colors.red)
    print("wolf.os origin")
    term.setBackgroundColor(colors.black)
end

function DrawApps()
    term.setCursorPos(2,3)
    term.setBackgroundColor(colors.blue)
    term.setTextColor(colors.blue)
    print("||||")
    term.setCursorPos(2,4)
    term.setBackgroundColor(colors.blue)
    term.setTextColor(colors.white)
    print("apps")
    term.setCursorPos(2,5)
    term.setBackgroundColor(colors.blue)
    term.setTextColor(colors.blue)
    print("||||")
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)

    term.setCursorPos(7,3)
    term.setBackgroundColor(colors.red)
    term.setTextColor(colors.red)
    print("||||")
    term.setCursorPos(7,4)
    term.setBackgroundColor(colors.red)
    term.setTextColor(colors.white)
    print("\187sys")
    term.setCursorPos(7,5)
    term.setBackgroundColor(colors.red)
    term.setTextColor(colors.red)
    print("||||")
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
end
M = true
ok, err = pcall(function()
    while M do
        term.clear()
        term.setCursorPos(1,1)
        Drawheader()
        DrawApps()
        --sleep(0.05)
        local event, button, x, y = os.pullEvent("mouse_click")
        if x >= 1 and x <= 5 then
            if y >= 3 and y <= 7 then
                shell.run("wolfos/applist.lua")
            end
        end
        if x >= 7 and x <= 10 then
            if y >= 3 and y <= 7 then
                shell.run("wolfos/syslist.lua")
            end
        end
end
end
)
if not ok then
    shell.run("wolfos/crashes/crash.lua")
else
    print("iii")
end
