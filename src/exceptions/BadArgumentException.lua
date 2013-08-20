---
-- BadArgumentException is supposed to be thrown when a bad argument is
-- passed to a function.
-- It's error level is 3 which indicates that an exception was originated
-- from one stack level above than it was thrown from.
---


local BadArgumentException = Exception:create()

-- used by __tostring()
BadArgumentException._name = "BadArgumentException"
BadArgumentException.errorLevel = 3


---
-- Exception constructor that takes a single parameter: exception message
-- and saves it inside object.
--
-- @param {string} msg error message that is printed when exception is passed
--	as an argument to __tostring().
-- @return {table} new exception object.
---
function BadArgumentException:create(msg)
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
