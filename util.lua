-- Utility functions and such

util = {}

-- Find the length of a numerically indexed table
util.len = function(array)
    if array == nil then
        return 0
    end

    local count = 0

    for i,v in ipairs(array) do
        count = count + 1
    end

    return count
end
