player = {}

function player:init()
	player.sprite = love.graphics.newImage("assets/doge.png");
	player.x = 10
	player.y = 80
	player.scale = 0.5
	player.rotation = 0
end

function player:movement(dt)
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		if player.y > h - player.sprite:getHeight() / 2 then return end
		player.y = player.y + 150 * dt
	elseif love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		if player.y < 80 then return end
		player.y = player.y - 150 * dt
	end


end

function player:draw()
	love.graphics.draw(player.sprite, player.x, player.y, player.rotation, player.scale, player.scale)
end