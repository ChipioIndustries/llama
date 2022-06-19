local Dictionary = script.Parent
local copyDeep = require(Dictionary.copyDeep)

local Llama = Dictionary.Parent
local t = require(Llama.t)

local validate = t.table

local ERROR_MESSAGE = "Attempt to access nonexistent key: %s"

local metatable = {}

function metatable:__index(index)
	error(ERROR_MESSAGE:format(index))
end

local function throwOnNilIndex(dictionary)
	assert(validate(dictionary))

	local new = copyDeep(dictionary)

	setmetatable(new, metatable)

	return new
end

return throwOnNilIndex