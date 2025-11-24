local peripheralposition = "top"
local monitor = peripheral.wrap("right")
if not monitor then
    error("No monitor found on the right!")
end

local function displayMethods()
    monitor.clear()
    monitor.setCursorPos(1, 1)
    
    local methods = peripheral.getMethods(peripheralposition)
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

displayMethods()

while true do
    local event, side = os.pullEvent()
    
    if (event == "peripheral" or event == "peripheral_detach") and side == peripheralposition then
        displayMethods()
    end
end
