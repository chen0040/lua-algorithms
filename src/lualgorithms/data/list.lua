--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 10:13 AM
-- To change this template use File | Settings | File Templates.
--

local list = {}

list.ArrayList = {}
list.ArrayList.__index = list.ArrayList

function list.ArrayList.create()
    local s = {}
    setmetatable(s, list.ArrayList)

    s.a = { nil }
    s.aLen = 1
    s.N = 0
    return s
end

function list.ArrayList.createWith(a, aLen, N)
    local s = {}
    setmetatable(s, list.ArrayList)

    s.a = a
    s.aLen = aLen
    s.N = N
    return s
end

function list.create()
    return list.ArrayList.create()
end

function list.createWith(a, aLen, N)
    return list.ArrayList.createWith(a, aLen, N)
end

function list.ArrayList:makeCopy()
    local temp = {}
    for key,val in pairs(self.a) do
        temp[key] = val
    end
    return list.ArrayList.createWith(temp, self.aLen, self.N)
end

function list.ArrayList:add(value)
    self.a[self.N] = value
    self.N = self.N + 1
    if self.N == self.aLen then
        self:resize(self.aLen * 2)
    end
end

function list.ArrayList:set(index,value)
    self.a[index] = value
end

function list.ArrayList:get(index)
    local temp = self.a[index]
    return temp
end

function list.ArrayList:removeAt(index)
    if index == self.N-1 then
        self.N = self.N - 1
        return
    end
    for i = index+1,self.N-1 do
        self.a[i-1]=self.a[i]
    end
    self.N = self.N - 1
    if self.N == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end

end

function list.ArrayList:indexOf(value)
    if self.N == 0 then
        return -1
    end
    for i=0,self.N-1 do
        if self.a[i] == value then
            return i
        end
    end
    return -1
end

function list.ArrayList:remove(value)
    local index = self:indexOf(value)
    self:removeAt(index)
end

function list.ArrayList:resize(newSize)
    local temp = {}
    for i = 0,(newSize-1) do
        temp[i] = self.a[i]
    end

    self.a = temp
    self.aLen = newSize
end

function list.ArrayList:size()
    return self.N
end

function list.ArrayList:isEmpty()
    return self.N == 0
end

function list.ArrayList:enumerate()
    local temp = {}
    for i = 0,(self.N-1) do
        temp[i] = self.a[i]
    end
    return temp
end

function list.ArrayList:isSortedAscendingly(comparator)
    for i=0,(self:size()-2) do
        if comparator(a:get(i), a:get(i+1)) > 0 then
            return false
        end

    end
    return true
end

function list.ArrayList:isSortedDescendingly(comparator)
    for i=0,(self:size()-2) do
        if comparator(a:get(i), a:get(i+1)) < 0 then
            return false
        end

    end
    return true
end

return list
