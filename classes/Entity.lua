local Entity = Class{
  init = function(self, pos, width, height, img)
    self.pos = pos --vector
    self.width = width -- integer
    self.height = height -- integer
    self.img = img --Drawable
  end,
  constant = 5
}

function Entity:update(dt)
  local dir = (self.pos):normalizeInplace()
  self.pos = self.pos + dir * Entity.speed * dt
end

function Entity:draw()
  love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

return Entity