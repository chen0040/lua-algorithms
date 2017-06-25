package = "lualgorithms"
version = "1.0-1"
source = {
   url = "git://github.com/chen0040/lua-algorithms.git",
   tag = "v1.0.1",
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
      ["data.stack"] = "src/data/stack.lua",
      ["data.list"] = "src/data/list.lua",
   }
}
