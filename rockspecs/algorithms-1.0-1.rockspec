package = "LuaAlgorithms"
version = "1.0-1"
source = {
   url = "https://github.com/chen0040/lua-algorithms",
   tag = "v1.0",
}
description = {
   summary = "Lua Algorithm Library",
   detailed = [[
      This library contains lua implementation for
      algorithms and data structures
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
   }
}
