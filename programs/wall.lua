local robot = require('robot')

local storageSelect = 1


function checkInv()
    if component.inventory_controller.getStackInInternalSlot(storageSelect) == nil then
        storageSelect = storageSelect + 1
        robot.select(storageSelect)
    end
end

function createWall(l, h)
    for i = 1, h do
        for i = 1, l do
            checkInv()
            robot.placeDown()
            if i < l then
                robot.forward()
            end
        end
        if i < h then
            robot.up()
            robot.turnAround()
        end
     end
end


function initialize()
    print('Wall builder!\n')
    io.write('INSERT HEIGHT: ')
    local height = io.read('number')
    io.write('INSERT LENGTH: ')
    local length = io.read('number')

    robot.up()
    robot.select(1)
    
    createWall(length, height)
end

initialize()