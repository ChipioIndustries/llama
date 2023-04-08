local List = script.Parent

local Llama = List.Parent
local t = require(Llama.t)

local validate = t.table

local function copy(list)
	assert(validate(list))

	-- selene: allow(manual_table_clone)
	local new = {}

	for i, v in ipairs(list) do
		new[i] = v
	end

	return new
end

return copy