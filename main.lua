camera = require 'lib.hump.camera'
anim8 = require 'lib.anim8'
sti = require 'lib.sti'
Class = require "lib.hump.class"
vector = require "lib.hump.vector"
inspect = require "lib.inspect"
wf = require "lib/windfield"
Talkies = require "lib.talkies"
Entity = require "classes.Entity"
AnimatedEntity = require "classes.AnimatedEntity"
Level = require "classes.Level"

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  cam = camera()
  cam.scale = 12
  newLevel = Level()
end

function love.update(dt)
  cam:lookAt(20, love.graphics.getHeight() - 120)
  newLevel:update(dt)
end

function love.draw()
  cam:attach()
  newLevel:draw()
  cam:detach()
end