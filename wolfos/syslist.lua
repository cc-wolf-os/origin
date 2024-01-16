term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()

apps = fs.list("/wolfos/sysapps")

function Drawheader()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.gray)
    term.clearLine()
    term.setBackgroundColor(colors.red)
    print("wolf.os")
    term.setCursorPos(9,1)
    term.setBackgroundColor(colors.blue)
    print("apps")
    term.setBackgroundColor(colors.black)
end

function Drawlines()
    term.setBackgroundColor(colors.gray)
    for appnum = 1, #apps do
        term.setCursorPos(1,appnum+1)
        term.clearLine()
        print(apps[appnum])
    end
    
    term.setBackgroundColor(colors.black)
end

ok, err = pcall(function()
    while true do
        term.clear()
        term.setCursorPos(1,1)
        Drawheader()
        
        Drawlines()
        --sleep(0.05)
        local event, button, x, y = os.pullEvent()
        if event == "mouse_click" then
        if y <= 1 then
            if x <= 7 then
                shell.run("wolfos/core.lua")
                print("APPS")
            end
        end
        print(apps[y-1])
        if y >= 2 then
            if y-1 <= #apps then
                shell.run("wolfos/sysapps/"..apps[y-1])
            end
        end  
    end
    end
end
)

if not ok then
term.clear()
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
shell.run("wolfos/core.lua")
end
