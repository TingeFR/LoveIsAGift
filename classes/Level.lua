local Level = Class{
  init = function(self)
    self.world = wf.newWorld(0,100)
    self.heart0 = self.world:newPolygonCollider({13, 3, 10, 0, 5, 0, 3, 1, 1, 3, 0, 5, 0, 12, 13, 12})
    self.heart1 = self.world:newPolygonCollider({0, 12, 1, 14, 13, 26, 25, 14, 26, 12})
    self.heart2 = self.world:newPolygonCollider({13, 12, 26, 12, 26, 5, 25, 3, 23, 1, 21, 0, 16, 0, 13, 3})
    self.joint0 = self.world:addJoint('RevoluteJoint', self.heart0, self.heart1, 6, 12, true)
    self.joint1 = self.world:addJoint('RevoluteJoint', self.heart0, self.heart2, 13, 7, true)
    self.joint2 = self.world:addJoint('RevoluteJoint', self.heart1, self.heart2, 20, 12, true)
    self.ground = self.world:newRectangleCollider(0,500,800,80)
    self.ground:setType('static')
  end
}

function Level:update(dt)
  self.world:update(dt)
end

function Level:draw()
  -- self.world:draw()
  love.graphics.setColor(1, 0, 0)
  love.graphics.polygon("fill", self.heart0.body:getWorldPoints(self.heart0:getPoints()))
  love.graphics.polygon("fill", self.heart1.body:getWorldPoints(self.heart1:getPoints()))
  love.graphics.polygon("fill", self.heart2.body:getWorldPoints(self.heart2:getPoints()))
  love.graphics.setColor(0, 1, 0)
  love.graphics.polygon("fill", self.ground.body:getWorldPoints(self.ground:getPoints()))
  
end

return Level