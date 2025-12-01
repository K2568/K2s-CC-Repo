local count = 0

while true do
    local event = os.pullEventRaw()
    count = count + 1
    print(count .. " - " .. event)
end
