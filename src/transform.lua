local vector = require("vec.lua")

-- A library to act as an anchor for the turtle
-- Helps to track the turtle relative to its origin

local function forward(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 0, blocks, 1 do
        
        while not turtle.forward() do
            
            turtle.dig()

        end

        self.pos = vector.add(self.pos, self.rot)

    end

end

local function up(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 0, blocks, 1 do
        
        while not turtle.up() do
            
            turtle.digUp()

        end

        self.pos = vector.add(self.pos, vector.up)

    end

end

local function down(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 0, blocks, 1 do
        
        while not turtle.down() do
            
            turtle.digDown()

        end

        self.pos = vector.add(self.pos, vector.down)

    end

end

local function turnLeft(self)

    turtle.turnLeft()

    self.rot = vector.turnLeft(self.rot)

end

local function turnRight(self)

    turtle.turnRight()

    self.rot = vector.turnRight(self.rot)

end


local function transform(origin, direction)

    if origin == nil then
        origin = vector.zero
    end

    if direction == nil then
        direction = vector.forward
    end

    return {

        pos = origin,
        rot = direction,

        forward = forward,
        up = up, 
        down = down,

        turnLeft = turnLeft,
        turnRight = turnRight

    }

end

return { transform = transform }