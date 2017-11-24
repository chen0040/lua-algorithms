--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:12 AM
-- To change this template use File | Settings | File Templates.
--

describe('minpq', function()
    describe('minpq()', function()
        it('should return min first', function()
            local minpq = require('lualgorithms.data.minpq')
            local s = minpq.create(function(a1, a2) return a1 - a2 end)
            s:enqueue(10)
            s:enqueue(100)
            s:enqueue(20)
            s:enqueue(50)
            assert.equal(s:size(), 4)

            assert.equal(s:delMin(), 10)
            assert.equal(s:delMin(), 20)
            assert.equal(s:delMin(), 50)
            assert.equal(s:delMin(), 100)

            assert.equal(s:isEmpty(), true)
        end)
    end)
end)

