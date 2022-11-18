local AnimatedEntity = Class{__includes = Entity,
  init = function(self, pos, width, height, frameWidth, frameHeight, img)
    Entity.init(self, pos, width, height, img)
    self.frameWidth = frameWidth -- integer
    self.frameHeight = frameHeight -- integer
  end,
}

function AnimatedEntity:update(dt)
  Entity:update(dt)
end

function AnimatedEntity:draw()
  Entity:draw()
end

return AnimatedEntity