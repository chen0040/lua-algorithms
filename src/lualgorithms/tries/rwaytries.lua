--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 5:10 PM
-- To change this template use File | Settings | File Templates.
--

local rwaytries = {}

rwaytries.__index = rwaytries

rwaytries.Node = {}

rwaytries.Node.__index = rwaytries.Node

function rwaytries.charAt(s, i)
    if string.len(s)-1 < i then
        return -1
    end

    return string.byte(s, i+1)
end

function rwaytries.Node.create(key)
    local s = {}
    setmetatable(s, rwaytries.Node)

    s.nodes = {}
    s.value = nil
    return s
end

function rwaytries.create()
    local s = {}
    setmetatable(s, rwaytries)

    s.root = nil
    s.N = 0
    return s
end

function rwaytries:put(key, value)
    self.root = self:_put(self.root, key, value, 0)
end

function rwaytries:_put(x, key, value, d)


    if x == nil then
        x = rwaytries.Node.create()
    end

    if d == key:len() then
        if x.value == nil then
            self.N = self.N + 1
        end
        x.value = value
        return x
    end

    local c = rwaytries.charAt(key, d)
    x.nodes[c] = self:_put(x.nodes[c], key, value, d + 1)

    return x
end

function rwaytries:get(key)
    local x = self:_get(self.root, key, 0)
    if x ~= nil then
        return x.value
    end
    return nil
end

function rwaytries:_get(x, key, d)
    if x == nil then
        return nil
    end

    if d == key:len() then
        return x
    end

    local c = rwaytries.charAt(key, d)
    return self:_get(x.nodes[c],key, d+1)
end

function rwaytries:remove(key)
    local x = self:_get(self.root, key, 0)
    if x ~= nil then
        if x.value ~= nil then
            self.N = self.N - 1
        end
        x.value = nil
    end
end



function rwaytries:containsKey(key)
    local x = self:_get(self.root, key, 0)
    if x == nil then
        return false
    end

    return x.value ~= nil
end

function rwaytries:size()
    return self.N
end

function rwaytries:isEmpty()
    return self.N == 0
end

function rwaytries:keys()
    local queue = require('lualgorithms.data.list').create()

    self:collect(self.root, '', queue)
    return queue
end

function rwaytries:keysWithPrefix(prefix)
    local x = self:_get(self.root, prefix, 0)

    local queue = require('lualgorithms.data.list').create()

    self:collect(x, prefix, queue)
    return queue
end

function rwaytries:collect(x, prefix, queue)
    if x == nil then
        return
    end

    if x.value ~=nil then
        queue:add(prefix)
    end

    for key,value in pairs(x.nodes) do
        self:collect(value, prefix .. string.char(key), queue)
    end

end

return rwaytries



