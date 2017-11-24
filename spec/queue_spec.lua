--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/6/2017
-- Time: 8:31 PM
-- To change this template use File | Settings | File Templates.
--

describe('queue', function()
    describe('LinkedListQueue()', function()
        it('should enqueue and dequeue correctly', function()
            local queue = require('lualgorithms.data.queue')
            local s = queue.LinkedListQueue.create()
            s:enqueue(10)
            s:enqueue(20)
            s:enqueue(30)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            for key,value in pairs(s:enumerate()) do
                print(key, value)
            end
            assert.equal(s:dequeue(), 10)
            assert.equal(s:dequeue(), 20)
            assert.equal(s:dequeue(), 30)
            assert.equals(s:size(), 0)
            assert.equals(s:isEmpty(), true)

        end)
    end)

    describe('queue()', function()
        it('should enqueue and dequeue correctly', function()
            local queue = require('lualgorithms.data.queue')
            local s = queue.create()
            s:enqueue(10)
            s:enqueue(20)
            s:enqueue(30)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            for key,value in pairs(s:enumerate()) do
                print(key, value)
            end
            assert.equal(s:dequeue(), 10)
            assert.equal(s:dequeue(), 20)
            assert.equal(s:dequeue(), 30)
            assert.equals(s:size(), 0)
            assert.equals(s:isEmpty(), true)

        end)
    end)

    describe('ArrayQueue()', function()
        it('should enqueue and dequeue correctly', function()
            local queue = require('lualgorithms.data.queue')
            local s = queue.ArrayQueue.create()
            s:enqueue(10)
            s:enqueue(20)
            s:enqueue(30)
            assert.equal(s:size(), 3)
            assert.equal(s:isEmpty(), false)
            for key,value in pairs(s:enumerate()) do
                print(key, value)
            end
            assert.equal(s:dequeue(), 10)
            assert.equal(s:dequeue(), 20)
            assert.equal(s:dequeue(), 30)
            assert.equals(s:size(), 0)
            assert.equals(s:isEmpty(), true)

        end)
    end)
end)

