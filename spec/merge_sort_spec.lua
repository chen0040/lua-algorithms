--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/6/2017
-- Time: 9:16 AM
-- To change this template use File | Settings | File Templates.
--

describe("Merge Sort", function()
    it("should sort ascendingly", function()
        local list = require("lualgorithms.data.list")
        local a = list.create()
        a:add(100)
        a:add(200)
        a:add(300)
        a:add(600)
        a:add(200)
        a:add(400)
        a:add(340)
        a:add(120)
        a:add(10)

        local mergesort = require("lualgorithms.sorting.mergesort")
        mergesort.sort(a, function(a1, a2) return a1 - a2 end)

        for i=0,(a:size()-2) do
            assert.is_true(a:get(i) <= a:get(i+1))
        end

    end)
end)

