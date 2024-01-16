term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)


applib = require("/wolfos/lib/applib")
applib.clear()
local page = "main"
sx,sy = applib.getSize()
ok, err = pcall(function()
    while true do
        applib.clear("wolf.os appstore")
        --sleep(0.05)
        applib.writePos(2,3," apps ",colors.blue,colors.white)
        applib.writePos(2,5," libs ",colors.red,colors.white)
        --applib.writePos(2,7," pkgs ",colors.gray,colors.white)
        if page == "apps" then
            applib.writePos(8,3,"\16",colors.black,colors.white)
        elseif page == "libs" then
            applib.writePos(8,5,"\16",colors.black,colors.white)
        --elseif page == "pkgs" then
            --applib.writePos(8,7,"\16",colors.black,colors.white)
        end
        if page ~= "main" then
            applib.writePos(14,3," \187download ",colors.gray,colors.white)
        end

        local event, button, x, y = os.pullEvent("mouse_click")
        applib.i.click(x,y)
        if y == 4 then
            if x >= 2 and x <= 7  then
                page = "apps"
            end
            if x >= 14 and x <= 25 and page ~= "main" then
                applib.writePos(14,3," \187enter program id ",colors.gray,colors.white)
                applib.writePos(15,4,"\187",colors.black,colors.white)
                applib.setCursorPos(16,4)
                local id = read()
                applib.writePos(14,3," \187loading... ",colors.gray,colors.white)
                sleep(0.25)


                if page == "apps" then
                    applib.writePos(14,3," \187downloading... ",colors.gray,colors.white)
                    local request = http.get("https://wolf-os.madefor.cc/appstore/apps/"..id..".code.txt")
                    local file = fs.open("/wolfos/apps/"..id..".lua", "w")
                    applib.writePos(14,3," \187saving... ",colors.gray,colors.white)
                    file.write(request.readAll())
                    request.close()
                    file.close()
                    applib.writePos(14,3," \187done... ",colors.gray,colors.white)
                    sleep(0.5)
                elseif page == "libs" then
                    applib.writePos(14,3," \187downloading... ",colors.gray,colors.white)
                    local request = http.get("https://wolf-os.madefor.cc/appstore/libs/"..id..".code.txt")
                    local file = fs.open("/wolfos/lib/"..id..".lua", "w")
                    applib.writePos(14,3," \187saving... ",colors.gray,colors.white)
                    file.write(request.readAll())
                    request.close()
                    file.close()
                    applib.writePos(14,3," \187done... ",colors.gray,colors.white)
                    sleep(0.5)
                end

            end
        elseif y == 6 then
                if x >= 2 and x <= 7  then
                    page = "libs"
                end
        elseif y == 8 then
                if x >= 2 and x <= 7  then
                    page = "pkgs"
                end
        end
        
end
end
)
print(err)
--shell.run("wolfos/core.lua")
