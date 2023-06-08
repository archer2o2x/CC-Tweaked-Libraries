local targets = {}

local pos = {
    x=0,
    y=0,
    z=0
}

-- COMPASS
--    1
-- -1 0 1
--   -1

local direction = "N"

local search = true

while search do
    
    

end

local function markUp()

    local newPos = { x=pos.x, y=pos.y + 1, z=pos.z }

    targets[#targets+1] = newPos

end

local function markDown()

    local newPos = { x=pos.x, y=pos.y - 1, z=pos.z }

    targets[#targets+1] = newPos
    
end

local function markFront()
    
    local newDirection = GetDirectionVector()

    local newPos = { 
        x=pos.x + newDirection.x,
        y=pos.y,
        z=pos.z + newDirection.z
    }

    targets[#targets+1] = newPos

end

function GetDirectionVector() 

    local newPos = { x=0, y=0, z=0 }

    if direction == "N" then
        newPos.z = 1
    end

    if direction == "S" then
        newPos.z = -1
    end

    if direction == "E" then
        newPos.x = 1
    end

    if direction == "W" then
        newPos.x = -1
    end

    return newPos

end

local function forward()
    
    turtle.dig()
    turtle.forward()

    if direction == "N" then
        pos.z = pos.z + 1
    end

    if direction == "S" then
        pos.z = pos.z - 1
    end

    if direction == "E" then
        pos.x = pos.x + 1
    end

    if direction == "W" then
        pos.x = pos.x - 1
    end

end

local function left()

    if direction == "N" then
        direction = "W"
        return
    end

    if direction == "W" then
        direction = "S"
        return
    end

    if direction == "S" then
        direction = "E"
        return
    end

    if direction == "E" then
        direction = "N"
        return
    end
    
end

local function right()

    if direction == "N" then
        direction = "E"
        return
    end

    if direction == "W" then
        direction = "N"
        return
    end

    if direction == "S" then
        direction = "W"
        return
    end

    if direction == "E" then
        direction = "S"
        return
    end
    
end