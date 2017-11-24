--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 10:04 AM
-- To change this template use File | Settings | File Templates.
--

local quicksort = {}
quicksort.__index = quicksort

function quicksort.sort(a, comparator)
    quicksort._sort(a, 0, a:size()-1, comparator)
end

function quicksort._sort(a, lo, hi, comparator)
    if lo >= hi then
        return
    end

    local j = quicksort._partition(a, lo, hi, comparator)
    quicksort._sort(a, lo, j-1, comparator)
    quicksort._sort(a, j+1, hi, comparator)
end

function quicksort._partition(a, lo, hi, comparator)
    local i = lo
    local j = hi + 1
    local v = a:get(lo)
    while true do
        i = i + 1
        while comparator(a:get(i), v) < 0 do
            i = i+1
            if i >= hi then
                break
            end
        end
        j = j - 1
        while comparator(v, a:get(j)) < 0 do
            j = j - 1
            if j <= lo then
                break
            end
        end

        if i >= j then
            break
        end

        quicksort.exchange(a, i, j)
    end
    quicksort.exchange(a, lo, j)
    return j
end

function quicksort.exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

return quicksort
