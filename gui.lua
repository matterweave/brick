-- GUI stuff
module(..., package.seeall)

label = {}

-- Returns a table with information needed to draw and manipulate a text "label"
label.new = function(text, font, x, y)
    label.text = text
    label.font = font
    label.x = x
    label.y = y
    return label
end

-- Draws a label to the screen
label.draw = function(label)
	love.graphics.setFont(label.font)
    love.graphics.print(label.text, label.x, label.y)
end
