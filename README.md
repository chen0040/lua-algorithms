# lua-algorithms

This library was developed with the purpose of making general algorithms and data structures available in Java language also available in Lua.

# Features

The library covers commonly used data structures (ArrayList, Stack, Queue, Priority Queue, Balanced Search Tree, HashMap, Set, Tries) and algorithms (various sorting and search algorithms, shuffling, union find, etc)

For developers on Windows platform, a Vagrantfile is provided in the source code to allow them to run luarocks under window environment.


# Install

```bash
luarocks install lualgorithms
```

# Usage

## Common Data Structures

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

### ArrayList

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

### HashSet

```lua
local hashset = require('lualgorithms.data.hashset')
local hash_func = function(x) return x % 1000 end
local s = hashset.create(hash_func)
s:add(100, 2)
s:add(200, 4)
s:add(450, 2)

print(s:contains(99)) -- return false
print(s:contains(100)) -- return true
print(s:size()) -- return 3
print(s:isEmpty()) -- return false
s:remove(100)
print(s:contains(100)) -- return false)
```

### HashMap

```lua
local hashmap = require('lualgorithms.data.hashmap')
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
local map = require('lualgorithms.data.redblacktree')
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

### Tries (R-way Tries)

```lua
local rwaytries = require('lualgorithms.tries.rwaytries')
local s = rwaytries.create()

s:put("Hello", "World")
s:put("Hi", "Morning")
s:put("How", "are you?")

print(s:isEmpty()) -- return false
print(s:size()) -- return 3

print(s:get("Hello")) -- return "World"
print(s:get("Hi")) -- return "Morning"
print(s:get("How")) -- return "are you?"
print(s:containsKey("Hello")) -- return true
print(s:containsKey("hello")) -- return false

s:remove("Hello")

print(s:containsKey("Hello")) -- return false
print(s:size()) -- return 2

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
```

## Sorting

As in Java, the sorting is performed on ArrayList by default (which is lualgorithms.data.list).

Note that the default is to sort ascendingly, which can be reversed via the comparator function pass in as the second parameter.

### Sorting (Selection Sort)

```lua
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

local selection = require("lualgorithms.sorting.selection")
selection.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (Insertion Sort)

```lua
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

local insertion = require("lualgorithms.sorting.insertion")
insertion.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (Shell Sort)

```lua
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

local shellsort = require("lualgorithms.sorting.shellsort")
shellsort.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (Merge Sort)

```lua
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

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (Quick Sort)

```lua
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
quicksort.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (3-ways Quick Sort)

```lua
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

local quicksort3ways = require("lualgorithms.sorting.quicksort3ways")
quicksort3ways.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

### Sorting (Heap Sort)

```lua
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

local heapsort = require("lualgorithms.sorting.heapsort")
heapsort.sort(a, function(a1, a2) return a1 - a2 end)

for i=0,(a:size()-1) do
    print(a:get(i))
end
```

## Shuffling

```lua
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
```

## Binary Search on Sorted ArrayList

```lua
local comparator = function(a1, a2) return a1 - a2 end
local s = create_a_list_that_sorts_ascendingly(comparator)

if s.isSortedAscedningly() then
    local binarysearch = require('lualgorithms.binarysearch')
    print(binarysearch.indexOf(s, 10, comparator)) -- return the index of value 10 in the array list s
else
    print('error! list must be sorted before performing binary search')    
end
```

## Union Find

```lua
local unionfind = require('lualgorithms.unionfind').create()
unionfind:union(1, 2)
unionfind:union(4, 6)
unionfind:union(7, 4)

print(unionfind:connected(6, 7)) -- return true
print(unionfind:connected(4, 7)) -- return true
print(unionfind:connected(6, 4)) -- return true
print(unionfind:connected(6, 1)) -- return false
print(unionfind:connected(7, 2)) -- return false
```
