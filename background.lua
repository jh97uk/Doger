b = {} -- a table of all backgrounds
cb = 1 -- the current background index
background = {} -- we use this so we can keep it pretty in main.lua and call background:init()

function background:init()
	-- load in all the backgrounds
	b[1] = {}
	b[1].image = love.graphics.newImage("assets/city.png")
	b[1].behind = love.graphics.newImage("assets/city.png")
	b[1].x = 0;
	b[1].y = 0;
	b[1].fX = b[1].image:getWidth()
	b[1].scrollSpeed = 100

	b[2] = {}
	b[2].image = love.graphics.newImage("assets/sky.png")
	b[2].behind = love.graphics.newImage("assets/sky.png")
	b[2].x = 0;
	b[2].y = 0;
	b[2].fX = b[1].image:getWidth()
	b[2].scrollSpeed = 100
	
	b[3] = {}
	b[3].image = love.graphics.newImage("assets/moon.png")
	b[3].behind = love.graphics.newImage("assets/moon.png")
	b[3].x = 0;
	b[3].y = 0;
	b[3].fX = b[1].image:getWidth()
	b[3].scrollSpeed = 100

	b[4] = {}
	b[4].image = love.graphics.newImage("assets/testbackground.png")
	b[4].behind = love.graphics.newImage("assets/testbackground.png")
	b[4].x = 0;
	b[4].y = 0;
	b[4].fX = b[1].image:getWidth()
	b[4].scrollSpeed = 100

	cb = 1
end

function background:scroll(dt)
	b[cb].x = b[cb].x - b[cb].scrollSpeed * dt;
	b[cb].fX = b[cb].x + b[cb].image:getWidth()
	if b[cb].x < - b[cb].image:getWidth() then
		b[cb].x = 0
	end 
end

function background:draw()
	local x, y, fX = b[cb].x, b[cb].y, b[cb].fX

	love.graphics.draw(b[cb].image, x, y)
	love.graphics.draw(b[cb].behind, fX, y)
end

function background:change(doge)
	if(doge <= 50) then 
		-- maybe we could be in the mines here
		cb = 1
	elseif doge <= 100 then
		-- streets?
		cb = 2
	elseif doge <= 200 then
		-- sky? etc...
		cb = 3
	end
end