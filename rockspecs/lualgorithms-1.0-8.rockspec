package = "lualgorithms"
version = "1.0-8"
source = {
   url = "git://github.com/chen0040/lua-algorithms.git",
   tag = "v1.0.8",
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
      ["lualgorithms.data.stack"] = "src/lualgorithms/data/stack.lua",
      ["lualgorithms.data.list"] = "src/lualgorithms/data/list.lua",
      ["lualgorithms.data.queue"] = "src/lualgorithms/data/queue.lua",
      ["lualgorithms.data.minpq"] = "src/lualgorithms/data/minpq.lua",
      ["lualgorithms.data.maxpq"] = "src/lualgorithms/data/maxpq.lua",
      ["lualgorithms.data.hashmap"] = "src/lualgorithms/data/hashmap.lua",
      ["lualgorithms.data.hashset"] = "src/lualgorithms/data/hashset.lua",
      ["lualgorithms.tries.rwaytries"] = "src/lualgorithms/tries/rwaytries.lua",
      ["lualgorithms.data.redblacktree"] = "src/lualgorithms/data/redblacktree.lua",
      ["lualgorithms.sorting.selection"] = "src/lualgorithms/sorting/selection.lua",
      ["lualgorithms.sorting.insertion"] = "src/lualgorithms/sorting/insertion.lua",
      ["lualgorithms.sorting.shellsort"] = "src/lualgorithms/sorting/shellsort.lua",
      ["lualgorithms.sorting.mergesort"] = "src/lualgorithms/sorting/mergesort.lua",
      ["lualgorithms.sorting.quicksort"] = "src/lualgorithms/sorting/quicksort.lua",
      ["lualgorithms.sorting.quicksort3ways"] = "src/lualgorithms/sorting/quicksort3ways.lua",
      ["lualgorithms.sorting.heapsort"] = "src/lualgorithms/sorting/heapsort.lua",
      ["lualgorithms.shuffling"] = "src/lualgorithms/shuffling.lua",
      ["lualgorithms.binarysearch"] = "src/lualgorithms/binarysearch.lua",
      ["lualgorithms.unionfind"] = "src/lualgorithms/unionfind.lua",
   }
}
