---
-- This is a base exception meant to be inherited by other exceptions.
---


local Exception = {}

-- used by __tostring()
Exception._name = "Exception"
Exception.errorLevel = 2


---
-- Exception constructor that takes a single parameter: exception message
-- and saves it inside object.
--
-- @param {string} msg error message that is printed when Exception is passed
--	as an argument to __tostring().
-- @return {table} new Exception object.
---
function Exception:create(msg)
	local retval = {}
	setmetatable(retval, self)
	self.__index = self

	retval.msg = msg or ""

	return retval
end


---
-- Builds string representing exception.
--
-- @return string exception string.
---
function Exception:__tostring()
	return self._name .. ": " .. tostring(self.msg)
end


return Exception
