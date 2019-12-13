PipePair = Class{}

local GAP_HEIGHT = 95

function PipePair:init(y)
    self.x = VIRTUAL_WIDTH + 32
    self.y = y
    self.timer = 0
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

    self.remove = false
    self.scored = false
end

function PipePair:update(dt)
    if self.timer > 2 then
        GAP_HEIGHT = GAP_HEIGHT + math.random(-5, 5)
        if GAP_HEIGHT < 75 then
            GAP_HEIGHT = 90
        end
        self.timer = 0
    end

    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED*dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
end
