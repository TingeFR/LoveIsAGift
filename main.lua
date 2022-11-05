function love.load()
    wf = require "lib/windfield"
    world = wf.newWorld(0,100)
    player = world:newRectangleCollider(350,100,80,80)
    ground = world:newRectangleCollider(0,500,800,80)
    ground:setType('static')
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
end