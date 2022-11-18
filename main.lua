camera = require 'lib/hump.camera'
anim8 = require 'lib/anim8'
sti = require 'lib/sti'
Binocles = require("lib/Binocles")
-- wf = require "lib/windfield"

function love.load()

    love.graphics.setDefaultFilter("nearest", "nearest")

    cam = camera()
    cam.scale = 3

    gameMap = sti('assets/maps/stage0.lua')

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 1
    player.spriteSheet = love.graphics.newImage('assets/sprites/player-sheet.png')
    player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )

    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )

    player.anim = player.animations.left

    Binocles()
    Binocles:watch("FPS", function() return math.floor(1/love.timer.getDelta()) end)
    Binocles:watch("watch",function() return gameMap.width end)
    Binocles:setPosition(10 ,0)
    Binocles:watchFiles( { 'main.lua' } )
    Binocles:addColors( { {0.9,0.5,0.2,1.0} } )
    -- world = wf.newWorld(0,100)
    -- player = world:newRectangleCollider(350,100,80,80)
    -- ground = world:newRectangleCollider(0,500,800,80)
    -- ground:setType('static')
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)

    -- Update camera position
    cam:lookAt(player.x, player.y)

    -- This section prevents the camera from viewing outside the background
    -- First, get width/height of the game window
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- Left border
    if cam.x < w/2 then
        cam.x = w/2
    end

    -- Right border
    if cam.y < h/2 then
        cam.y = h/2
    end

    -- Get width/height of background
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    -- Right border
    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end
    -- Bottom border
    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end

    Binocles:update()
    -- world:update(dt)
end

function love.draw()
    cam:attach()
    gameMap:drawLayer(gameMap.layers["ground"])
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, nil, nil, nil, nil, nil, nil)
    cam:detach()
    Binocles:draw()
    -- world:draw()
end