local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Llama = require(ReplicatedStorage.Packages.Llama)

local dictionary = Llama.Dictionary
local throwOnNilIndex = dictionary.throwOnNilIndex
local equalsDeep = dictionary.equalsDeep

local listEqualsDeep = Llama.List.equalsDeep

return function()
	describe("throwOnNilIndex", function()
		it("should return an identical table", function()
			local inDictionary = {
				key1 = "hello";
				key2 = 1234;
				yeehaw = {
					test = "hi"
				}
			}
			local inList = {
				123,
				"test",
				987
			}
			local outDictionary = throwOnNilIndex(inDictionary)
			local outList = throwOnNilIndex(inList)
			expect(equalsDeep(outDictionary)).to.equal(true)
			expect(listEqualsDeep(outList)).to.equal(true)
		end)
		it("should throw on invalid dictionary", function()
			local inValue = true
			expect(function()
				throwOnNilIndex(inValue)
			end).to.throw()
		end)
		describe("error behavior", function()
			local inTable = {
				key1 = "hello world";
				key3 = 1234;
				key4 = {
					test = "hi";
				};
			}
			local outTable = throwOnNilIndex(inTable)
			it("should be able to access values", function()
				expect(outTable.key1).to.equal(inTable.key1)
				expect(outTable.key3).to.equal(inTable.key3)
				expect(outTable.key4.test).to.equal(inTable.key4.test)
			end)
			it("should throw if value is nil", function()
				expect(function()
					local _value = outTable.key2
				end).to.throw()
			end)
			it("should throw if nested value is nil", function()
				expect(function()
					local _value = outTable.key4.none
				end).to.throw()
			end)
		end)
	end)
end