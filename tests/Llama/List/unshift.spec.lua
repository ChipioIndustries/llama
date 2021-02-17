return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local Packages = ReplicatedStorage.Packages
	local Llama = require(Packages.Llama)

	local List = Llama.List
	local unshift = List.unshift

	it("should return a new table", function()
		local list = {1, 2, 3}

		expect(unshift(list)).never.to.equal(list)
	end)

	it("should not mutate the original list", function()
		local list = {false, "foo", 3}
		local mutations = 0

		setmetatable(list, {
			__newindex = function()
				mutations = mutations + 1
			end
		})

		unshift(list, 5)

		expect(mutations).to.equal(0)
	end)

	it("should add values to the beginning of provided list", function()
		local list = {1, 2, 3}
		local result = unshift(list, 4, 5, 6)

		expect(result[1]).to.equal(4)
		expect(result[2]).to.equal(5)
		expect(result[3]).to.equal(6)
		expect(result[4]).to.equal(1)
		expect(result[5]).to.equal(2)
		expect(result[6]).to.equal(3)
	end)
end