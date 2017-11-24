--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 4:49 PM
-- To change this template use File | Settings | File Templates.
--

local unionfind = {}

unionfind.__index = unionfind

function unionfind.create()
    local s = {}
    setmetatable(s, unionfind)

    s.id = {}
    return s
end

function unionfind:union(v, w)
    local pv = self:root(v)
    local pw = self:root(w)
    if pv ~= pw then
        self.id[pv] = pw
    end

end

function unionfind:root(v)
    if self.id[v] == nil then
        self.id[v] = v
    end
    local x = v
    while x ~= self.id[x] do
        self.id[x] = self.id[self.id[x]]
        x = self.id[x]
    end

    return x

end

function unionfind:connected(v, w)
    return self:root(v) == self:root(w)
end

return unionfind

