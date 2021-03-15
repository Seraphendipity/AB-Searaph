-- data-final-fixes.lua

-- REPLACE COAL --
-- Replaces all Coal in recipes with charcoal.
-- Based on Wire Shortcuts replacement script: 
-- https://github.com/daydev/FactorioWireShortcuts/blob/master/data-final-fixes.lua

-- Determine if coal should be replaced.
if settings.startup["ab-searaph-replace-coal"].value then

	-- Remove all recipes if not already done so.
	if data.raw["recipe"]["coal"] then
		data.raw["recipe"]["coal"].hidden = true
		data.raw["recipe"]["coal"].enabled = false
	end

	-- Function to Remove Coal
	function replaceCoal(ingredients)
		for i = (#ingredients), 1, -1 do
			if ingredients[i] then
				elseif ingredients[i].name and ingredients[i].name == "coal" then
					if data.raw["item"]["charcoal"] then
						ingredients[i].name = "charcoal"
					else 
						-- TODO: Does table refer to data.raw?
						table.remove(ingredients, i)
					end
				end
			end
		end
	end

	-- Searches all recipes and calls replaceCoal() on them.
	for _, recipe in pairs(data.raw["recipe"]) do
		if recipe.ingredients then
			replaceCoal(recipe.ingredients)
		end
		if recipe.expensive and recipe.expensive.ingredients then
			replaceCoal(recipe.expensive.ingredients)
		end
		if recipe.normal and recipe.normal.ingredients then
			replaceCoal(recipe.normal.ingredients)
		end
	end

end