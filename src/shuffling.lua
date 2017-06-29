--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 11:47 AM
-- To change this template use File | Settings | File Templates.
--

local shuffling = {}

function shuffling.shuffle(a)
    local N = a:size()
    for i=1,(N-1) do
        local j = math.random(i+1) - 1
        shuffling.exchange(a, i, j)
    end

end

function shuffling.exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

return shuffling

