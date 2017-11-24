--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/6/2017
-- Time: 11:53 AM
-- To change this template use File | Settings | File Templates.
--

describe('Shuffling', function()
    it('should shuffle a list', function()
local list = require('lualgorithms.data.list')
        local s = list.create()
        for i=1,10 do
            s:add(i)
        end
        local shuffling = require('lualgorithms.shuffling')
        shuffling.shuffle(s)
        for i=0,(s:size()-1) do
            print(s:get(i))
        end

    end)
end)

