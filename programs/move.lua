local robot = require("robot")


function askDirection()
    io.write('Which direction would you like to move? (left, right, forward, back, up, down)')
    local direction = io.read()
    if direction == 'left' or direction == 'right' or direction == 'forward' or direction == 'back' or direction == 'up' or direction == 'down' then
        askBlocks(direction)
    else
        io.write('invalid input\n\n')
        askDirection()
    end
end

function askBlocks(direction)
    io.write('How many times would you like to move?')
    local blocks = io.read('number')
    move(direction, blocks)
end

function move(direction, blocks)
    if direction == 'left' then
        robot.turnLeft()
        for i = 1,blocks do
            robot.forward()
        end
    else if direction == 'right' then
        robot.turnRight()
        for i = 1,blocks do
            robot.forward()
        end
    else if direction == 'forward' then
        for i = 1,blocks do
            robot.forward()
        end
    elseif direction == 'back' then
        robot.turnAround()
        for i = 1,blocks do
            robot.forward()
        end
    elseif direction == 'up' then
        for i = 1,blocks do
            robot.up()
        end
    elseif direction == 'down' then
        for i = 1,blocks do
            robot.down()
        end
    end

end