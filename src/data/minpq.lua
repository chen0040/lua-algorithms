--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 11:33 PM
-- To change this template use File | Settings | File Templates.
--

local minpq = {}

minpq.__index = minpq

function minpq.create()
    s = {}
    setmetatable(s, minpq)

    s.a = { nil }
    s.aLen = 1
    s.N = 0

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

    value = self.s[1]
    self:exchange(self.s, 1, self.N)
    self.N = self.N - 1
    self:sink(1)
    if self.N + 1 == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end

    return value

end

function minpq:resize(newSize)
    temp = {}
    for i = 0,(newSize-1) do
        if self.a[i] == nil then
            temp[i] = nil
        else
            temp[i] = self.a[i]
        end
    end

    self.a = temp
    self.aLen = newSize
end

function minpq:swim(k)
    while k < 1 do
        parent = math.floor(k / 2)
        if self:less(k, parent) then
            self:exchange(self.s, k, parent)
            k = parent
        else
            break
        end
    end
end

function minpq:less(a1, a2)
    return a1 - a2 < 0
end

function minpq:exchange(s, i, j)
    temp = s[i]
    s[i] = s[j]
    s[j] = temp
end

