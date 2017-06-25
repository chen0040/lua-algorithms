--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 11:33 PM
-- To change this template use File | Settings | File Templates.
--

local minpq = {}

minpq.__index = minpq

function minpq.create(comparer)
    local s = {}
    setmetatable(s, minpq)

    s.s = { nil }
    s.aLen = 1
    s.N = 0
    s.comparer = comparer

    return s
end

function minpq:enqueue(value)
    if self.N + 1 == self.aLen then
        self:resize(self.aLen * 2)
    end
    self.N = self.N + 1
    self.s[self.N] = value
    self:swim(self.N)
end

function minpq:delMin()
    if self.N == 0 then
        return nil
    end

    local value = self.s[1]
    self:exchange(self.s, 1, self.N)
    self.N = self.N - 1
    self:sink(1)
    if self.N + 1 == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end

    return value

end

function minpq:resize(newSize)
    local temp = {}
    for i = 0,(newSize-1) do
        temp[i] = self.s[i]
    end

    self.s = temp
    self.aLen = newSize
end

function minpq:swim(k)
    while k > 1 do

        local parent = math.floor(k / 2)
        if self:less(self.s[k], self.s[parent]) then
            self:exchange(self.s, k, parent)
            k = parent
        else
            break
        end
    end
end

function minpq:sink(k)
    while k * 2 <= self.N do
        local child = k * 2
        if child < self.N and self:less(self.s[child+1], self.s[child]) then
            child = child + 1
        end
        if self:less(self.s[child], self.s[k]) then
            self:exchange(self.s, child, k)
            k = child
        else
            break
        end
    end

end

function minpq:size()
    return self.N
end

function minpq:isEmpty()
    return self.N == 0
end

function minpq:less(a1, a2)
    return self.comparer(a1, a2) < 0
end

function minpq:exchange(s, i, j)
    local temp = s[i]
    s[i] = s[j]
    s[j] = temp
end

return minpq

