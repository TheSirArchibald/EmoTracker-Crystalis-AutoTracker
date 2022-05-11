--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")
print("Starting up scipts")

if _VERSION == "Lua 5.3" then
  print("Your tracker version supports autotracking!")
  ScriptHost:LoadScript("scripts/autotracker.lua")
else
  print("Your tracker version does not support autotracking")
end

Tracker:AddItems("items/common.json")

if (Tracker.ActiveVariantUID == "items_only") then
	Tracker:AddLayouts("layouts/tracker.json")
		Tracker:AddLayouts("layouts/broadcast_tems_only.json")

	else if (Tracker.ActiveVariantUID == "items_and_locations") then
		Tracker:AddLayouts("layouts/location_tracker.json")
		Tracker:AddLayouts("layouts/broadcast_tems_only.json")

	else
		ScriptHost:LoadScript("scripts/logic_common.lua")
		if (Tracker.ActiveVariantUID == "items_and_map_intermediate") then
			Tracker:AddMaps("maps/maps.json")
			Tracker:AddLayouts("layouts/map_tracker.json")
			Tracker:AddLocations("locations/worn_locations.json")
			Tracker:AddLocations("locations/bonus_locations.json")
			Tracker:AddLocations("locations/weapon_locations.json")
			Tracker:AddLocations("locations/key_locations.json")
			Tracker:AddLocations("locations/magic_locations.json")
		else
			ScriptHost:LoadScript("scripts/flags.lua")
			Tracker:AddMaps("maps/sub_maps.json")
			Tracker:AddItems("items/flags.json")
			Tracker:AddLayouts("layouts/custom_flags.json")
			Tracker:AddLocations("locations/full/overworld_locations.json")
			Tracker:AddLocations("locations/full/sealed_cave_locations.json")
			Tracker:AddLocations("locations/full/sabre_west_locations.json")
			Tracker:AddLocations("locations/full/sabre_north_locations.json")
			Tracker:AddLocations("locations/full/fog_lamp_cave_locations.json")
			Tracker:AddLocations("locations/full/island_cave_locations.json")
			Tracker:AddLocations("locations/full/island_fortress_locations.json")
			Tracker:AddLocations("locations/full/hydra_locations.json")
			Tracker:AddLocations("locations/full/oasis_cave_locations.json")
			Tracker:AddLocations("locations/full/goa_locations.json")
		end
		Tracker:AddLayouts("layouts/broadcast.json")
	end

end
