--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 10:55 AM
-- To change this template use File | Settings | File Templates.
--
--
local stack = require 'data.list'

describe('list', function()

    describe('list()', function()
        it('should add and remove item', function()
            local s = stack.create()
            s:add(1)
            s:add(2)
            s:add(3)
            for index,val in pairs(s:enumerate()) do
                print(index, val)
            end
            print(s:size())
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            s:removeAt(0)
            s:remove(2)
            s:removeAt(2)
            assert.equal(s:size(), 0)
            assert.equal(s:isEmpty(), true)
        end)
    end)
end)


