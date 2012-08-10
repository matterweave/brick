-- Physics functions

physics = {}

-- Return true if brick1 collided with anything in blocks, otherwise return false
-- Each "block" structure should have the typical x, y, w, h properties
physics.checkBrickCollision = function(brick, blocks)
    for k,v in pairs(brick.blocks) do
        for i,b in ipairs(blocks) do
            if v.x >= b.x and v.x <= (b.x + b.w) and
                v.y >= b.y and v.y <= (b.y + b.h) then
                return true
            end
        end
    end

    return false
end

-- Return true if obj1 collided with obj2, otherwise return false
physics.checkCollision = function(obj1, obj2)
    if not hasExtents(obj1) or not hasExtents(obj2) then
        return false
    end

    if obj1.x >= obj2.x and obj1.x <= (obj2.x + obj2.w) and
        obj1.y >= obj2.y and obj1.y <= (obj2.y + obj2.h) then
        return true
    else
        return false
    end
end

-- Return true if an object has a valid (x,y) position and width and height,
-- otherwise false
physics.hasExtents = function(obj)
    if obj.x == nil or obj.y == nil or
        obj.w == nil or obj.h == nil then
        return false
    else
        return true
    end
end
