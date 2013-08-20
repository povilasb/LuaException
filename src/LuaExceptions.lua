---
-- LuaException is a higher level library for hanling exceptions in lua.
-- It's approach is to provide a similar interface to exception mechanisms
-- that are native in such languages as Java and C++.
-- LuaException uses try-catch-finally statements.
---

-- PRIVATE


local LuaExceptions = {}


-- PUBLIC


LuaExceptions.version = "0.1.0"


---
-- Creates exception object that simulates throw, try, catch and
-- finally for handling exceptions.
--
-- @return {table} instance of object handling exceptions.
---
function LuaExceptions:create()
	local retval = {}
	setmetatable(retval, self)
	self.__index = self

	retval.errorHappened = false
	retval.originalError = nil

	return retval
end


---
-- Securely calls a function in protected mode. If error is thrown during
-- function execution then the errorHappened flag is set.
--
-- @param {function} f function that is executed in protected mode.
-- @param {any} ... any parameters passed to the function.
---
function LuaExceptions:try(f, ...)
	local status, err = pcall(f, ...)
	if status == true then
		self.errorHappened = false
		self.originalError = nil
	else
		self.errorHappened = true
		self.originalError = err
		self.errorCought = false
	end
end


---
-- Checks if there were any errors in the try block. If there were any,
-- catch checks if thrown exception object is the same as the specified
-- exception class, if it is the specified error handling function is called
-- and errorCought flag is set. The exception object that was cought is passed
-- to exception handling function.
-- If the exception is not cought, finally method will rethrow it.
--
-- @param {table} exception instance of Exception class or its derivatives.
-- @param {function} f function that is executed if thrown exception is the
--	same as specified.
-- @param {any} ... any parameters passed to the function.
---
function LuaExceptions:catch(exception, f, ...)
	if self.errorHappened == false or self.errorCought == true then
		return
	end

	if type(self.originalError) ~= "table" or
		self.originalError.errorLevel == nil then
		-- rethrow the error that is not Exception object
		error("Standard error occured: " .. tostring(exception), 2)
	end

	if self.originalError._name == exception._name then
		self.errorCought = true
		f(self.originalError, ...)
	end
end


---
-- Throws the specified exception. Default error level is 2, but exception
-- object might specify it with errorLevel field.
--
-- @param {table} exception instance of Exception class or its derivatives.
---
function LuaExceptions:throw(exception)
	local errorLevel = exception.errorLevel or 2
	error(exception, errorLevel)
end


---
-- Checks if the thrown exception was not cought, if it is so, then the error
-- is rethrown.
-- NOTE: It is highly advised to call finally() everytime try() is used.
--
-- @param {function} f Optional. Function that is executed to do any final
--	actions.
-- @param {any} ... any parameters passed to the function.
---
function LuaExceptions:finally(f, ...)
	if self.errorHappened == true and self.errorCought == false then
		error("Error was not cought: " ..
			tostring(self.originalError), 2)
	end

	if f ~= nil then
		f(...)
	end
end


return LuaExceptions
