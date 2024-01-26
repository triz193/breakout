-- Powerup Class
Powerup = Class{}

function Powerup:init(image, x, y)
    self.image = image
    -- Set a random x position
    self.x = x or math.random(0, VIRTUAL_WIDTH - 16)
    -- Starting above the screen
    self.y = y or -16
    -- Adjusting the speed
    self.speed = 100
    -- Width and height of the powerup
    self.width = 16
    self.height = 16
end

function Powerup:reset()
    self.x = math.random(0, VIRTUAL_WIDTH - 16)
    self.y = -32
end

function Powerup:update(dt)
    self.y = self.y + self.speed * dt

    -- Check if the powerup has reached the bottom of the screen
    if self.y > VIRTUAL_HEIGHT + 30 then
        -- Reset or remove the power-up as needed
        self:reset()
    end
end

function Powerup:collides(paddle)
    -- Checking if 'paddle' is nil
    if not paddle then
        return false
    end
    
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    return true
end



function Powerup:render()
    love.graphics.draw(self.image, gFrames['powerup'][1], self.x, self.y)
end
