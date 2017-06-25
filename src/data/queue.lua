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
    s = {}
    setmetatable(s, queue.Node)

    s.value = value
    s.next = nil

    return s
end

function queue.LinkedListQueue.create()
    s = {}
    setmetatable(s, queue.LinkedListQueue)

    s.first = nil
    s.last = nil
    s.N = 0

    return s
end

function queue.LinkedListQueue:enqueue(value)
    oldLast = self.last
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
    oldFirst = self.first
    if oldFirst == nil then
        return nil
    end
    self.first = oldFirst.next
    value = oldFirst.value
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
    index = 0
    temp = {}
    x = self.first
    while x ~= nil do
        value = x.value
        temp[index] = value
        index = index + 1
        x = x.next
    end

    return temp

end

return queue
