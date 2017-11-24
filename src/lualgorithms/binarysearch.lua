--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 3:39 PM
-- To change this template use File | Settings | File Templates.
--

binarysearch = {}
binarysearch.__index = binarysearch

function binarysearch.indexOf(a, value, comparator)
    local lo = 0
    local hi = a:size() - 1
    while lo <= hi do
        local mid = lo + math.floor((hi - lo) / 2)
        local cmp = comparator(value, a:get(mid))
        if cmp < 0 then
            hi = mid - 1
        elseif cmp > 0 then
            lo = mid + 1
        else
            return mid
        end
    end
    return -1

end

return binarysearch

