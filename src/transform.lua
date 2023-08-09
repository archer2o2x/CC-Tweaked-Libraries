local vector = require("vec")

-- A library to act as an anchor for the turtle
-- Helps to track the turtle relative to its origin

local function updateWaypoint(self)

    if self.waypointfile == nil then return end

    settings.load(self.waypointfile)

    settings.set("pos", self.pos)
    settings.set("rot", self.rot)

    settings.save(self.waypointfile)

end

local function refuel(self, desiredLevel)

    for i = 1, 16 do
        
        turtle.select(i)
        local isConsumable = true
        while isConsumable do
            isConsumable = turtle.refuel(1)
            isConsumable = isConsumable and turtle.getFuelLevel() < desiredLevel
        end

        if turtle.getFuelLevel() >= desiredLevel then
            return
        end

    end

end

local function forward(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 1, blocks, 1 do
        
        while not turtle.forward() do
            
            turtle.dig()

        end

        self.pos = vector.add(self.pos, self.rot)

    end

    updateWaypoint(self)

end

local function up(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 1, blocks, 1 do
        
        while not turtle.up() do
            
            turtle.digUp()

        end

        self.pos = vector.add(self.pos, vector.up)

    end

    updateWaypoint(self)

end

local function down(self, blocks)

    if blocks == nil then
        blocks = 1
    end

    for i = 1, blocks, 1 do
        
        while not turtle.down() do
            
            turtle.digDown()

        end

        self.pos = vector.add(self.pos, vector.down)

    end

    updateWaypoint(self)

end

local function turnLeft(self)

    turtle.turnLeft()

    self.rot = vector.turnLeft(self.rot)

    updateWaypoint(self)

end

local function turnRight(self)

    turtle.turnRight()

    self.rot = vector.turnRight(self.rot)

    updateWaypoint(self)

end

local function turnAround(self)

    turtle.turnLeft()
    turtle.turnLeft()

    self.rot = vector.turnAround(self.rot)

    updateWaypoint(self)

end

local function transform(origin, direction, waypointfile)

    if origin == nil then
        origin = vector.zero
    end

    if direction == nil then
        direction = vector.forward
    end

    if waypointfile ~= nil then

        settings.load(waypointfile)

        settings.set("pos", origin)
        settings.set("rot", direction)

        settings.save(waypointfile)

    end

    return {

        pos = origin,
        rot = direction,
        waypointfile = waypointfile,

        forward = forward,
        up = up, 
        down = down,

        turnLeft = turnLeft,
        turnRight = turnRight,
        turnAround = turnAround,

        refuel = refuel,

        updateWaypoint = updateWaypoint

    }

end

return { transform = transform }