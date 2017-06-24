---
--- Created by chen0.
--- DateTime: 24/6/2017 1:50 PM
---

local stack = {};

stack.Node = {};
stack.Node.__index = stack.Node;

function stack.Node.create(value)
    local s = {};
    setmetatable(s, stack.Node);

    s.value = value;
    s.next = nil;
end

stack.LinkedListStack = {};
stack.LinkedListStack.__index = stack.LinkedListStack;

function stack.LinkedListStack.create()
    local s = {};
    setmetatable(s, stack.LinkedListStack);

    s.first = nil;
    s.N = 0;

    return s;
end

function stack.LinkedListStack:push(value)
    oldFirst = self.first;
    self.first = stack.Node.create(value);
    self.first.next = oldFirst;
    self.N = self.N + 1;
end

function stack.LinkedListStack:pop(value)
    oldFirst = self.first;
    if oldFirst == nil then
        return nil;
    end
    value = oldFirst.value;
    self.first = oldFirst.next;
    self.N = self.N - 1;
    return value;
end

function stack.LinkedListStack:size(value)
    return self.N;
end

function stack.LinkedListStack:isEmpty()
    return self.N == 0;
end

return stack;



