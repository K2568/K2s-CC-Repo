local monitor = peripheral.wrap("right")
if not monitor then
    error("No monitor found on the right!")
end
local count = 0

local function displayMethods(pos)
    monitor.clear()
    monitor.setCursorPos(1, 1)
    
    local methods = peripheral.getMethods(pos)
    if not methods then
        monitor.write("No peripheral")
        return
    end
    
    for i, method in ipairs(methods) do
        monitor.write(method)
        local x, y = monitor.getCursorPos()
        monitor.setCursorPos(1, y + 1)
    end
end

while true do
    local event, side = os.pullEventRaw()
    count = count + 1
    if side do
        print(count .. " - " .. event, side)
        displayMethods(side)
    else
        print(count .. " - " .. event)
    end
end
