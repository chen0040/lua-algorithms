---
--- Created by chen0.
--- DateTime: 24/6/2017 1:50 PM
---

local stack = {}

stack.Node = {}
stack.Node.__index = stack.Node

function stack.Node.create(value)
    local s = {}
    setmetatable(s, stack.Node)

    s.value = value
    s.next = nil

    return s
end

stack.LinkedListStack = {}
stack.LinkedListStack.__index = stack.LinkedListStack

function stack.LinkedListStack.create()
    local s = {}
    setmetatable(s, stack.LinkedListStack)

    s.first = nil
    s.N = 0

    return s
end

function stack.create()
    return stack.LinkedListStack.create()
end

function stack.LinkedListStack:push(value)
    local oldFirst = self.first
    self.first = stack.Node.create(value)
    self.first.next = oldFirst
    self.N = self.N + 1
end

function stack.LinkedListStack:pop()
    local oldFirst = self.first
    if oldFirst == nil then
        return nil
    end
    local value = oldFirst.value
    self.first = oldFirst.next
    self.N = self.N - 1
    return value
end

function stack.LinkedListStack:size()
    return self.N
end

function stack.LinkedListStack:isEmpty()
    return self.N == 0
end

function stack.LinkedListStack:enumerate()
    local x = self.first
    local index = 0
    local temp = {}
    while x ~= nil do
        temp[index] = x.value
        index = index + 1
        x = x.next
    end

    return temp

end

stack.ArrayStack = {}
stack.ArrayStack.__index = stack.ArrayStack

function stack.ArrayStack.create()
    local s = {}
    setmetatable(s, stack.ArrayStack)

    s.a = { nil }
    s.N = 0
    s.aLen = 1

    return s
end

function stack.ArrayStack:push(value)
    self.a[self.N] = value
    self.N = self.N + 1
    if self.N == self.aLen then
        self:resize(self.aLen * 2)
    end
end

function stack.ArrayStack:resize(newSize)
    local temp = {}
    for i = 0,(newSize-1) do
        temp[i] = self.a[i]
    end

    self.a = temp
    self.aLen = newSize
end

function stack.ArrayStack:pop()
    if self.N == 0 then
        return nil
    end

    local value = self.a[self.N-1]
    self.N = self.N - 1

    if self.N == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end
    return value
end

function stack.ArrayStack:size()
    return self.N
end

function stack.ArrayStack:isEmpty()
    return self.N == 0
end

function stack.ArrayStack:enumerate()
    local temp = {}
    for i = 0,(self.N-1) do
        temp[i] = self.a[i]
    end
    return temp
end

return stack



