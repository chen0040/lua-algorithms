# lua-algorithms

This library was developed with the purpose of making general algorithms and data structures available in Java language also available in Lua.

The library covers commonly used data structures (ArrayList, Stack, Queue, Priority Queue, Balanced Search Tree, HashMap, Set, Tries) and algorithms (various sorting and search algorithms, shuffling, union find, etc)

# Install

```bash
luarocks install lualgorithms
```

# Usage

### Stack

```lua
local stack = require 'lualgorithms.data.stack'

local s = stack.create()
s:push(1)
s:push(2)
s:push(3)
print(s:size())
print(s:isEmpty())
print(s:pop())
for index,val in pairs(s:enumerate()) do
    print(index, val)
end
```

### List

The list behaves the same as the Java ArrayList API, and is zero-based indexing.

```lua
local list = require 'lualgorithms.data.list'

local s = list.create()
s:add(1) -- s becomes [1]
s:add(2) -- s becomes [1, 2]
s:add(3) -- s becomes [1, 2, 3]
s:set(2, 4) -- s becomes [1, 2, 4]

for index,val in pairs(s:enumerate()) do
    print(index, val)
end
for i = 0,s:size()-1 do
    print(s:get(i))
end
print(s:size())
print(s:isEmpty())
s:removeAt(0) -- s becomes [2, 4]
s:remove(2) -- s becomes [4]
s:removeAt(0) -- s is now empty
```

### Queue

```lua
 local queue = require('lualgorithms.data.queue')
local s = queue.create()
s:enqueue(10)
s:enqueue(20)
s:enqueue(30)
print(s:size()) -- return 3
print(s:isEmpty()) -- return false
for key,value in pairs(s:enumerate()) do
    print(key, value)
end
print(s:dequeue()) -- return 10
print(s:dequeue()) -- return 20
print(s:dequeue()) -- return 30

```

### MinPQ

```lua
local minpq = require('lualgorithms.data.minpq')
local comparer = function(a1, a2) return a1 - a2 end -- method that return negative value if if a1 < a2; 0 if a1 == a2; positive otherwise
local s = minpq.create(comparer)
s:enqueue(10)
s:enqueue(100)
s:enqueue(20)
s:enqueue(50)
print(s:size()) -- return 4
print(s:isEmpty()) -- return false

print(s:delMin()) -- return 10
print(s:delMin()) -- return 20
print(s:delMin()) -- return 50
print(s:delMin()) -- return 100

print(s:isEmpty()) -- return true
```


### MaxPQ

```lua
local maxpq = require('lualgorithms.data.maxpq')
local comparer = function(a1, a2) return a1 - a2 end -- method that return negative value if if a1 < a2; 0 if a1 == a2; positive otherwise
local s = maxpq.create(comparer)
s:enqueue(10)
s:enqueue(100)
s:enqueue(20)
s:enqueue(50)
print(s:size()) -- return 4
print(s:isEmpty()) -- return false

print(s:delMax()) -- return 100
print(s:delMax()) -- return 50
print(s:delMax()) -- return 20
print(s:delMax()) -- return 10

print(s:isEmpty()) -- return true
```

### HashMap

```lua
local hashmap = require('data.hashmap')
local hash_func = function(x) return x % 1000 end
local s = hashmap.create(hash_func)
s:put(100, 2)
s:put(200, 4)
s:put(450, 2)
print(s:get(100)) -- return  2
print(s:get(200)) -- return  4
print(s:get(450)) -- return  2
print(s:get(99)) -- return  nil
print(s:containsKey(99)) -- return  false
print(s:containsKey(100)) -- return  true
print(s:size()) -- return  3
print(s:isEmpty()) -- return  false
print(s:remove(100)) -- return  2
print(s:containsKey(100)) -- return  false
print(s:size()) -- return  2
s:remove(200)
s:remove(450)
print(s:isEmpty()) -- return  true
```

### SortedMap (Left-Leaning Red Black Tree)

```lua
local map = require('data.redblacktree')
local comparator = function(a1, a2) return a1 - a2 end
local s = map.create(comparator)
s:put(100, 2)
s:put(200, 4)
s:put(450, 2)
print(s:minKey()) -- return 100
print(s:maxKey()) -- return 450
print(s:get(100)) -- return  2
print(s:get(200)) -- return  4
print(s:get(450)) -- return  2
print(s:get(99)) -- return  nil
print(s:containsKey(99)) -- return  false
print(s:containsKey(100)) -- return  true
print(s:size()) -- return  3
print(s:isEmpty()) -- return  false
print(s:remove(100)) -- return  2
print(s:containsKey(100)) -- return  false
print(s:size()) -- return  2
s:remove(200)
s:remove(450)
print(s:isEmpty()) -- return  true
```

