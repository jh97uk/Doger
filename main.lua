require("background")
require("collision")
require("player")
require("coin")

gameSpeed = 2
wowtime, wowx, wowy, wowrota, wowtext, wowrgb = 0,0,0,0, "", {r=0, g=0, b=0}

function love.load()
	love.window.setMode(960, 640)
	w, h = love.window.getDimensions()
	
	love.graphics.setBackgroundColor(2, 2, 244)
	love.graphics.setNewFont("assets/comic.ttf", 35)
	
	score = 0

	player:init() -- Yes, I'm aware I should probably be making a new object. Or not?
	background:init() -- /\ See above /\
	coin:init() -- /\ See above /\

	music = love.audio.newSource("assets/music.ogg", "stream") -- Big thanks to dunderpatrullen for his fantastic track: To the moon. Get it here at: https://soundcloud.com/dunderpatrullen/teaser-dunderpatrullen-vs
	music:setLooping(true)
	music:setVolume(0.7)
	love.audio.play(music)
end

function love.draw()	
	background:draw()
	player:draw() 
	coin:draw()

	love.graphics.print("Much coins: "..score.."Ð", 20, 20)

	love.graphics.setColor(wowrgb["r"], wowrgb["g"], wowrgb["b"], 255)
	love.graphics.print(wowtext, wowx, wowy, wowrota)
	love.graphics.setColor(255,255,255,255)
end

function love.update(dt)
	-- Gamespeed multiplier increases by 0.1 per second
	gameSpeed = gameSpeed + (0.1 * dt)
	dt = dt * gameSpeed -- Modify the dt for the rest of the calculations

	wowtime = wowtime + (1* dt)
	if(wowtime > 5) then wowtime = 0 wow() end


	background:scroll(dt)
	player:movement(dt)
	coin:movement(dt)
end

wows = {
	"wow",
	"much doge",
	"to the moon!"
}
function wow()
	wowtext = wows[math.random(1, #wows)]
	wowx, wowy = math.random(1, love.graphics.getWidth() - 100), math.random(1, love.graphics.getHeight()- 100)
	wowrota = math.rad(math.random(-45,45))
	wowrgb = {}
	wowrgb.r = math.random(1,255)
	wowrgb.g = math.random(1,255)
	wowrgb.b = math.random(1,255)
end