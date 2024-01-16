term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)


applib = require("/wolfos/lib/applib")
applib.clear()

sx,sy = applib.getSize()
ok, err = pcall(function()
    while true do
        applib.clear("wolf.os dev enviroment demo",true)
        --sleep(0.05)
        
        applib.writePos(1,sy-1,"\31 this is the dev toolbox",colors.black,colors.white)
        local event, button, x, y = os.pullEvent("mouse_click")
        applib.i.click(x,y,true,"wolfos/apps/dev.lua")
        
end
end
)
print(err)
--shell.run("wolfos/core.lua")
