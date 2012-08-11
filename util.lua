-- Utility functions and such
module(..., package.seeall)

-- Find the length of a numerically indexed table
len = function(array)
    if array == nil then
        return 0
    end

    local count = 0

    for i,v in ipairs(array) do
        count = count + 1
    end

    return count
end
