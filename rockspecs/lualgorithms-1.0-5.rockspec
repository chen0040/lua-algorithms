package = "lualgorithms"
version = "1.0-5"
source = {
   url = "git://github.com/chen0040/lua-algorithms.git",
   tag = "v1.0.5",
}
description = {
   summary = "Lua Algorithms Library",
   detailed = [[
      Lua implementation for algorithms and data structures
      found in Java
   ]],
   homepage = "https://github.com/chen0040/lua-algorithms",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1, < 5.4"
}
build = {
   type = "builtin",
   modules = {
      -- Note the required Lua syntax when listing submodules as keys
      ["lualgorithms.data.stack"] = "src/data/stack.lua",
      ["lualgorithms.data.list"] = "src/data/list.lua",
      ["lualgorithms.data.queue"] = "src/data/queue.lua",
      ["lualgorithms.data.minpq"] = "src/data/minpq.lua",
      ["lualgorithms.data.maxpq"] = "src/data/maxpq.lua",
      ["lualgorithms.data.hashmap"] = "src/data/hashmap.lua",
      ["lualgorithms.data.hashset"] = "src/data/hashset.lua",
      ["lualgorithms.tries.rwaytries"] = "src/tries/rwaytries.lua",
      ["lualgorithms.data.redblacktree"] = "src/data/redblacktree.lua",
      ["lualgorithms.sorting.selection"] = "src/sorting/selection.lua",
      ["lualgorithms.sorting.insertion"] = "src/sorting/insertion.lua",
      ["lualgorithms.sorting.shellsort"] = "src/sorting/shellsort.lua",
      ["lualgorithms.sorting.mergesort"] = "src/sorting/mergesort.lua",
      ["lualgorithms.sorting.quicksort"] = "src/sorting/quicksort.lua",
      ["lualgorithms.sorting.quicksort3ways"] = "src/sorting/quicksort3ways.lua",
      ["lualgorithms.sorting.heapsort"] = "src/sorting/heapsort.lua",
      ["lualgorithms.shuffling"] = "src/shuffling.lua",
      ["lualgorithms.binarysearch"] = "src/binarysearch.lua",
      ["lualgorithms.unionfind"] = "src/unionfind.lua",
   }
}
