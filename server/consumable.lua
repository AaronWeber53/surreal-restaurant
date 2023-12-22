local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("burger-murdermeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-restaurant:MurderMeal", source, item.name)
end)
