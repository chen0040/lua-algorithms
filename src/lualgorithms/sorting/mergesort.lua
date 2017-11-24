--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 4:20 AM
-- To change this template use File | Settings | File Templates.
--

local mergesort = {}
mergesort.__index = mergesort

function mergesort.sort(a, comparator)
    local aux = require('lualgorithms.data.list').create()
    for i=0,(a:size()-1) do
        aux:add(0)
    end
    mergesort._sort(a, aux, 0, a:size()-1, comparator)
end

function mergesort._sort(a, aux, lo, hi, comparator)
    if lo >= hi then
        return
    end

    local mid = lo + math.floor((hi - lo) / 2)
    mergesort._sort(a, aux, lo, mid, comparator)
    mergesort._sort(a, aux, mid+1, hi, comparator)
    mergesort._merge(a, aux, lo, mid, hi, comparator)
end

function mergesort._merge(a, aux, lo, mid, hi, comparator)
    local i = lo
    local j = mid+1
    for k=lo,hi do
        aux:set(k, a:get(k))
    end

    for k=lo,hi do
        if i > mid then
            a:set(k, aux:get(j))
            j = j+1
        elseif j > hi then
            a:set(k, aux:get(i))
            i = i + 1
        else
            local cmp = comparator(aux:get(i), aux:get(j))
            if cmp <= 0 then
                a:set(k, aux:get(i))
                i = i + 1
            else
                a:set(k, aux:get(j))
                j = j + 1
            end
        end
    end


end

return mergesort

