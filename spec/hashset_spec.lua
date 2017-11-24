--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:03 PM
-- To change this template use File | Settings | File Templates.
--

describe('hashset', function()
    describe('hashset()', function()
        it('should put and get and remove correctly', function()
            local hashset = require('lualgorithms.data.hashset')
            local hash_func = function(x) return x % 1000 end
            local s = hashset.create(hash_func)
            s:add(100, 2)
            s:add(200, 4)
            s:add(450, 2)

            assert.equal(s:contains(99), false)
            assert.equal(s:contains(100), true)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            s:remove(100)
            assert.equal(s:contains(100), false)
            assert.equal(s:size(), 2)
            s:remove(200)
            s:remove(450)
            assert.equal(s:isEmpty(), true)
        end)
    end)
end)

