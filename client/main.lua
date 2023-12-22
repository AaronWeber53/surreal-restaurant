local QBCore = exports['qb-core']:GetCoreObject()
CurrentConfigJob = nil
local currentjob = nil
PlayerJob = {}
local onDuty = false
isLoggedIn = true
local restaurantBlips = {}
local openRestaurants = {}
--#region Player logic

local AdjustRestaurantBlips = function(restaurants) 
    for k, v in pairs(restaurants) do
        local info = Config.JobList[k]
        local blip = nil
        if restaurantBlips[k] ~= nil then
            blip = restaurantBlips[k]
        else
            blip = AddBlipForCoord(info.blip.coords.x, info.blip.coords.y, info.blip.coords.z)
            SetBlipSprite (blip, info.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, (info.blip.scale or 0.5))
            SetBlipAsShortRange(blip, true)
        end
        
        if v == true then
            SetBlipColour(blip, info.blip.colour)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(info.name.." - OPEN")
            EndTextCommandSetBlipName(blip)

        else
            print('attempt close restaurant')
            SetBlipColour(blip, Config.ClosedBlipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(info.name.." - CLOSED")
            EndTextCommandSetBlipName(blip)
        end
        restaurantBlips[k] = blip
        openRestaurants[k] = v
    end

end

RegisterNetEvent("surreal-restaurant:setRestaurantStatuses", function(restaurants)
    AdjustRestaurantBlips(restaurants)
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        SetCurrentJobConfig()
    end)

    QBCore.Functions.TriggerCallback('surreal-restaurant:server:get:openStatus', function(restaurants)  
        AdjustRestaurantBlips(restaurants)
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
    SetCurrentJobConfig()
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("surreal-restaurant:ToggleDuty")
AddEventHandler("surreal-restaurant:ToggleDuty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

function SetCurrentJobConfig() 
    for v, k in pairs(Config.JobList) do
        if v == PlayerJob.name then
            CurrentConfigJob = Config.JobList[v]
            currentjob = v
            break
        end
    end
    if CurrentConfigJob ~= nil and currentjob ~= PlayerJob.name then
        CurrentConfigJob = nil
        currentjob = nil
    end
end
--#endregion Player logic

--#region main loop logic
Citizen.CreateThread(function()
    while true do
        local sleep = 100
        if isLoggedIn and CurrentConfigJob ~= nil and PlayerJob ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            -- Start of On Duty Checks
            if onDuty then
                -- Kitchen Task
                if (CurrentConfigJob["kitchentask"]) then
                    for k, v in pairs(CurrentConfigJob["kitchentask"]) do
                        for index, coords in pairs(CurrentConfigJob["kitchentask"][k]['coords']) do
                            if #(pos - vector3(coords.x, coords.y, coords.z)) < 5 then
                                if #(pos - vector3(coords.x, coords.y, coords.z)) < v.closedistance then
                                    DrawText3D(coords.x, coords.y, coords.z, v.closetext)
                                    if IsControlJustReleased(0, 38) then
                                        TriggerEvent("surreal-restaurant:kitchentask", k)
                                    end
                                    sleep = 2
                                elseif #(pos - vector3(coords.x, coords.y, coords.z)) < v.farDistance then
                                    sleep = 5
                                    DrawText3D(coords.x, coords.y, coords.z, v.fartext)
                                end
                            end
                        end
                    end  
                end

                -- Cash Registers
                if (CurrentConfigJob["cashregister"]) then
                    for k, v in pairs(CurrentConfigJob["cashregister"]) do
                        if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                            if onDuty then
                                if #(pos - vector3(v.x, v.y, v.z)) < 0.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Cash Register")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerEvent("surreal-restaurant:bill")
                                    end
                                elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "Cash Register")
                                end  
                            end
                        end
                    end
                end

                -- Garages
                if (CurrentConfigJob["garage"]) then
                    for k, v in pairs(CurrentConfigJob["garage"]) do
                        if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                            if onDuty then
                                if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Garage")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerEvent("surreal-restaurant:restaurantgarage", k)
                                    end
                                elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "Garage")
                                end  
                            end
                        end
                    end
                end

                -- Trays
                if (CurrentConfigJob["trays"]) then
                    for index, value in pairs(CurrentConfigJob["trays"]) do
                        for k, v in pairs(CurrentConfigJob["trays"][index]) do
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                    if #(pos - vector3(v.x, v.y, v.z)) < 0.5 then
                                        sleep = 5
                                        DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                                        if IsControlJustReleased(0, 38) then
                                            TriggerEvent("surreal-restaurant:tray", index)
                                        end
                                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                        sleep = 5
                                        DrawText3D(v.x, v.y, v.z, "Tray")
                                    end  
                            end
                        end        
                    end
                end

                -- Fridge
                if (CurrentConfigJob["fridge"]) then
                    for k, v in pairs(CurrentConfigJob["fridge"]) do
                        if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                            if onDuty then
                                if #(pos - vector3(v.x, v.y, v.z)) < 0.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Fridge")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerEvent("qb-menu:fridgemenu", k)
                                    end
                                elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "Open Fridge")
                                end  
                            end
                        end
                    end
                end
                -- Storage
                if (CurrentConfigJob["storage"]) then
                    for k, v in pairs(CurrentConfigJob["storage"]) do
                        if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                            if onDuty then
                                if #(pos - vector3(v.x, v.y, v.z)) < 0.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Storage")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerEvent("surreal-restaurant:storage", { name = currentjob.."storage"..k})
                                    end
                                elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                    sleep = 5
                                    DrawText3D(v.x, v.y, v.z, "Open Storage")
                                end  
                            end
                        end
                    end
                end
            end
            -- End of On Duty Checks         
            
            -- Start of other checks
            for k, v in pairs(CurrentConfigJob["duty"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        if onDuty then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Get off duty")
                        else
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Get on duty")
                        end
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:restaurantDutyMenu")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                        sleep = 5
                        DrawText3D(v.x, v.y, v.z, "on/off duty")
                    end
                end
            end  
            -- End of other checks
        end
        Citizen.Wait(sleep)
    end
end)
--#endregion main loop logic

--#region storage Logic

RegisterNetEvent('qb-menu:fridgemenu', function(fridgeid)
    exports['qb-menu']:openMenu({
        {
            header = "| Fridge |",
            isMenuHeader = true
        },
        {
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "surreal-restaurant:shop"
            }
        },
        {
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "surreal-restaurant:storage",
                args = {
                    name = currentjob.."fridge"..fridgeid
                }
            }
        },
        {
            header = "• Close Menu",
            txt = "", 
            params = { 
                event = "qb-menu:client:closeMenu"
            }
        },
    })
end)

RegisterNetEvent("surreal-restaurant:storage")
AddEventHandler("surreal-restaurant:storage", function(data)
    TriggerEvent("inventory:client:SetCurrentStash", data.name)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", data.name, {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("surreal-restaurant:shop")
AddEventHandler("surreal-restaurant:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", currentjob, CurrentConfigJob['items'])
end)
--#endregion storage Logic

--#region kitchen Logic

RegisterNetEvent("surreal-restaurant:kitchentask", function(taskName)
    local task = CurrentConfigJob["kitchentask"][taskName]
    if task ~= nil then
        if task.recipe ~= nil then
            TriggerEvent("surreal-restaurant:recipe", task.recipe)
        elseif task['menu'] ~= nil then
            local menulist = {}
            for index, value in pairs(task['menu']) do
                local listitem = {}
                if value.isMenuHeader then
                    listitem.isMenuHeader = value.isMenuHeader
                end
                listitem.header = value.header
                listitem.txt = value.txt
                
                if value.params then
                    listitem.params = value.params
                else
                    listitem.params = {
                        event = "surreal-restaurant:recipe",
                        args = {
                            recipeName = value.recipe
                        }
                    }
                end
                table.insert(menulist, listitem)
            end
            exports['qb-menu']:openMenu(menulist)
        end
    end
end)


RegisterNetEvent("surreal-restaurant:recipe", function(data)
    local recipeName = data
    if type(recipeName) == "table" then
        recipeName = data.recipeName
    end
    local recipe = CurrentConfigJob["recipes"][recipeName]
    if onDuty and recipe ~= nil then
    	QBCore.Functions.TriggerCallback('surreal-restaurant:server:get:ingredients', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", recipe.cooklabel, recipe.cooktime * 1000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, recipe.anim, recipe.prop, recipe.prop2, function() -- Done
                    TriggerServerEvent('surreal-restaurant:server:finishrecipe', recipeName)
                   	QBCore.Functions.Notify(recipe.finishmessage, "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end, currentjob, recipeName)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  

end)
--#endregion kitchen Logic

--#region general Logic

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent("surreal-restaurant:bill", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Till",
        submitText = "Bill Person",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'paypal id'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount!'
            }
        }
    })
    if dialog then
        if not dialog.id or not dialog.amount then return end
        TriggerServerEvent("surreal-restaurant:bill:player", dialog.id, dialog.amount, currentjob)
    end
end)

RegisterNetEvent('qb-menu:restaurantDutyMenu', function(data)
    local menu = {
        { 
            header = "| Clocking in/Off work |",
            isMenuHeader = true
        },
        { 
            header = "• Sign In/Off",
            txt = "",
            params = {
                event = "surreal-restaurant:ToggleDuty",
            }
        },
    }


    if openRestaurants[currentjob] then
        menu[#menu+1] = {
            header = "• Close Restaurant",
            txt = "", 
            params = { 
                isServer = true,
                event = "surreal-restaurant:server:ToggleRestaurantStatus",
                args = false
            }
        }
    else
        menu[#menu+1] = {
            header = "• Open Restaurant",
            txt = "", 
            params = { 
                isServer = true,
                event = "surreal-restaurant:server:ToggleRestaurantStatus",
                args = true
            }
        }
    end

    menu[#menu+1] = {
        header = "• Close Menu",
        txt = "", 
        params = { 
            event = "qb-menu:client:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("surreal-restaurant:tray")
AddEventHandler("surreal-restaurant:tray", function(tray)
    TriggerEvent("inventory:client:SetCurrentStash", tray)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", tray, {
        maxweight = 10000,
        slots = 6,
    })
end)
--#endregion general Logic

--#region Garage Logic

RegisterNetEvent('surreal-restaurant:garage')
AddEventHandler('surreal-restaurant:garage', function(bs)
    local vehicle = bs.vehicle
    if CurrentConfigJob ~= nil then
        local coords = CurrentConfigJob['garage'][bs.garageindex]
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "COMP"..tostring(math.random(1000, 9999)))
            exports['LegacyFuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.w)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    else
        QBCore.Functions.Notify('You are not an employee.', 'error')
    end
end)

RegisterNetEvent('surreal-restaurant:storecar')
AddEventHandler('surreal-restaurant:storecar', function()
    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('surreal-restaurant:restaurantgarage', function(garageindex)
    local menulist = {}
    table.insert(menulist, {
        header = "| "..CurrentConfigJob.name.." Garage |",
        isMenuHeader = true
    })

    for index, value in pairs(CurrentConfigJob['vehicles']) do
        local listitem = {}
        listitem.header = "• "..value.name
        listitem.txt = value.description        
        listitem.params = {
            event = "surreal-restaurant:garage",
            args = {
                vehicle = index,
                garageindex = garageindex
            }
        }
        table.insert(menulist, listitem)
    end

    table.insert(menulist, {
        header = "• Store Vehicle",
        txt = "Store Vehicle Inside Garage",
        params = {
            event = "surreal-restaurant:storecar",
            args = {
            }
        }
    })
    table.insert(menulist, {
        header = "• Close Menu",
        txt = "", 
        params = { 
            event = "qb-menu:client:closeMenu"
        }
    })
    exports['qb-menu']:openMenu(menulist)
end)
--#endregion Garage Logic


Citizen.CreateThread(function() -- Update to each config blip
    -- for k, v in pairs(Config.JobList) do
    --     if v.blip ~= nil then
    --         RestaurantBlip = AddBlipForCoord(v.blip.coords.x, v.blip.coords.y, v.blip.coords.z)
    --         SetBlipSprite (RestaurantBlip, v.blip.sprite)
    --         SetBlipDisplay(RestaurantBlip, 4)
    --         SetBlipScale  (RestaurantBlip, 0.5)
    --         SetBlipAsShortRange(RestaurantBlip, true)
    --         SetBlipColour(RestaurantBlip, v.blip.colour)
    --         BeginTextCommandSetBlipName("STRING")
    --         AddTextComponentSubstringPlayerName(v.name)
    --         EndTextCommandSetBlipName(RestaurantBlip)
        
    --     end
    -- end

    QBCore.Functions.TriggerCallback('surreal-restaurant:server:get:openStatus', function(restaurants)  
        AdjustRestaurantBlips(restaurants)
    end)
end)
