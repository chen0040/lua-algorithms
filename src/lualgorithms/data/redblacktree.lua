--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 11:32 PM
-- To change this template use File | Settings | File Templates.
--

local redblacktree = {}
redblacktree.__index = redblacktree

redblacktree.Node = {}
redblacktree.Node.__index = redblacktree.Node

function redblacktree.Node.create(key, value)
    local s = {}
    setmetatable(s, redblacktree.Node)

    s.key = key
    s.value = value
    s.left = nil
    s.right = nil
    s.count = 0
    s.red = true

    return s
end

function redblacktree.create(comparator)
    local s = {}
    setmetatable(s, redblacktree)

    if comparator == nil then
        comparator = function(a1, a2) return a1 - a2 end
    end

    s.root = nil
    s.N = 0
    s.comparator = comparator

    return s
end

function redblacktree:put(key, value)
    self.root = self:_put(self.root, key, value)
end

function redblacktree:_put(x, key, value)
    if x == nil then
        x = redblacktree.Node.create(key, value)
    end

    local comp = self.comparator(key, x.key)
    if comp < 0 then
        x.left = self:_put(x.left, key, value)
    elseif comp > 0 then
        x.right = self:_put(x.right, key, value)
    else
        x.value = value
    end

    if self:isRed(x.left) == false and self:isRed(x.right) then
        x = self:rotateLeft(x)
    elseif self:isRed(x.left) and self:isRed(x.left.left) then
        x= self:rotateRight(x)
    elseif self:isRed(x.left) and self:isRed(x.right) then
        self:flipColor(x)
    end

    x.count = self:count(x.left) + self:count(x.right) + 1
    return x
end

function redblacktree:isRed(x)
    if x == nil then
        return false
    end
    return x.red
end

function redblacktree:flipColor(x)
    x.left.red = false
    x.right.red = false
    x.red = true
end

function redblacktree:rotateLeft(x)
    local h = x.right
    x.right = h.left
    h.left = x
    x.red = h.red
    h.red = false

    x = h
    x.count = self:count(x.left) + self:count(x.right) + 1

    return x
end

function redblacktree:rotateRight(x)
    local h = x.left
    x.left = h.right
    h.right = x
    x.red = h.red
    h.red = false

    x = h
    x.count = self:count(x.left) + self:count(x.right) + 1

    return x
end

function redblacktree:count(x)
    if x == nil then
        return 0
    end
    return x.count
end

function redblacktree:get(key)
    local x = self:_get(self.root, key)
    if x == nil then
        return nil
    end

    return x.value
end

function redblacktree:containsKey(key)
    local x = self:_get(self.root, key)
    return x ~= nil
end

function redblacktree:_get(x, key, value)
    if x == nil then
        return nil
    end

    local comp = self.comparator(key, x.key)
    if comp < 0 then
        return self:_get(x.left, key)
    elseif comp > 0 then
        return self:_get(x.right, key)
    else
        return x
    end
end

function redblacktree:size()
    return self:count(self.root)
end

function redblacktree:isEmpty()
    return self:size() == 0
end

function redblacktree:remove(key)
    self.root = self:_remove(self.root, key)
end

function redblacktree:_min(x)
    if x.left == nil then
        return x
    end

    return self:_min(x.left)
end

function redblacktree:_max(x)
    if x.right == nil then
        return x
    end

    return self:_max(x.right)
end

function redblacktree:_delMin(x)
    if x.left == nil then
        return x.right
    end
    x.left = self:_delMin(x.left)
    return x
end

function redblacktree:_remove(x, key)
    if x == nil then
        return nil
    end

    local comp = self.comparator(key, x.key)
    if comp < 0 then
        x.left = self:_remove(x.left, key)
    elseif comp > 0 then
        x.right = self:_remove(x.right, key)
    else
        if x.left == nil then
            x = x.right
        elseif x.right == nil then
            x = x.left
        else
            local m = self:_min(x.right)
            m.left = x.left
            m.right = self:_delMin(x.right)
            x = m
        end
    end

    if x ~= nil then
        if self:isRed(x.left) == false and self:isRed(x.right) then
            x = self:rotateLeft(x)
        elseif self:isRed(x.left) and self:isRed(x.left.left) then
            x= self:rotateRight(x)
        elseif self:isRed(x.left) and self:isRed(x.right) then
            self:flipColor(x)
        end

        x.count = self:count(x.left) + self:count(x.right) + 1
    end

    return x
end

function redblacktree:minKey()
    if self.root == nil then
        return nil
    end

    local x = self:_min(self.root)
    if x ~= nil then
        return x.key
    end
    return nil
end

function redblacktree:maxKey()
    if self.root == nil then
        return nil
    end

    local x= self:_max(self.root)

    if x ~= nil then
        return x.key
    end
    return nil
end

return redblacktree


