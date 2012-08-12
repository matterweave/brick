-- Static sprites
module(..., package.seeall)

brick = {}

-- Returns a structure with info for rendering a static image
new = function(image, x, y)
    if x == nil then x = 0 end
    if y == nil then y = 0 end

    local sp = {
        image = love.graphics.newImage(image),
        rotation = 0,
        x = x,
        y = y
    }

    sp.w = sp.image.getWidth()
    sp.h = sp.image.getHeight()

    return sp
end

-- Draws the given sprite to the screen
draw = function(sp)
    -- body
end

-- Generates the various pentaminoes
brick.makeBricks = function(image)
    -- body
    return { { x = 0, y = 0, blocks = {} } } -- stub code
end
