require("background")
require("collision")
require("player")
require("coin")

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
end

function love.update(dt)
	background:scroll(dt)
	player:movement(dt)
	coin:movement(dt)
end