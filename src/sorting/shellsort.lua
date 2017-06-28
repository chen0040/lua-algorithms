--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/6/2017
-- Time: 1:07 PM
-- To change this template use File | Settings | File Templates.
--

local shellsort = {}
shellsort.__index = shellsort

function shellsort.sort(a, comparator)
    local N = a:size()
    local h = 0
    while h < math.floor(N / 3) do
        h = h * 3 + 1
    end

    for step=h,1,-1 do
        for i=step,(N-1) do
            for j=i,step,-step do
                if comparator(a:get(j), a:get(j-step)) < 0 then
                    shellsort.exchange(a, j, j-step)
                else
                    break
                end
            end
        end
    end

end

function shellsort.exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

return shellsort

