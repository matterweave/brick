-- Physics functions

-- Return true if obj1 collided with obj2, otherwise false
function checkCollision(obj1, obj2)
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
function hasExtents(obj)
    if obj.x == nil or obj.y == nil 
        obj.w == nil or obj.h == nil then
        return false
    else
        return true
    end
end
