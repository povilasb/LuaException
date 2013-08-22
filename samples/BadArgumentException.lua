---
-- This sample demonstrates BadArgumentException use.
---

-- Append LuaException source path so that require could locate it.
package.path = package.path .. ";src/?.lua"


local LuaException = require "LuaExceptions"
local Exception = require "exceptions.Exception"
local BadArgumentException = require "exceptions.BadArgumentException"


local error = LuaException:create()


function testFunc(param)
	if param == nil then
		error:throw(BadArgumentException:new("Parameter cannot be nil"))
	end

	print("Specified parameter:", param)
end

error:try(function()
	testFunc(nil)
end)
error:catch(BadArgumentException, function(e)
	print("Error:", e)
end)
error:finally(function()
end)
