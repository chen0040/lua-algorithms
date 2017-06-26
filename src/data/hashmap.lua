--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:48 AM
-- To change this template use File | Settings | File Templates.
--

local hashmap = {}

hashmap.__index = hashmap

hashmap.Node = {}
hashmap.Node.__index = hashmap.Node

function hashmap.Node.create(key, value)
    local s = {}
    setmetatable(s, hashmap.Node)

    s.key = key
    s.value = value
    s.next = nil

    return s
end

function hashmap.create(hash)
    local s = {}
    setmetatable(s, hashmap)

    if hash == nil then
        hash = function(x) return x end
    end

    s.s = {}
    s.N = 0
    s.hash = hash

    return s
end

function hashmap:put(key, value)
    local h = self.hash(key)
    local x = self.s[h]
    local found = false
    while x ~= nil do
        if x.key == key then
            found = true
            x.value = value
            break
        end
        x = x.next
    end

    if found == false then
        local old = self.s[h]
        self.s[h] = hashmap.Node.create(key,value)
        self.s[h].next = old
        self.N = self.N + 1
    end

end

function hashmap:get(key)
    local h = self.hash(key)
    local x = self.s[h]
    while x ~= nil do
        if x.key == key then
            return x.value
        end
        x = x.next
    end
    return nil
end

function hashmap:containsKey(key)
    local h = self.hash(key)
    local x = self.s[h]
    while x ~= nil do
        if x.key == key then
            return true
        end
        x = x.next
    end
    return false
end

function hashmap:size()
    return self.N
end

function hashmap:isEmpty()
    return self.N == 0
end

function hashmap:remove(key)
    local h = self.hash(key)
    local x = self.s[h]
    local prev_x = nil
    while x ~= nil do
        if x.key == key then
            local value = x.value
            if prev_x == nil then
                self.s[h] = x.next
            else
                prev_x.next = x.next
            end
            self.N = self.N - 1
            return value
        end
        prev_x = x
        x = x.next
    end

    return nil
end

return hashmap

