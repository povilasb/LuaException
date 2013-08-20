---
-- This sample demonstrates the basic usage of LuaExceptions library.
---

-- Append LuaException source path so that require could locate it.
package.path = package.path .. ";src/?.lua"


local LuaException = require "LuaExceptions"
local Exception = require "exceptions.Exception"


local error = LuaException:create()

error:try(function()
	print("Nex statement is error.")
	error:throw(Exception:create("sample exception."))
end)
error:catch(Exception, function(e)
	print("Exception cought: " .. tostring(e))
end)
error:finally(function()
	print("Finally statement")
end)
