--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 8:10 PM
-- To change this template use File | Settings | File Templates.
--

local queue = {}

queue.LinkedListQueue = {}
queue.LinkedListQueue.__index = queue.LinkedListQueue

queue.Node = {}
queue.Node.__index = queue.Node

function queue.Node.create(value)
    local s = {}
    setmetatable(s, queue.Node)

    s.value = value
    s.next = nil

    return s
end

function queue.LinkedListQueue.create()
    local s = {}
    setmetatable(s, queue.LinkedListQueue)

    s.first = nil
    s.last = nil
    s.N = 0

    return s
end

function queue.create()
    return queue.LinkedListQueue.create()
end

function queue.LinkedListQueue:enqueue(value)
    local oldLast = self.last
    self.last = queue.Node.create(value)
    if oldLast ~= nil then
        oldLast.next = self.last
    end
    if self.first == nil then
        self.first = self.last
    end
    self.N = self.N + 1
end

function queue.LinkedListQueue:dequeue()
    local oldFirst = self.first
    if oldFirst == nil then
        return nil
    end
    self.first = oldFirst.next
    local value = oldFirst.value
    if self.first == nil then
        self.last = nil
    end
    self.N = self.N - 1
    return value
end

function queue.LinkedListQueue:size()
    return self.N
end

function queue.LinkedListQueue:isEmpty()
    return self.N == 0
end

function queue.LinkedListQueue:enumerate()
    local index = 0
    local temp = {}
    local x = self.first
    while x ~= nil do
        local value = x.value
        temp[index] = value
        index = index + 1
        x = x.next
    end

    return temp

end

queue.ArrayQueue = {}
queue.ArrayQueue.__index = queue.ArrayQueue

function queue.ArrayQueue.create()
    local s = {}
    setmetatable(s, queue.ArrayQueue)

    s.head = 0
    s.tail = 0
    s.a = { nil }
    s.aLen = 0

    return s
end

function queue.ArrayQueue:enqueue(value)
    self.a[self.tail] = value
    self.tail = self.tail + 1
    if self.tail - self.head == self.aLen then
        self:resize(self.aLen * 2)
    end

end

function queue.ArrayQueue:size()
    return self.tail - self.head
end

function queue.ArrayQueue:isEmpty()
    return self.tail == self.head
end

function queue.ArrayQueue:dequeue(value)
    if self.tail == self.head then
        return nil
    end

    value = self.a[self.head]
    self.head = self.head + 1
    if self.tail - self.head == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end

    return value
end

function queue.ArrayQueue:resize(newSize)
    local temp = {}
    for i = 0,(newSize-1) do
        if i < self.tail - self.head then
            temp[i] = nil
        else
            temp[i] = self.a[i + self.head]
        end
    end

    self.a = temp
    self.aLen = newSize
    self.tail = self.tail - self.head
    self.head = 0
end

function queue.ArrayQueue:enumerate()
    local temp = {}
    for i = self.head,self.tail-1 do
        temp[i - self.head] = self.a[i]
    end
    return temp
end

return queue
