--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 27/6/2017
-- Time: 9:59 PM
-- To change this template use File | Settings | File Templates.
--

local selection = {}
selection.__index = selection

function selection.sort(a, comparer)
    local N = a:size()

    for i=0,(N-1) do
        local J = i
        for j=i,(N-1) do
            if comparer(a:get(j), a:get(J)) < 0 then
                J = j
            end
        end

        selection.exchange(a, i, J)
    end
end

function selection.exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

return selection


