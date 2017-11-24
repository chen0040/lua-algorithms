--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/6/2017
-- Time: 9:16 AM
-- To change this template use File | Settings | File Templates.
--

describe("Binary Search", function()
    it("should find 10 at index 0", function()
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

        local quicksort = require("lualgorithms.sorting.quicksort")
        local comparator = function(a1, a2) return a1 - a2 end
        quicksort.sort(a, comparator)

        local binarysearch = require('lualgorithms.binarysearch')
        assert.equal(binarysearch.indexOf(a, 10, comparator), 0)

    end)
end)

