local robot = require('robot')

local storageSelect = 1


function checkInv()
    if component.inventory_controller.getStackInInternalSlot(storageSelect) == nil then
        storageSelect = storageSelect + 1
        robot.select(storageSelect)
    end
end

function createPlatform(blocks)

    local robotFacing = 'left'

    for i = 1, l do
        for i = 1, w do
            checkInv()
            robot.placeDown()
            if i < w then
                robot.forward()
            end
        end
        if robotFacing == 'left' then
            robot.turnRight()
            robot.forward()
            robot.turnRight()
            robotFacing = 'right'
        else
            robot.turnLeft()
            robot.forward()
            robot.turnLeft()
            robotFacing = 'left'
        end
    end
end


-- function createPlatform(blocks)
--     robot.placeDown()
--     createPerimeter(blocks)
-- end


function initialize()
    print('Platform builder!\n')
    io.write('INSERT LENGTH: ')
    local length = io.read('number')
    io.write('INSERT WIDTH: ')
    local width = io.read('number')
    robot.forward()
    robot.turnRight()

    for i = 1,math.floor(dimensions / 2) do
        robot.forward()
    end
    
    robot.select(1)
    robot.turnAround()

    createPlatform(length, width)
end

initialize()