---
-- This is a base exception meant to be inherited by other exceptions.
---

local LuaClass = require "LuaClass"


-- PRIVATE

local Exception = LuaClass:create("Exception")


-- PUBLIC


---
-- Constructor.
--
-- @param {string} message error message that is printed when Exception is
--	passed as an argument to __tostring().
-- @return {table} new Exception object.
---
function Exception:_init(message)
	self.errorLevel = 2
	self.message = message
end


---
-- Builds string representing exception.
--
-- @return string exception string.
---
function Exception:__tostring()
	return self._name .. ": " .. tostring(self.message)
end


return Exception
