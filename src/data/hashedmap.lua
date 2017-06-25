--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:48 AM
-- To change this template use File | Settings | File Templates.
--

local hashmap = {}

hashmap.__index = hashmap

function hashmap.create()
    local s = {}
    setmetatable(s, hashmap)

    s.s = { nil }
    s.aLen = 1

end

