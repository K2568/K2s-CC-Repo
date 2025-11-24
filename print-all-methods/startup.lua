local monitor = peripheral.wrap("right")
if not monitor then
    error("No monitor found on the right!")
end

local function displayMethods()
    local periph = peripheral.wrap("top")
    if not periph then
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("No peripheral")
        return
    end
    
    local methods = peripheral.getMethods("top")
    
    monitor.clear()
    monitor.setCursorPos(1, 1)
    
    for i, method in ipairs(methods) do
        monitor.write(method)
        local x, y = monitor.getCursorPos()
        monitor.setCursorPos(1, y + 1)
    end
end

displayMethods()

while true do
    local event, side = os.pullEvent()
    
    if event == "peripheral" and side == "top" then
        displayMethods()
    elseif event == "peripheral_detach" and side == "top" then
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("No peripheral")
    end
end
