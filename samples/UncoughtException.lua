---
-- This sample demonstrates the basic usage of LuaExceptions library.
-- In this sample two exceptions are thrown: one is cought, the other one is
-- not.
---

-- Append LuaException source path so that require could locate it.
package.path = package.path .. ";src/?.lua"


local LuaException = require "LuaExceptions"
local Exception = require "exceptions.Exception"


local error = LuaException:create()

error:try(function()
	print("Next statement is error.")
	error:throw(Exception:new("sample exception."))
end)
error:catch(Exception, function(e)
	print("Exception cought: " .. tostring(e))
end)
error:finally(function()
	print("Finally statement")
end)

error:try(function()
	print("Next statement is error.")
	error:throw(Exception:new("uncought exception example."))
end)
-- This time finally rethrows uncought error.
error:finally(function()
	print("Finally statement")
end)
