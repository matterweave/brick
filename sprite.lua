-- Static sprites
module(..., package.seeall)

sprite = {}
sprite.brick = {}

-- Returns a structure with info for rendering a static image
sprite.new = function(image)
    -- body
end

-- Draws the given sprite to the screen
sprite.draw = function(sp)
    -- body
end

-- Generates the various pentaminoes
sprite.brick.makeBricks = function(image)
    -- body
    return { { x = 0, y = 0, blocks = {} } } -- stub code
end
