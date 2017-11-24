--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:03 PM
-- To change this template use File | Settings | File Templates.
--

describe('redblacktree', function()
    describe('redblacktree()', function()
        it('should put and get and remove correctly', function()
            local redblacktree = require('lualgorithms.data.redblacktree')
            local comparator = function(a1, a2) return a1 - a2 end
            local s = redblacktree.create(comparator)
            s:put(100, 2)
            s:put(200, 4)
            s:put(450, 2)
            assert.equal(s:minKey(), 100)
            assert.equal(s:maxKey(), 450)
            assert.equal(s:get(100), 2)
            assert.equal(s:get(200), 4)
            assert.equal(s:get(450), 2)
            assert.equal(s:get(99), nil)
            assert.equal(s:containsKey(99), false)
            assert.equal(s:containsKey(100), true)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            s:remove(100)
            assert.equal(s:containsKey(100), false)
            assert.equal(s:size(), 2)
            s:remove(200)
            s:remove(450)
            assert.equal(s:isEmpty(), true)

            for i = 0,100 do
                s:put(i, i)
            end

            for i = 0,100 do
                assert.equal(s:get(i), i)
            end

            for i = 0,100 do
                s:remove(i)
            end

            assert.equal(s:isEmpty(), true)

        end)
    end)
end)

