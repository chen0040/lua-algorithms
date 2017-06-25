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
    s = {}
    setmetatable(s, list.ArrayList)

    s.a = { nil }
    s.aLen = 1
    s.N = 0
    return s
end

function list.create()
    return list.ArrayList.create()
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
    index = self:indexOf(value)
    self:removeAt(index)
end

function list.ArrayList:resize(newSize)
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

function list.ArrayList:size()
    return self.N
end

function list.ArrayList:isEmpty()
    return self.N == 0
end

function list.ArrayList:enumerate()
    temp = {}
    for i = 0,(self.N-1) do
        temp[i] = self.a[i]
    end
    return temp
end

return list
