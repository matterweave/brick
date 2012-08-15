-- GUI stuff
module(..., package.seeall)

label = {}

-- Returns a table with information needed to draw and manipulate a text "label"
label.new = function(text, font, x, y)
	local lbl = {}
    lbl.text = text
    lbl.font = font
    lbl.x = x
    lbl.y = y
    lbl.w = lbl.font:getWidth(lbl.text)
    lbl.h = lbl.font:getHeight()
    return lbl
end

-- Draws a label to the screen
label.draw = function(lbl)
	love.graphics.setFont(lbl.font)
    love.graphics.print(lbl.text, lbl.x, lbl.y)
end
