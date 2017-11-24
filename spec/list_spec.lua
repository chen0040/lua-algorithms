--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 10:55 AM
-- To change this template use File | Settings | File Templates.
--
--
local list = require 'lualgorithms.data.list'

describe('list', function()

    describe('list()', function()
        it('should add and remove item', function()
            local s = list.create()
            s:add(1)
            s:add(2)
            s:add(3)
            for index,val in pairs(s:enumerate()) do
                print(index, val)
            end
            for i = 0,s:size()-1 do
                print(s:get(i))
            end
            s:set(2, 4)
            print(s:size())
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            s:removeAt(0)
            s:remove(2)
            s:removeAt(0)
            assert.equal(s:size(), 0)
            assert.equal(s:isEmpty(), true)
        end)
    end)

    describe('makeCopy()', function()
        it('should create a separate copy', function()
            local s = list.create()
            for i = 0,9 do
                s:add(i)
            end
            local s2 = s:makeCopy()
            assert.equal(s:size(), s2:size())
            for i = 0,9 do
                assert.equal(s:get(i), s2:get(i))
            end


        end)
    end)
end)


