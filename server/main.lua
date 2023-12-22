QBCore = exports['qb-core']:GetCoreObject()
local restaurantsOpen = {}
QBCore.Functions.CreateCallback('surreal-restaurant:server:get:ingredients', function(source, cb, job, recipe)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local value = true
    if Config.JobList[job] ~= nil and Config.JobList[job]['recipes'][recipe] then
        for k, v in pairs(Config.JobList[job]['recipes'][recipe]['useditems']) do
            local item = Ply.Functions.GetItemByName(v.name)
            if item == nil then
                value = false
                break
            elseif item.amount < v.quantity then
                value = false
                break
            end
        end
        cb(value)
    else
        cb(false)
    end
end)

RegisterServerEvent("surreal-restaurant:bill:player")
AddEventHandler("surreal-restaurant:bill:player", function(playerId, amount, jobname)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == jobname then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname,
                            ['@sendercitizenid'] = biller.PlayerData.citizenid
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

CreateThread(function()
    for name, shop in pairs(Config.JobList) do
        restaurantsOpen[name] = false
    end
end)


QBCore.Functions.CreateCallback('surreal-restaurant:server:get:openStatus', function(source, cb)
    cb(restaurantsOpen)
end)

local ToggleStoreStatus = function(job, status)
    restaurantsOpen[job] = status
    TriggerClientEvent('surreal-restaurant:setRestaurantStatuses', -1, restaurantsOpen)
end

QBCore.Commands.Add("openstore", "Opens your restaurant for the day", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.JobList[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
        ToggleStoreStatus(Player.PlayerData.job.name, true)
        TriggerClientEvent('QBCore:Notify', src, 'You opened your restaurant for the day')

    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not own a restaurant right now', 'error')
    end
end)
QBCore.Commands.Add("closestore", "Closes your restaurant for the day", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.JobList[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
        ToggleStoreStatus(Player.PlayerData.job.name, false)
        TriggerClientEvent('QBCore:Notify', src, 'You closed your restaurant for the day')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not own a restaurant right now', 'error')
    end
end)

RegisterNetEvent('surreal-restaurant:server:ToggleRestaurantStatus', function(value)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.JobList[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
        ToggleStoreStatus(Player.PlayerData.job.name, value)
        if value then
            TriggerClientEvent('QBCore:Notify', src, 'You opened your restaurant')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You closed your restaurant for the day')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not own a restaurant right now', 'error')
    end

end)

RegisterNetEvent('surreal-restaurant:server:finishrecipe', function(recipeName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and Config.JobList[Player.PlayerData.job.name] and Config.JobList[Player.PlayerData.job.name]['recipes'][recipeName] then
        local recipe = Config.JobList[Player.PlayerData.job.name]['recipes'][recipeName]
        for i, item in pairs(recipe['useditems']) do
            if not Player.Functions.RemoveItem(item.name, item.quantity) then
                TriggerClientEvent('QBCore:Notify', src, 'Failed to remove required items from inventory', 'error')
                return
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], 'remove')
        end
    
        for i, item in pairs(recipe['receiveditems']) do
            Player.Functions.AddItem(item.name, item.quantity)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], 'add')
        end

    end
end)