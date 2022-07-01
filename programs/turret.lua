local robot = require('robot')
local component = require('component')

local storageSelect = 1


function checkInv()
    if component.inventory_controller.getStackInInternalSlot(storageSelect) == nil then
        storageSelect = storageSelect + 1
        robot.select(storageSelect)
    end
end


function createSide(width)
    for i = 1, width - 3 do
        if width-i <= 1 then
            checkInv()
            robot.turnRight()
            robot.forward()
            robot.placeDown()

            robot.turnLeft()
            robot.forward()
            robot.placeDown()
        elseif width-i == 2 then
            checkInv()
            robot.placeDown()
            
        else
            robot.placeDown()
            robot.forward()
            
        end
    end
    robot.turnRight()
    robot.forward()
end



function createTurret(h,w)
    for i = 1, h do
        for i = 1, 4 do
            createSide(w)
        end
        robot.up()
    end
end


[
    0 1 1 1 0 0 0
    0 0 0 0 1 0 0
    0 0 0 0 0 1 0
    0 0 0 0 0 1 0
    0 0 0 0 0 1 0
    0 0 0 0 1 0 0
]


-- function createPlatform(blocks)
--     robot.placeDown()
--     createPerimeter(blocks)
-- end


function initialize()
    print('Platform builder!\n')
    print('Bot will move forward one tile to place first block.\n\n')
    print('example starting position on front wall: \nX = first block')
    print('width: 12, [0,0,0,X,0,0,0,0]\n')
    print('width: 11, [0,0,0,X,0,0,0]\n')

    io.write('INSERT HEIGHT: ')
    local height = io.read('number')
    io.write('INSERT WIDTH (minimum 6): ')
    local width = io.read('number')

    robot.forward()
    robot.turnRight()

    for i = 1,math.floor(width / 2 - 3) do
        robot.forward()
    end

    robot.turnAround()

    
    
    robot.select(1)
    

    createTurret(height, width)
    
end

initialize()