-- Main brick script
--
-- Copyright (c) 2012, Dylan Sarber <dwsarber@gmail.com>
--

drawHover = false

function love.load()
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setBackgroundColor(255, 255, 255)

    loadMenu()
    updateFunc = updateMenu
    drawFunc = drawMenu
end

function love.update(dt)
    updateFunc()
end

function love.draw()
    drawFunc()
end

function loadMenu()
    local largeFont = { font = love.graphics.newFont(32) }
    local smallFont = { font = love.graphics.newFont(16) }

    menu = {
        largeFont = largeFont,
        smallFont = smallFont,
        title = {
            text = "Brick",
            font = largeFont.font
        },
        newGame = {
            text = "New Game",
            font = smallFont.font
        }
    }

    menu.title.width = menu.title.font:getWidth(menu.title.text)
    menu.title.height = menu.title.font:getHeight()
    menu.title.x = (love.graphics.getWidth() / 2) - (menu.title.width / 2)
    menu.title.y = 100
end

function updateMenu(dt)
    -- menu logic
    --local x, y = love.mouse.getPosition()
    --local font = menu.smallFont
    --local leftBound = 400
    --local topBound = 300
    --local rightBound = 400 + font:getWidth('Hello world!')
    --local bottomBound = 300 + font:getHeight()

    --if x > leftBound and x < rightBound and y > topBound and y < bottomBound then
    --    drawHover = true
    --else
    --    drawHover = false
    --end
end

function drawMenu()
    drawLabel(menu.title)

    love.graphics.setFont(menu.smallFont.font)
    love.graphics.print('Hello world!', 400, 300)

    if drawHover then
        love.graphics.print('Hovered', 0, 0)
    end
end

function drawLabel(label)
    love.graphics.setFont(label.font)
    love.graphics.print(label.text, label.x, label.y)
end
