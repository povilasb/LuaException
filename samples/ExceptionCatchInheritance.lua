---
-- This sample demonstrates how exceptions can be catched depending on
-- the classes that exception had inherited.
---

-- Append LuaException source path so that require could locate it.
package.path = package.path .. ";src/?.lua"


local LuaClass = require "LuaClass"
local LuaException = require "LuaExceptions"
local Exception = require "exceptions.Exception"
local BadArgumentException = require "exceptions.BadArgumentException"


local TestException = LuaClass:create("TestException", Exception)
TestException.__tostring = TestException._super.__tostring


local error = LuaException:create()


error:try(function()
	error:throw(TestException:new("some test exception"))
end)
error:catch(BadArgumentException, function(e)
	print("Bad argument error:", e)
end)
error:catch(TestException, function(e)
	print("Test error:", e)
end)
error:finally(function()
end)
