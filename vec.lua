
-- A library which provides vectors
-- Helps to track blocks in relation to each other

local function vec(x, y, z)

    return {

        x = x,
        y = y,
        z = z

    }

end

local function add(a, b)

    return vec(a.x + b.x, a.y + b.y, a.z + b.z)

end

local function sub(a, b)

    return vec(a.x - b.x, a.y - b.y, a.z - b.z)

end

local function mult(vector, factor)

    return vec(vector.x * factor, vector.y * factor, vector.z * factor)

end

local function div(vector, factor)

    return vec(vector.x / factor, vector.y / factor, vector.z / factor)

end

local function magnitude(input)
    
    return math.sqrt(input.x ^ 2 + input.y ^ 2 + input.z ^ 2)

end

local function manhattan(input)

    return math.abs(input.x) + math.abs(input.y) + math.abs(input.z)

end

local function left(input)

    return vec(-input.z, input.y, input.x)

end

local function right(input)

    return vec(input.z, input.y, -input.x)
    
end

return {

    vec = vec,

    zero = vec(0, 0, 0),
    one = vec(1, 1, 1),

    left = vec(1, 0, 0),
    right = vec(-1, 0, 0),
    up = vec(0, 1, 0),
    down = vec(0, -1, 0),
    forward = vec(0, 0, 1),
    back = vec(0, 0, -1),

    add = add,
    sub = sub,
    mult = mult,
    div = div,

    magnitude = magnitude,
    manhattan = manhattan,

    turnLeft = left,
    turnLight = right

}