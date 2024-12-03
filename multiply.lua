-- Note: This script requires LuaSocket for timing and os for input
local socket = require("socket")

-- Generate random values
local x = {}
local y = {}
math.randomseed(os.time())
for i = 1, 10 do
    x[i] = math.random(2, 9)
    y[i] = math.random(2, 9)
end

-- Initialize vectors
local score = {}
local howfast = {}

-- Main game loop
for i = 1, 10 do
    local start_time = socket.gettime()
    
    -- Print multiplication problem
    io.write(string.format("How much is %d x %d? ", x[i], y[i]))
    io.flush()
    
    -- Read user input
    local input = io.read()
    local numeric_input = tonumber(input)
    
    -- Check the answer
    if numeric_input and numeric_input == x[i] * y[i] then
        print("Correct!\n")
        score[i] = 1
    else
        print(string.format("Wrong! Correct answer was %d\n", x[i] * y[i]))
        score[i] = 0
    end
    
    local end_time = socket.gettime()
    howfast[i] = end_time - start_time
end

-- Calculate total time and score
local total_time = 0
for _, v in ipairs(howfast) do
    total_time = total_time + v
end

local total_score = 0
for _, v in ipairs(score) do
    total_score = total_score + v
end

-- Display the results
print(string.format("Total score: %d/10. You solved everything in %d seconds.\n", total_score, total_time))