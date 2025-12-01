local count = 0

while True do
    local event = os.pullEventRaw()
    count = count + 1
    print(count .. " - " .. event)
end
