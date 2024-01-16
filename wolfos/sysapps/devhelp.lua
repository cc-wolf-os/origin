term.setBackgroundColor(colors.blue)
term.setTextColor(colors.white)


applib = require("/wolfos/lib/applib")
bgf = require("/wolfos/lib/bigfont")
term.clear()
bgf.hugePrint(" ? ")
print(col)
sleep(2)
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
sx,sy = applib.getSize()
ok, err = pcall(function()
    while true do
        applib.clear("wolf.os dev enviroment help")
        --sleep(0.05)
        
        applib.writePos(1,1,"this is the dev envroment help page",colors.black,colors.white)
        local event, button, x, y = os.pullEvent("mouse_click")
        applib.i.click(x,y)
        
end
end
)
print(err)
--shell.run("wolfos/core.lua")
