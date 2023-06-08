local vector = require("vec")
local transform = require("transform")

local function findClosest(origin, nodes)

    local closest = nodes[1]

    for node in nodes do

        if vector.distanceManhattan(origin, node) < vector.distanceManhattan(origin, closest) then

            closest = node
            
        end

    end

    return closest

end

local function alignWithDirection(agent, dir)

    if vector.equals(agent.rot, dir) then
        return true
    end

    if vector.equals(agent.rot, vector.turnLeft(dir)) then
        agent:turnLeft()
        return true
    end

    if vector.equals(agent.rot, vector.turnRight(dir)) then
        agent:turnRight()
        return true
    end

    if vector.equals(agent.rot, vector.turnAround(dir)) then
        agent:turnAround()
        return true
    end

    return false

end

local function navigateToPos(agent, pos)

    print(agent.pos.x, agent.pos.y, agent.pos.z)
    print(agent.rot.x, agent.rot.y, agent.rot.z)
    print(pos.x, pos.y, pos.z)

    local path = vector.sub(pos, agent.pos)

    if path.z > 0 then
        alignWithDirection(vector.forward)
    else
        alignWithDirection(vector.back)
    end

    agent:forward(path.z)

    if path.y > 0 then
        agent:up(path.y)
    else
        agent:down(-1 * path.y)
    end

    if path.x > 0 then
        alignWithDirection(vector.left)
    else
        alignWithDirection(vector.right)
    end

    agent:forward(path.x)

end

return {

    findClosest = findClosest,

    navigateToPos = navigateToPos,

    alignWithDirection = alignWithDirection

}