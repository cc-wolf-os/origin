expect = require("cc.expect")
local function writePos(x,y,chr,bg,fg)
    local ox,oy = term.getCursorPos()
    local obg = term.getBackgroundColor()
    local ofg = term.getTextColor()
    term.setCursorPos(x,y+1)
    term.setBackgroundColor(bg)
    term.setTextColor(fg)
    term.write(chr)
    term.setCursorPos(ox,oy)
    term.setBackgroundColor(obg)
    term.setTextColor(ofg)
end
local function clear(app,devmode)
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.gray)
    term.clearLine()
    term.setBackgroundColor(colors.red)
    print("wolf.os")
    term.setCursorPos(10,1)
    term.setBackgroundColor(colors.blue)
    print(app)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(1,2)
    if devmode then
        writePos(1,sy,"\29",colors.green,colors.black)
        writePos(2,sy,"?",colors.blue,colors.black)
    end
end
local function setCursorPos(x,y)
    term.setCursorPos(x,y+1)
end
local function getSize()
    local x,y = term.getSize()
    return x,y-1
end


local function Click(x,y,devmode,progpath)
    if y <= 1 then
        if x <= 7 then
            shell.run("wolfos/core.lua")
        end
    end
    if devmode then
        local sx,sy = term.getSize()
        if y >= sy then
            if x <= 1 then
                expect(1, progpath,"string")
                writePos(1,1,"\29",colors.red,colors.black)
                sleep(1)
                shell.run(progpath)
            end
            if x == 2 then
                expect(1, progpath,"string")
                writePos(1,1,"?",colors.blue,colors.black)
                sleep(1)
                shell.run("wolfos/sysapps/devhelp.lua")
            end
        end
    end
end

local function writevert(x,y,len,chr,bg,fg)
    local ox,oy = term.getCursorPos()
    local obg = term.getBackgroundColor()
    local ofg = term.getTextColor()
    term.setCursorPos(x,y+1)
    term.setBackgroundColor(bg)
    term.setTextColor(fg)
    for i=1, len do
        term.setCursorPos(x,y+i)
        print(chr)
    end
    term.setCursorPos(ox,oy)
    term.setBackgroundColor(obg)
    term.setTextColor(ofg)
end
return { clear=clear, setCursorPos=setCursorPos,getSize=getSize,writePos=writePos,i={click=Click},writevert=writevert}