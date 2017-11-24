--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/6/2017
-- Time: 1:17 PM
-- To change this template use File | Settings | File Templates.
--

local hashset = {}

hashset.__index = hashset

hashset.Node = {}
hashset.Node.__index = hashset.Node

function hashset.Node.create(key)
    local s = {}
    setmetatable(s, hashset.Node)

    s.key = key
    s.next = nil

    return s
end

function hashset.create(hash)
    local s = {}
    setmetatable(s, hashset)

    if hash == nil then
        hash = function(x) return x end
    end

    s.s = {}
    s.N = 0
    s.hash = hash

    return s
end

function hashset:add(key)
    local h = self.hash(key)
    local x = self.s[h]
    local found = false
    while x ~= nil do
        if x.key == key then
            found = true
            break
        end
        x = x.next
    end

    if found == false then
        local old = self.s[h]
        self.s[h] = hashset.Node.create(key)
        self.s[h].next = old
        self.N = self.N + 1
    end

end

function hashset:contains(key)
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

function hashset:size()
    return self.N
end

function hashset:isEmpty()
    return self.N == 0
end

function hashset:remove(key)
    local h = self.hash(key)
    local x = self.s[h]
    local prev_x = nil
    while x ~= nil do
        if x.key == key then
            if prev_x == nil then
                self.s[h] = x.next
            else
                prev_x.next = x.next
            end
            self.N = self.N - 1
        end
        prev_x = x
        x = x.next
    end

    return nil
end

return hashset

