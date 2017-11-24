--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 10:30 AM
-- To change this template use File | Settings | File Templates.
--

local heapsort = {}

heapsort.__index = heapsort

function heapsort.sort(a, comparator)
    local N = a:size()
    for i=(math.floor(N/2)),1,-1 do
        heapsort._sink(a, i, N, comparator)
    end

    while N > 1 do
        heapsort._exchange(a, heapsort.index(1), heapsort.index(N))
        N = N - 1
        heapsort._sink(a, 1, N, comparator)
    end
end

function heapsort.index(i)
    return i - 1
end

function heapsort._exchange(a, i, j)
    local temp = a:get(i)
    a:set(i, a:get(j))
    a:set(j, temp)
end

function heapsort._sink(a, k, N, comparator)
    while 2 * k <= N do
        local child = k * 2
        if child < N and comparator(a:get(heapsort.index(child+1)), a:get(heapsort.index(child))) > 0 then
            child = child + 1
        end
        if comparator(a:get(heapsort.index(child)), a:get(heapsort.index(k))) > 0 then
            heapsort._exchange(a, heapsort.index(child), heapsort.index(k))
            k = child
        else
            break
        end
    end

end


return heapsort

