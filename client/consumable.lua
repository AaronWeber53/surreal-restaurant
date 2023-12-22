local QBCore = exports['qb-core']:GetCoreObject()

local EatGenericFunction = function(itemName, itemslot, hungerIncrease, stressReduction)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1, itemslot)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + hungerIncrease)
        TriggerServerEvent('hud:server:RelieveStress', stressReduction or math.random(2,4))
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error")
    end)

end
RegisterNetEvent('consumables:client:EatGeneric', function(itemName, itemslot, hungerIncrease, stressReduction)
    EatGenericFunction(itemName, itemslot, hungerIncrease, stressReduction)
end)

RegisterNetEvent('consumables:client:EatGenericEffect', function(itemName, itemslot, hungerIncrease, stressReduction, effectDelay)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1, itemslot)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + hungerIncrease)
        SetTimeout((effectDelay or math.random(10, 25)) * 1000, function()
            TriggerServerEvent('hud:server:RelieveStress', stressReduction or math.random(2,4))
            JointEffect(stressReduction)
        end)
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkGeneric', function(itemName, itemslot, thirstIncrease)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1, itemslot)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + thirstIncrease)
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error")
    end)

end)

RegisterNetEvent('consumables:client:DrinkGenericEffect', function(itemName, itemslot, thirstIncrease, stressReduction, effectDelay)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1, itemslot)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + thirstIncrease)
        SetTimeout((effectDelay or math.random(10, 25)) * 1000, function()
            TriggerServerEvent('hud:server:RelieveStress', stressReduction or math.random(2,4))
            JointEffect(stressReduction)
        end)
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error")
    end)

end)