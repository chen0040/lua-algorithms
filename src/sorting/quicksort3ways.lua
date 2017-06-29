--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 10:14 AM
-- To change this template use File | Settings | File Templates.
--

local quicksort3ways = {}

quicksort3ways.__index = quicksort3ways

function quicksort3ways.sort(a, comparator)
    quicksort3ways._sort(a, 0, a:size()-1, comparator)
end

function quicksort3ways._sort(a, lo, hi, comparator)
    if lo >= hi then
        return
    end

    local i = lo
    local lt = lo
    local gt = hi
    local v = a:get(lo)
    while i <= gt do
        local cmp = comparator(a:get(i), v)
        if cmp < 0 then
            quicksort3ways.exchange(a, i, lt)
            i = i + 1
            lt = lt + 1
        elseif cmp > 0 then
            quicksort3ways.exchange(a, i, gt)
            gt = gt - 1
        else
            i = i + 1
        end
    end

    quicksort3ways._sort(a, lo, lt-1, comparator)
    quicksort3ways._sort(a, gt+1, hi, comparator)
end

function quicksort3ways.exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

return quicksort3ways

