package = "lualgorithms"
version = "1.0-2"
source = {
   url = "git://github.com/chen0040/lua-algorithms.git",
   tag = "v1.0.2",
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
   }
}
