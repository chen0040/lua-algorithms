--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 4:55 PM
-- To change this template use File | Settings | File Templates.
--

describe("Union Find", function()
    it("should connect points union together", function()
        local unionfind = require('lualgorithms.unionfind').create()
        unionfind:union(1, 2)
        unionfind:union(4, 6)
        unionfind:union(7, 4)

        assert.equal(unionfind:connected(6, 7), true)
        assert.equal(unionfind:connected(4, 7), true)
        assert.equal(unionfind:connected(6, 4), true)
        assert.equal(unionfind:connected(6, 1), false)
        assert.equal(unionfind:connected(7, 2), false)
    end)
end)

