term.write("Could not find /bios.lua. UnBIOS cannot continue.")

while true do
coroutine.yield("key")
term.write("key")
end
