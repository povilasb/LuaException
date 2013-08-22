---
-- BadArgumentException is supposed to be thrown when a bad argument is
-- passed to a function.
-- It's error level is 3 which indicates that an exception was originated
-- from one stack level above than it was thrown from.
---

local LuaClass = require "LuaClass"
local Exception = require "exceptions.Exception"


-- PRIVATE


local BadArgumentException = LuaClass:create("BadArgumentException", Exception)
BadArgumentException.__tostring = BadArgumentException._super.__tostring


-- PUBLIC


---
-- Constructor.
--
-- @param {string} message error message that is printed when Exception is
--	passed as an argument to __tostring().
-- @return {table} new Exception object.
---
function BadArgumentException:_init(message)
	BadArgumentException._super._init(self, message)
	self.errorLevel = 3
end


return BadArgumentException
