local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem("gass_mixbag", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("gass_mixbag", 1, item.slot) then
        Player.Functions.AddItem("gass_cookie", 1)
        Player.Functions.AddItem("gass_brownie", 1)
        Player.Functions.AddItem("gass_gummy", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["gass_mixbag"], 'remove')
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["gass_cookie"], 'add')
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["gass_brownie"], 'add')
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["gass_gummy"], 'add')

    end
end)

CreateThread(function()
    for key, value in pairs(Config.FoodItems) do
        QBCore.Functions.CreateUseableItem(key, function(source, item)
            if value.effectDelay then
                TriggerClientEvent("consumables:client:EatGenericEffect", source, item.name, item.slot, value.increase, value.stressReduction, value.effectDelay)                
            else
                TriggerClientEvent("consumables:client:EatGeneric", source, item.name, item.slot, value.increase, value.stressReduction)                
            end
        end)        
    end
    for key, value in pairs(Config.DrinkItems) do
        QBCore.Functions.CreateUseableItem(key, function(source, item)
            if value.effectDelay then
                TriggerClientEvent("consumables:client:DrinkGenericEffect", source, item.name, item.slot, value.increase, value.stressReduction, value.effectDelay)
          
            else
                TriggerClientEvent("consumables:client:DrinkGeneric", source, item.name, item.slot, value.increase)
            end

        end)        
    end
    for key, value in pairs(Config.AlcoholItems) do
        QBCore.Functions.CreateUseableItem(key, function(source, item)
            TriggerClientEvent("consumables:client:DrinkAlcoholGeneric", source, item.name, item.slot, value.increase)
        end)        
    end
    for key, value in pairs(Config.CombinedItems) do
        QBCore.Functions.CreateUseableItem(key, function(source, item)
            local Player = QBCore.Functions.GetPlayer(source)
            if Player.Functions.RemoveItem(item.name, 1, item.slot) then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], 'remove')
                for key, quantity in pairs(value.items) do
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[key], 'add')
                    Player.Functions.AddItem(key, quantity)                
                end

                if value.extraFunc then
                    value.extraFunc(function(itemName, quantity)
                        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], 'add')
                        Player.Functions.AddItem(itemName, quantity)                
    
                    end)
                end
            end 
        end)        
    end
end)

