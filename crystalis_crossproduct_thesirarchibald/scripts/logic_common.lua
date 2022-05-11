-- Sword functions
function hasSword()
	return
		Tracker:ProviderCountForCode("wind") > 0 or
		Tracker:ProviderCountForCode("fire") > 0 or
		Tracker:ProviderCountForCode("water") > 0 or
		Tracker:ProviderCountForCode("thunder") > 0
end

function canBreakStoneWalls()
	if Tracker:ProviderCountForCode("wind") == 0 then
		return false
	else
		return Tracker:ProviderCountForCode("windball") > 0 or Tracker:ProviderCountForCode("tornado") > 0
	end
end

function canBreakIceWalls()
	if Tracker:ProviderCountForCode("fire") == 0 then
		return false
	else
		return Tracker:ProviderCountForCode("fireball") > 0 or Tracker:ProviderCountForCode("flame") > 0
	end
end

function canCrossRivers()
	if Tracker:ProviderCountForCode("flight") > 0 then
		return true
	end
	if Tracker:ProviderCountForCode("water") == 0 then
		return false
	else
		return Tracker:ProviderCountForCode("waterball") > 0 or Tracker:ProviderCountForCode("blizzard") > 0
	end
end

function canBreakIronWalls()
	if Tracker:ProviderCountForCode("thunder") == 0 then
		return false
	else
		return Tracker:ProviderCountForCode("thunderball") > 0 or Tracker:ProviderCountForCode("storm") > 0
	end
end



-- Boss Functions
-- "Kill" functions will be updated with flag support
function canKillInsect()
	return
		Tracker:ProviderCountForCode("fire") > 0 or
		Tracker:ProviderCountForCode("water") > 0 or
		Tracker:ProviderCountForCode("thunder") > 0
end

function canKillKelbesque()
	return Tracker:ProviderCountForCode("wind") > 0
end

function canKillSabera()
	return Tracker:ProviderCountForCode("fire") > 0
end

function canKillMado()
	return Tracker:ProviderCountForCode("water") > 0
end

function canKillKarmine()
	return Tracker:ProviderCountForCode("thunder") > 0
end

-- All "Access" functions here refer to Goa Fortress
function canAccessKelbesque()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls() and canKillMado() and canKillSabera()
end

function canAccessSabera()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls() and canKillMado()
end

function canAccessMado()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() and canKillSabera() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls()
end

function canAccessKarmine()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() and canKillSabera() and canKillMado() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBypassBarriers()
end



-- Glitch and Miscellaneous Functions
function canBypassGuards()
	-- Always true via Statue Glitch until I add flag options
	return true
end

function canBypassStatues()
	-- Always true via Statue Glitch until I add flag options
	return true
end

function canClimbSlope()
	return
		Tracker:ProviderCountForCode("rabbit") > 0 or
		Tracker:ProviderCountForCode("speed") > 0 or
		Tracker:ProviderCountForCode("flight") > 0
end

function canBypassBarriers()
	-- Weird logic rules. Write later
	return true
	--	 Tracker:ProviderCountForCode("barrier") > 0 or
	--	 ( Tracker:ProviderCountForCode("refresh") > 0 and Tracker:ProviderCountForCode("shield") > 0 )
end

function canCrossSea()
	if Tracker:ProviderCountForCode("flight") > 0 then
		return true
	else return
		Tracker:ProviderCountForCode("fog") > 0 and
		Tracker:ProviderCountForCode("shell") > 0  and
		Tracker:ProviderCountForCode("broken") > 0  and
		Tracker:ProviderCountForCode("glowing") > 0 
	end
end

function canTriggerMesia()
	return canAccessPortoa() and Tracker:ProviderCountForCode("water") > 0 and canCrossRivers()
end



-- Region Functions
-- To avoid circular reasoning, Regions do not call each other or Sub Areas
function canAccessPortoa()
	-- Always true until I include flag options
	return true
end

function canAccessBrynmaer()
	if canBreakIceWalls() then
		return true
	else
		return Tracker:ProviderCountForCode("windmill") > 0 and canBreakStoneWalls()
	end
end

function canAccessJoel() -- Needs fix after flags are added
	if Tracker:ProviderCountForCode("flight") > 0 then
		return true
	else return
		Tracker:ProviderCountForCode("fog") > 0 and
		Tracker:ProviderCountForCode("shell") > 0
	end
end

function canAccessGoa()
	if  Tracker:ProviderCountForCode("thunder") > 0 and canCrossRivers() then
        return true
	end
	return canCrossSea() and Tracker:ProviderCountForCode("change") > 0
end

function canAccessShyron()
	if  Tracker:ProviderCountForCode("thunder") > 0 then
        return true
	else
		return canCrossSea() and Tracker:ProviderCountForCode("change") > 0 and canCrossRivers()
	end
end

function canAccessSahara()	-- Breaks the rule because Sahara is a dead end
							-- May require retooling with WW logic
	return canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0
end



-- Sub Area Functions (can call Regions)
function canAccessAmazones()
	return canAccessBrynmaer() and canCrossRivers()
end

function canAccessOak()
	-- Add heck runs later
	return canAccessBrynmaer() and Tracker:ProviderCountForCode("gas") > 0
end

function canAccessSabreNorth()
	return
		canAccessBrynmaer() and Tracker:ProviderCountForCode("teleport") > 0 or
		canAccessPortoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIceWalls() and canKillKelbesque()
end

function canAccessZombieTown()
	return canAccessJoel() and canCrossRivers() and canBreakStoneWalls()
end

function canAccessBarrier()
	return canAccessJoel() and Tracker:ProviderCountForCode("broken") > 0  and Tracker:ProviderCountForCode("glowing") > 0
	-- Needs update with flag options
end

function canAccessSwan()
	return
		canAccessPortoa() and Tracker:ProviderCountForCode("flight") > 0 or
		canAccessJoel() and Tracker:ProviderCountForCode("broken") > 0  and Tracker:ProviderCountForCode("glowing") > 0 or
		canAccessGoa() and Tracker:ProviderCountForCode("change") > 0
end

function canAccessStxy()
	return canAccessGoa() and canCrossRivers() and Tracker:ProviderCountForCode("stxy") > 0
end