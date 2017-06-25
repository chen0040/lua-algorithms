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
```


