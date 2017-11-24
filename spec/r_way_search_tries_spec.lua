--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 5:35 PM
-- To change this template use File | Settings | File Templates.
--

describe("R-Ways Search Tries", function()
    it("should store and retrives string-based key value", function()
        local rwaytries = require('lualgorithms.tries.rwaytries')
        local s = rwaytries.create()

        s:put("Hello", "World")
        s:put("Hi", "Morning")
        s:put("How", "are you?")

        assert.equal(s:isEmpty(), false)
        assert.equal(s:size(), 3)

        assert.equal(s:get("Hello"), "World")
        assert.equal(s:get("Hi"), "Morning")
        assert.equal(s:get("How"), "are you?")
        assert.equal(s:containsKey("Hello"), true)
        assert.equal(s:containsKey("hello"), false)

        s:remove("Hello")

        assert.equal(s:containsKey("Hello"), false)
        assert.equal(s:size(), 2)

        local keys = s:keys()
        for i=0, keys:size()-1 do
            print(keys:get(i))
        end

        s:put('there', 'is')
        s:put('the', 'ninja')
        s:put('those', 'turtles')
        s:put('these', 'ducks')
        s:put('turles', 'ducks')
        keys = s:keysWithPrefix('th')
        for i=0, keys:size()-1 do
            print(keys:get(i))
        end


    end)
end)

