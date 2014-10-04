background = {}

function background:init()
	background.image = love.graphics.newImage("assets/bg.png")
	background.behind = love.graphics.newImage("assets/bg.png")
	background.x = 0;
	background.y = 0;
	background.fX = background.image:getWidth()
	background.scrollSpeed = 100
end

function background:scroll(dt)
	background.x = background.x - background.scrollSpeed * dt;
	background.fX = background.x + background.image:getWidth()
	if background.x < -background.image:getWidth() then
		background.x = 0
	end 
end

function background:draw()
	local x, y, fX = background.x, background.y, background.fX

	love.graphics.draw(background.image, x, y)
	love.graphics.draw(background.behind, fX, y)
end