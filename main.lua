require ("classes/entities")
require ("tools")
require ("data/data")

width , height = love.window.getDesktopDimensions()

local savepath = love.filesystem.getSource().."/data/"
world = {
	centerX = (love.graphics.getWidth() / 2),
	centerY = (love.graphics.getHeight() / 2)
}



if user then 
	-- load level based on user saved data
	require('levels/level'..user.currentlvl)
else
	require('levels/gamescreen')
end


function love.load()
	Level.loadLevel()
end

function love.update (dt)
	-- run game data
	Level.updateLevel(dt)
end

function love.draw ()
	Level.render()
	collectgarbage()
end


function love.mousepressed (x, y, button)
	local cursor = {x=x,y=y,button=button}
	Level.onMousepressed(cursor)
end

function love.mousereleased (x, y, button, istouch)
	local cursor = {x=x,y=y,button=button}
	Level.onMousereleased(cursor)
end
