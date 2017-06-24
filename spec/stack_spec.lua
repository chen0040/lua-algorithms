local stack = require 'data.stack'

describe('stack', function()

  describe('stack.LinkedListStack()', function()
    it('should push and pop items', function()
      local s = stack.LinkedListStack.create();
      s.push(1);
      assert.equal(s.pop(), 1)
    end)
  end)

end)
