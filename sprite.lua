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
    local bricks = {}
    --o
    bricks.o = {1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0,
                1, 0, 0, 0, 0}

    --p
    bricks.p = {1, 1, 0, 0, 0, 
                1, 1, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --q
    bricks.q = {1, 1, 0, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 1, 0, 0, 0,
                0, 0, 0, 0, 0}
    --r
    bricks.r = {0, 1, 1, 0, 0, 
                1, 1, 0, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --s
    bricks.s = {0, 1, 0, 0, 0, 
                1, 1, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --t
    bricks.t = {1, 1, 1, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --u
    bricks.u = {1, 0, 1, 0, 0, 
                1, 1, 1, 0, 0, 
                0, 0, 0, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --v
    bricks.v = {1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                1, 1, 1, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --w
    bricks.w = {1, 0, 0, 0, 0, 
                1, 1, 0, 0, 0, 
                0, 1, 1, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --x
    bricks.x = {0, 1, 0, 0, 0, 
                1, 1, 1, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --y
    bricks.y = {1, 0, 0, 0, 0, 
                1, 1, 0, 0, 0, 
                1, 0, 0, 0, 0, 
                1, 0, 0, 0, 0,
                0, 0, 0, 0, 0}
    --z
    bricks.z = {1, 1, 0, 0, 0, 
                0, 1, 0, 0, 0, 
                0, 1, 1, 0, 0, 
                0, 0, 0, 0, 0,
                0, 0, 0, 0, 0}

    return bricks -- stub code
end
