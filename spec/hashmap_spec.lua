--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:03 PM
-- To change this template use File | Settings | File Templates.
--

describe('hashmap', function()
    describe('hashmap()', function()
        it('should put and get and remove correctly', function()
            local hashmap = require('lualgorithms.data.hashmap')
            local hash_func = function(x) return x % 1000 end
            local s = hashmap.create(hash_func)
            s:put(100, 2)
            s:put(200, 4)
            s:put(450, 2)
            assert.equal(s:get(100), 2)
            assert.equal(s:get(200), 4)
            assert.equal(s:get(450), 2)
            assert.equal(s:get(99), nil)
            assert.equal(s:containsKey(99), false)
            assert.equal(s:containsKey(100), true)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            assert.equal(s:remove(100), 2)
            assert.equal(s:containsKey(100), false)
            assert.equal(s:size(), 2)
            s:remove(200)
            s:remove(450)
            assert.equal(s:isEmpty(), true)
        end)
    end)
end)

