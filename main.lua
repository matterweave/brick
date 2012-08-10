-- Main brick script
--
-- Copyright (c) 2012, Dylan Sarber <dwsarber@gmail.com>
--

require('gui')
require('sprite')
require('util')

function love.load()
    love.graphics.setMode(800, 600)
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setBackgroundColor(255, 255, 255)

    loadMenu()
    updateFunc = updateMenu
    drawFunc = drawMenu
end

function love.update(dt)
    updateFunc(dt)
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
        },
        quit = {
            text = "Quit",
            font = smallFont.font
        }
    }

    menu.title.width = menu.title.font:getWidth(menu.title.text)
    menu.title.height = menu.title.font:getHeight()
    menu.title.x = (love.graphics.getWidth() / 2) - (menu.title.width / 2)
    menu.title.y = 100

    menu.newGame.width = menu.newGame.font:getWidth(menu.newGame.text)
    menu.newGame.height = menu.newGame.font:getHeight()
    menu.newGame.x = (love.graphics.getWidth() / 2) - (menu.title.width / 2)
    menu.newGame.y = 200
end

function updateMenu(dt)
    if love.mouse.isDown("l") and isInside(love.mouse.getX(),
        love.mouse.getY(), menu.newGame.x, menu.newGame.y,
        menu.newGame.width, menu.newGame.height) then
        loadGame()
    end
end

function drawMenu()
    drawLabel(menu.title)
    drawLabel(menu.newGame)
end

function drawLabel(label)
    love.graphics.setFont(label.font)
    love.graphics.print(label.text, label.x, label.y)
end

function isInside(x, y, colX, colY, width, height)
    if x > colX and x < (colX + width) and y > colY and y < (colY + height) then
        return true
    else
        return false
    end
end

function loadGame()
    -- game initialization

    updateFunc = updateGame
    drawFunc = drawGame

    local labelFont = love.graphics.newFont(24)

    game = {
        font = labelFont,
        score = 0,
        level = 1,
        bricks = sprite.brick.makeBricks(),
        pieceFalling = false
    }

    game.scoreText = label.new("Score: " .. game.score, game.font, 0, 0)
    game.levelText = label.new("Level: " .. game.level, game.font, 0, 0)

    game.brickCount = util.len(game.bricks)
    game.nextPiece = game.bricks[math.random(game.brickCount)]
end

function updateGame(dt)
    -- game logic
    if not pieceFalling then
        game.currentPiece = game.nextPiece
        game.currentPiece.x = 0
        game.currentPiece.y = 0
        game.nextPiece = game.bricks[math.random(game.brickCount)] -- DUPLICATE!! HISSSSS!!!!
    end

    game.currentPiece.y = game.currentPiece.y + 16

    -- check for collisions
    -- and stop the brick if it hits something else
end

function drawGame()
    -- game drawing
    label.draw(game.scoreText)
    label.draw(game.levelText)
end
