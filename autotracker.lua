-- Configuration --------------------------------------
AUTOTRACKER_ENABLE_DEBUG_LOGGING = true
-------------------------------------------------------

print("")
print("Active Auto-Tracker Configuration")
print("---------------------------------------------------------------------")
print("Enable Item Tracking:        ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
print("Enable Location Tracking:    ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
    print("Enable Debug Logging:        ", "true")
end
print("---------------------------------------------------------------------")
print("")

U8_READ_CACHE = 0
U8_READ_CACHE_ADDRESS = 0

function autotracker_started()
    print("Started Tracking")
end

function InvalidateReadCaches()
    U8_READ_CACHE_ADDRESS = 0
end

function ReadU8(segment, address)
    if U8_READ_CACHE_ADDRESS ~= address then
        U8_READ_CACHE = segment:ReadUInt8(address)
        U8_READ_CACHE_ADDRESS = address
    end
    return U8_READ_CACHE
end

function isInGame()
  return true -- Need to eventually fix this.
end

function updateProgressiveItemFromBytes(segment, code, address, quantity)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = 0
        for i = 0, quantity-1, 1 do
            if ReadU8(segment, address+i) > 0 then
                value = value + 1
            end
        end
        if item.CurrentStage ~= value then
            print(item.Name .. ": " .. value)
            item.CurrentStage = value
        end
    end
end

function updateProgressiveItemFromByte(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if item.ItemState.stage ~= value then
            print(item.Name .. ": " .. value)
            item.CurrentStage = value
        end
    end
end


function updateWindSword(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 0 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateWindBall(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 5 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateWindBraclet(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 6 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateFireBall(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 7 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateFireBraclet(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 8 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateWaterBall(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 9 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateWaterBraclet(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 10 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateThunderBall(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 11 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateThunderBraclet(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value == 12 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateRefresh(segment, code)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)

	if item  then    
         
        	if SPELL1 == 0x41 
		or SPELL2 == 0x41 
		or SPELL3 == 0x41 
		or SPELL4 == 0x41 
		or SPELL5 == 0x41 
		or SPELL6 == 0x41 
		or SPELL7 == 0x41
		or SPELL8 == 0x41 then
            		if item.Active == false then
                	print(item.Name .. " obtained")
                	item .Active = true
            	end
        		else
            		item.Active = false
        		end        	
    	end
end

function updateParalysis(segment, code)
    	local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x42 
		or SPELL2 == 0x42 
		or SPELL3 == 0x42 
		or SPELL4 == 0x42 
		or SPELL5 == 0x42 
		or SPELL6 == 0x42 
		or SPELL7 == 0x42
		or SPELL8 == 0x42 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateTelepathy(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x43 
		or SPELL2 == 0x43 
		or SPELL3 == 0x43 
		or SPELL4 == 0x43 
		or SPELL5 == 0x43 
		or SPELL6 == 0x43 
		or SPELL7 == 0x43
		or SPELL8 == 0x43 then
            		if item.Active == false then
                		print(item .Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateTeleport(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x44
		or SPELL2 == 0x44 
		or SPELL3 == 0x44 
		or SPELL4 == 0x44 
		or SPELL5 == 0x44 
		or SPELL6 == 0x44 
		or SPELL7 == 0x44
		or SPELL8 == 0x44 then
            		if item.Active == false then
                		print(item .Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateRecover(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x45 
		or SPELL2 == 0x45 
		or SPELL3 == 0x45 
		or SPELL4 == 0x45 
		or SPELL5 == 0x45 
		or SPELL6 == 0x45 
		or SPELL7 == 0x45
		or SPELL8 == 0x45 then
            		if item.Active == false then
                		print(item .Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateBarrier(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x46 
		or SPELL2 == 0x46 
		or SPELL3 == 0x46 
		or SPELL4 == 0x46 
		or SPELL5 == 0x46 
		or SPELL6 == 0x46 
		or SPELL7 == 0x46
		or SPELL8 == 0x46 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateChange(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x47 
		or SPELL2 == 0x47 
		or SPELL3 == 0x47 
		or SPELL4 == 0x47 
		or SPELL5 == 0x47 
		or SPELL6 == 0x47 
		or SPELL7 == 0x47
		or SPELL8 == 0x47 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateFlight(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local SPELL1 = ReadU8(segment, 0x6458) 
    	local SPELL2 = ReadU8(segment, 0x6459)
	local SPELL3 = ReadU8(segment, 0x645A) 
    	local SPELL4 = ReadU8(segment, 0x645B)
	local SPELL5 = ReadU8(segment, 0x645C) 
    	local SPELL6 = ReadU8(segment, 0x645D)
	local SPELL7 = ReadU8(segment, 0x645E) 
    	local SPELL8 = ReadU8(segment, 0x645F)
	
	if item  then    
               	if SPELL1 == 0x48 
		or SPELL2 == 0x48 
		or SPELL3 == 0x48 
		or SPELL4 == 0x48 
		or SPELL5 == 0x48 
		or SPELL6 == 0x48 
		or SPELL7 == 0x48
		or SPELL8 == 0x48 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateGasMask(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x29 
		    or WEAR2 == 0x29
		    or WEAR3 == 0x29 
		    or WEAR4 == 0x29 
		    or WEAR5 == 0x29 
		    or WEAR6 == 0x29 
		    or WEAR7 == 0x29
		    or WEAR8 == 0x29 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updatePowerRing(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2A 
		    or WEAR2 == 0x2A 
		    or WEAR3 == 0x2A 
		    or WEAR4 == 0x2A 
		    or WEAR5 == 0x2A 
		    or WEAR6 == 0x2A 
		    or WEAR7 == 0x2A
		    or WEAR8 == 0x2A then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateWarriorRing(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2B 
		    or WEAR2 == 0x2B 
		    or WEAR3 == 0x2B 
		    or WEAR4 == 0x2B 
		    or WEAR5 == 0x2B 
		    or WEAR6 == 0x2B 
		    or WEAR7 == 0x2B
		    or WEAR8 == 0x2B then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateIronNecklace(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2C 
		    or WEAR2 == 0x2C 
		    or WEAR3 == 0x2C 
		    or WEAR4 == 0x2C 
		    or WEAR5 == 0x2C 
		    or WEAR6 == 0x2C 
		    or WEAR7 == 0x2C
		    or WEAR8 == 0x2C then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateDeosPendant(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2D 
		    or WEAR2 == 0x2D 
		    or WEAR3 == 0x2D 
		    or WEAR4 == 0x2D 
		    or WEAR5 == 0x2D 
		    or WEAR6 == 0x2D 
		    or WEAR7 == 0x2D
		    or WEAR8 == 0x2D then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateRabbitBoots(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2E 
		    or WEAR2 == 0x2E
		    or WEAR3 == 0x2E 
		    or WEAR4 == 0x2E 
		    or WEAR5 == 0x2E 
		    or WEAR6 == 0x2E 
		    or WEAR7 == 0x2E
		    or WEAR8 == 0x2E then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateSpeedBoots(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x2F 
		    or WEAR2 == 0x2F
		    or WEAR3 == 0x2F 
		    or WEAR4 == 0x2F 
		    or WEAR5 == 0x2F 
		    or WEAR6 == 0x2F 
		    or WEAR7 == 0x2F
		    or WEAR8 == 0x2F then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateShieldRing(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local WEAR1 = ReadU8(segment, 0x6448) 
    	local WEAR2 = ReadU8(segment, 0x6449)
        local WEAR3 = ReadU8(segment, 0x644A) 
    	local WEAR4 = ReadU8(segment, 0x644B)
	    local WEAR5 = ReadU8(segment, 0x644C) 
    	local WEAR6 = ReadU8(segment, 0x644D)
	    local WEAR7 = ReadU8(segment, 0x644E) 
    	local WEAR8 = ReadU8(segment, 0x644F)
	
	if item  then    
               	if WEAR1 == 0x30 
		    or WEAR2 == 0x30
		    or WEAR3 == 0x30 
		    or WEAR4 == 0x30 
		    or WEAR5 == 0x30 
		    or WEAR6 == 0x30 
		    or WEAR7 == 0x30
		    or WEAR8 == 0x30 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item .Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateMoonBow(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x3E 
		    or KEYITEM2 == 0x3E
		    or KEYITEM3 == 0x3E 
		    or KEYITEM4 == 0x3E 
		    or KEYITEM5 == 0x3E 
		    or KEYITEM6 == 0x3E 
		    or KEYITEM7 == 0x3E
		    or KEYITEM8 == 0x3E then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateSunBow(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x3F 
		    or KEYITEM2 == 0x3F
		    or KEYITEM3 == 0x3F 
		    or KEYITEM4 == 0x3F 
		    or KEYITEM5 == 0x3F 
		    or KEYITEM6 == 0x3F 
		    or KEYITEM7 == 0x3F
		    or KEYITEM8 == 0x3F then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateTruthBow(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x40 
		    or KEYITEM2 == 0x40
		    or KEYITEM3 == 0x40 
		    or KEYITEM4 == 0x40 
		    or KEYITEM5 == 0x40 
		    or KEYITEM6 == 0x40 
		    or KEYITEM7 == 0x40
		    or KEYITEM8 == 0x40 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateWindKey(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x32 
		    or KEYITEM2 == 0x32
		    or KEYITEM3 == 0x32 
		    or KEYITEM4 == 0x32 
		    or KEYITEM5 == 0x32 
		    or KEYITEM6 == 0x32 
		    or KEYITEM7 == 0x32
		    or KEYITEM8 == 0x32 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updatePrisonKey(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x33 
		    or KEYITEM2 == 0x33
		    or KEYITEM3 == 0x33 
		    or KEYITEM4 == 0x33 
		    or KEYITEM5 == 0x33 
		    or KEYITEM6 == 0x33 
		    or KEYITEM7 == 0x33
		    or KEYITEM8 == 0x33 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateStyxKey(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x34 
		    or KEYITEM2 == 0x34
		    or KEYITEM3 == 0x34 
		    or KEYITEM4 == 0x34 
		    or KEYITEM5 == 0x34 
		    or KEYITEM6 == 0x34 
		    or KEYITEM7 == 0x34
		    or KEYITEM8 == 0x34 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateGlowLamp(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x39 
		    or KEYITEM2 == 0x39
		    or KEYITEM3 == 0x39 
		    or KEYITEM4 == 0x39 
		    or KEYITEM5 == 0x39 
		    or KEYITEM6 == 0x39 
		    or KEYITEM7 == 0x39
		    or KEYITEM8 == 0x39 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateFogLamp(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x35
		    or KEYITEM2 == 0x35
		    or KEYITEM3 == 0x35 
		    or KEYITEM4 == 0x35 
		    or KEYITEM5 == 0x35 
		    or KEYITEM6 == 0x35 
		    or KEYITEM7 == 0x35
		    or KEYITEM8 == 0x35 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateAlarmFlute(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x31
		    or KEYITEM2 == 0x31
		    or KEYITEM3 == 0x31 
		    or KEYITEM4 == 0x31 
		    or KEYITEM5 == 0x31 
		    or KEYITEM6 == 0x31 
		    or KEYITEM7 == 0x31
		    or KEYITEM8 == 0x31 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateShellFlute(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x36
		    or KEYITEM2 == 0x36
		    or KEYITEM3 == 0x36 
		    or KEYITEM4 == 0x36 
		    or KEYITEM5 == 0x36 
		    or KEYITEM6 == 0x36 
		    or KEYITEM7 == 0x36
		    or KEYITEM8 == 0x36 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateBugFlute(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X27
		    or KEYITEM2 == 0X27
		    or KEYITEM3 == 0X27 
		    or KEYITEM4 == 0X27 
		    or KEYITEM5 == 0X27 
		    or KEYITEM6 == 0X27 
		    or KEYITEM7 == 0X27
		    or KEYITEM8 == 0X27 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateLimeFlute(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X28
		    or KEYITEM2 == 0X28
		    or KEYITEM3 == 0X28 
		    or KEYITEM4 == 0X28 
		    or KEYITEM5 == 0X28 
		    or KEYITEM6 == 0X28 
		    or KEYITEM7 == 0X28
		    or KEYITEM8 == 0X28 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateOnyxStatue(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0x25
		    or KEYITEM2 == 0X25
		    or KEYITEM3 == 0X25 
		    or KEYITEM4 == 0X25 
		    or KEYITEM5 == 0X25 
		    or KEYITEM6 == 0X25 
		    or KEYITEM7 == 0X25
		    or KEYITEM8 == 0X25 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateGoldStatue(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X3A
		    or KEYITEM2 == 0X3A
		    or KEYITEM3 == 0X3A 
		    or KEYITEM4 == 0X3A 
		    or KEYITEM5 == 0X3A 
		    or KEYITEM6 == 0X3A 
		    or KEYITEM7 == 0X3A
		    or KEYITEM8 == 0X3A then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateIvoryStatue(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X3D
		    or KEYITEM2 == 0X3D
		    or KEYITEM3 == 0X3D 
		    or KEYITEM4 == 0X3D 
		    or KEYITEM5 == 0X3D 
		    or KEYITEM6 == 0X3D 
		    or KEYITEM7 == 0X3D
		    or KEYITEM8 == 0X3D then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateBrokenStatue(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X38
		    or KEYITEM2 == 0X38
		    or KEYITEM3 == 0X38 
		    or KEYITEM4 == 0X3D 
		    or KEYITEM5 == 0X38 
		    or KEYITEM6 == 0X38 
		    or KEYITEM7 == 0X38
		    or KEYITEM8 == 0X38 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateOpelStatue(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6440) 
    	local KEYITEM2 = ReadU8(segment, 0x6441)
        local KEYITEM3 = ReadU8(segment, 0x6442) 
    	local KEYITEM4 = ReadU8(segment, 0x6443)
	    local KEYITEM5 = ReadU8(segment, 0x6444) 
    	local KEYITEM6 = ReadU8(segment, 0x6445)
	    local KEYITEM7 = ReadU8(segment, 0x6446) 
    	local KEYITEM8 = ReadU8(segment, 0x6447)
	
	if item  then    
               	if KEYITEM1 == 0X26
		    or KEYITEM2 == 0X26
		    or KEYITEM3 == 0X26 
		    or KEYITEM4 == 0X26 
		    or KEYITEM5 == 0X26 
		    or KEYITEM6 == 0X26 
		    or KEYITEM7 == 0X26
		    or KEYITEM8 == 0X26 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateFruitofRepun(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6440) 
    	local KEYITEM2 = ReadU8(segment, 0x6441)
        local KEYITEM3 = ReadU8(segment, 0x6442) 
    	local KEYITEM4 = ReadU8(segment, 0x6443)
	    local KEYITEM5 = ReadU8(segment, 0x6444) 
    	local KEYITEM6 = ReadU8(segment, 0x6445)
	    local KEYITEM7 = ReadU8(segment, 0x6446) 
    	local KEYITEM8 = ReadU8(segment, 0x6447)
	
	if item  then    
               	if KEYITEM1 == 0X23
		    or KEYITEM2 == 0X23
		    or KEYITEM3 == 0X23 
		    or KEYITEM4 == 0X23 
		    or KEYITEM5 == 0X23 
		    or KEYITEM6 == 0X23 
		    or KEYITEM7 == 0X23
		    or KEYITEM8 == 0X23 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateKarissaPlant(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X3C
		    or KEYITEM2 == 0X3C
		    or KEYITEM3 == 0X3C 
		    or KEYITEM4 == 0X3C 
		    or KEYITEM5 == 0X3C 
		    or KEYITEM6 == 0X3C 
		    or KEYITEM7 == 0X3C
		    or KEYITEM8 == 0X3C then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateXrayGlasses(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X37
		    or KEYITEM2 == 0X37
		    or KEYITEM3 == 0X37 
		    or KEYITEM4 == 0X37 
		    or KEYITEM5 == 0X37 
		    or KEYITEM6 == 0X37 
		    or KEYITEM7 == 0X37
		    or KEYITEM8 == 0X37 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateLovePendant(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6450) 
    	local KEYITEM2 = ReadU8(segment, 0x6451)
        local KEYITEM3 = ReadU8(segment, 0x6452) 
    	local KEYITEM4 = ReadU8(segment, 0x6453)
	    local KEYITEM5 = ReadU8(segment, 0x6454) 
    	local KEYITEM6 = ReadU8(segment, 0x6455)
	    local KEYITEM7 = ReadU8(segment, 0x6456) 
    	local KEYITEM8 = ReadU8(segment, 0x6457)
	
	if item  then    
               	if KEYITEM1 == 0X3B
		    or KEYITEM2 == 0X3B
		    or KEYITEM3 == 0X3B 
		    or KEYITEM4 == 0X3B 
		    or KEYITEM5 == 0X3B 
		    or KEYITEM6 == 0X3B 
		    or KEYITEM7 == 0X3B
		    or KEYITEM8 == 0X3B then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updatePsychoArmor(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6434) 
    	local KEYITEM2 = ReadU8(segment, 0x6435)
        local KEYITEM3 = ReadU8(segment, 0x6436) 
    	local KEYITEM4 = ReadU8(segment, 0x6437)
	
	if item  then    
               	if KEYITEM1 == 0X1C
		    or KEYITEM2 == 0X1C
		    or KEYITEM3 == 0X1C 
		    or KEYITEM4 == 0X1C then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateSacredShield(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    	local KEYITEM1 = ReadU8(segment, 0x6438) 
    	local KEYITEM2 = ReadU8(segment, 0x6439)
        local KEYITEM3 = ReadU8(segment, 0x643A) 
    	local KEYITEM4 = ReadU8(segment, 0x643B)
	
	if item  then    
               	if KEYITEM1 == 0X12
		    or KEYITEM2 == 0X12
		    or KEYITEM3 == 0X12 
		    or KEYITEM4 == 0X12 then
            		if item.Active == false then
                		print(item.Name .. " obtained")
                		item.Active = true
            		end
        			else
            			item.Active = false
        			end        	
    	end
end

function updateToggleItemFromByte(segment, code, address)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value > 0 and value < 254 then
            if item.Active == false then
                print(item.Name .. " obtained")
                item.Active = true
            end
        else
            item.Active = false
        end
    end
end

function updateToggleItemFromByteAndFlag(segment, code, address, flag)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
            print(item.Name, code, flag, value)
        end

        local flagTest = value & flag

        if flagTest ~= FF then
            item.Active = true
        elseif AUTOTRACKER_ENABLE_SETTING_LOCATIONS_TO_FALSE then
            item.Active = false
        end
    end
end

function updateProgressiveItemFromByteAndFlags(segment, code, address, flag1, flag2)
    local item = Tracker:FindObjectForCode(code)
    if item then
        local value = ReadU8(segment, address)
        if value & flag1 ~= 0 and value & flag2 ~= 0 then
            if item.CurrentStage ~= 3 then
                print(item.Name .. " obtained")
                item.CurrentStage = 3
            end
        elseif value & flag2 ~= 0 then
            if item.CurrentStage ~= 2 then
                print(item.Name .. " obtained")
                item.CurrentStage = 2
            end
        elseif value & flag1 ~= 0 then
            if item.CurrentStage ~= 1 then
                print(item.Name .. " obtained")
                item.CurrentStage = 1
            end
        else
            item.CurrentStage = 0
        end
    end
end


function updateKeyItemsFromMemorySegment(segment)
    if not isInGame(segment) then
        return false
    end

    InvalidateReadCaches()

    if AUTOTRACKER_ENABLE_ITEM_TRACKING then

    
    updateWindSword(segment, "swordofwind", 0x6430)
    updateToggleItemFromByte(segment, "swordoffire", 0x6431, 0x01)
    updateToggleItemFromByte(segment, "swordofwater", 0x6432, 0x02)
    updateToggleItemFromByte(segment, "swordofthunder", 0x6433, 0x03)

    updateWindBall(segment, "ballofwind", 0x643C)
    updateFireBall(segment, "balloffire", 0x643D)
    updateWaterBall(segment, "ballofwater", 0x643E)
    updateThunderBall(segment, "ballofthunder", 0x643F)

    updateWindBraclet(segment, "windbracelet", 0x643C)
    updateFireBraclet(segment, "firebracelet", 0x643D)
    updateWaterBraclet(segment, "waterbracelet", 0x643E)
    updateThunderBraclet(segment, "thunderbracelet", 0x643F)

   
    updateRefresh(segment, "refresh")
    updateParalysis(segment, "paralysis")
	updateTelepathy(segment, "telepathy")
    updateTeleport(segment, "teleport")
	updateRecover(segment, "recover")
    updateBarrier(segment, "barrier")
	updateChange(segment, "change")
    updateFlight(segment, "flight")

    updateGasMask(segment, "gasmask")
    updatePowerRing(segment, "powerring")
    updateWarriorRing(segment, "warriorring")
    updateIronNecklace(segment, "ironpendant")
    updateDeosPendant(segment, "deospendant")
    updateRabbitBoots(segment, "rabbitboots")
    updateSpeedBoots(segment, "speedboots")
    updateShieldRing(segment, "shieldring")

    updateMoonBow(segment, "bowofmoon")
    updateSunBow(segment, "bowofsun")
    updateTruthBow(segment, "bowoftruth")

    updateWindKey(segment, "windmillkey")
    updatePrisonKey(segment, "keytoprison")
    updateStyxKey(segment, "keytostxy")

    updateFogLamp(segment, "foglamp")
    updateGlowLamp(segment, "glowinglamp")

    updateAlarmFlute(segment, "alarmflute")
    updateBugFlute(segment, "insectflute")
    updateLimeFlute(segment, "fluteoflime")
    updateShellFlute(segment, "shellflute")
    
    updateIvoryStatue(segment, "ivorystatue")
    updateBrokenStatue(segment, "brokenstatue")
    updateGoldStatue(segment, "goldstautue")
    updateOnyxStatue(segment, "statueofonyx")

    updateOpelStatue(segment, "opelstatue")
    updateFruitofRepun(segment, "fruitofrepun")

    updateKarissaPlant(segment, "kirisa")
    updateLovePendant(segment, "lovependant")
    updateXrayGlasses(segment, "eyeglasses")

    updatePsychoArmor(segment, "psychoarmor")
    updateSacredShield(segment, "sacredshield")


    

    end
    
end


-- I know this is bad practice but the amount of resets makes it so all the sanity
-- checking needs to be done on the segment
ScriptHost:AddMemoryWatch("Item Data", 0x6000, 0x500, updateKeyItemsFromMemorySegment)

