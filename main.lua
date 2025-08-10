_G.love = require("love")

--counter
counter = 0

-- buttons
openbutton = {x = 800,
    y = 800,
    width = 300,
    height = 150}

quitbutton = {x = 1800,
    y = 25,
    width = 100,
    height = 100}

-- quit button closes game
    function love.mousepressed(x, y, button)
        if button == 1 then
            if x >= quitbutton.x
             and x <= quitbutton.x
              + quitbutton.width and
           y >= quitbutton.y
            and y <= quitbutton.y
             + quitbutton.height then love.event.quit() end
        end
    
    --open button opens chest
            if x >= openbutton.x and x <= openbutton.x + openbutton.width
     and y >= openbutton.y and y <= openbutton.y + openbutton.height then
        local chance = math.random(1000)
        if chance <= 10 then --1% chance
            counter = counter + 100
        elseif chance <= 100 then --10% chance
            counter = counter + 10
        elseif chance <= 500 then --50% chance
            counter = counter + 5
        elseif chance <= 600 then --6% chance
            counter = counter / 2
        elseif chance <= 800 then --80% chance
            counter = counter + 1
        end
      end
    end


function love.load()

    counterfont = love.graphics.newFont(50) --macht counter groesser
    math.randomseed(os.time()) --random seed generator

end

function love.update(dt)

end

function love.draw()

--drawing open button and text
 love.graphics.setColor(0, 0, 1)
love.graphics.rectangle("fill",
 openbutton.x, openbutton.y,
 openbutton.width, openbutton.height)
 
--drawing quit button and text
 love.graphics.setColor(1, 0, 0)
 love.graphics.rectangle("fill",
 quitbutton.x, quitbutton.y,
 quitbutton.width, quitbutton.height)

 --drawing counter
love.graphics.setFont(counterfont)
love.graphics.setColor(1, 1, 1)
love.graphics.print("Counter: " .. counter, 25, 25)

end
