LUA = lua

all: help

help:
	@echo ""
	@echo "This Makefile runs the samples and tests for LuaExceptions:"
	@echo "\thelp - prints this help."
	@echo "\tBasicSample - executes basic sample lua script."
	@echo "\tUncoughtException - executes sample where thrown exception \
is not cought."
	@echo "\tBadArgumentException - executes BadArgumentException handling \
sample"
	@echo "\tExceptionCatchInheritance - demonstrates how different \
exceptions could be catched depending on the classes they had inherited from."
	@echo "\ttest - runs tests."
	@echo ""

BasicSample:
	$(LUA) samples/$@.lua


UncoughtException:
	$(LUA) samples/$@.lua


BadArgumentException:
	$(LUA) samples/$@.lua


ExceptionCatchInheritance:
	$(LUA) samples/$@.lua

test:

.PHONY: all help test BasicSample
