coin = {}

function coin:init()
	coin.sprite = love.graphics.newImage("assets/coin.png");
	coin.scale = 0.5
	coin.x = w + coin.sprite:getWidth() /2
	coin.y = math.random(110, h - 130)
	coin.speed = math.random(100, 300)
end

function coin:resetPos()
	coin.speed = math.random(100, 300)
	coin.x = w + coin.sprite:getWidth() /2
	coin.y = math.random(110, 640 - coin.sprite:getHeight() / 2)
	
end

function coin:movement(dt)
	if CheckCollision(coin.x, coin.y, coin.sprite:getWidth()/2, coin.sprite:getHeight()/2, player.x, player.y, player.sprite:getWidth()/2, player.sprite:getHeight()/2) then
			coin:sound()
			score = score + 1
			coin:resetPos()
	end
		coin.x = coin.x - coin.speed * dt

		if coin.x < -coin.sprite:getWidth() then
			coin:resetPos()
		end
end

function coin:sound()
	sound = love.audio.newSource("assets/coin10.wav", "stream")
	love.audio.play(sound)
end

function coin:draw()
	love.graphics.draw(coin.sprite, coin.x, coin.y, 0, coin.scale, coin.scale)
end