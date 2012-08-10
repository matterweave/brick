-- Main brick script
--
-- Copyright (c) 2012, Dylan Sarber <dwsarber@gmail.com>
--

require('gui')
require('physics')
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

    menu.title.w = menu.title.font:getWidth(menu.title.text)
    menu.title.h = menu.title.font:getHeight()
    menu.title.x = (love.graphics.getWidth() / 2) - (menu.title.w / 2)
    menu.title.y = 100

    menu.newGame.w = menu.newGame.font:getWidth(menu.newGame.text)
    menu.newGame.h = menu.newGame.font:getHeight()
    menu.newGame.x = (love.graphics.getWidth() / 2) - (menu.title.w / 2)
    menu.newGame.y = 200
end

function updateMenu(dt)
    if love.mouse.isDown("l") and
        physics.checkCollision({
            x = love.mouse.getX(),
            y = love.mouse.getY(),
            w = 0,
            h = 0
        }, menu.newGame) then
        loadGame()
    end
end

function drawMenu()
    gui.label.draw(menu.title)
    gui.label.draw(menu.newGame)
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

    game.scoreText = gui.label.new("Score: " .. game.score, game.font, 0, 0)
    game.levelText = gui.label.new("Level: " .. game.level, game.font, 0, 0)

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
    -- No blocks passed for now
    if physics.checkBrickCollision(game.currentPiece, { }) then
        -- split out the blocks, start the next piece, etc.
    end
end

function drawGame()
    -- game drawing
    gui.label.draw(game.scoreText)
    gui.label.draw(game.levelText)
end
