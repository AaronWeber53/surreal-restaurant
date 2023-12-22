local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-restaurant:MurderMeal")
AddEventHandler("qb-restaurant:MurderMeal", function()
		local randomToy = math.random(1,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-murdermeal", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "burger-heartstopper", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 1)

		if randomToy < 4 then
			QBCore.Functions.Notify("No toy in Box Looool", "error")
		elseif randomToy == 4 then
			TriggerServerEvent('QBCore:Server:AddItem', "burger-toy1", 1)
            		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy1"], "add")
		elseif randomToy < 10 and randomToy > 4 then
			QBCore.Functions.Notify("No toy in Box Looool", "error")
		elseif randomToy == 10 then
			TriggerServerEvent('QBCore:Server:AddItem', "burger-toy2", 1)
            		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy2"], "add")
		else
            		QBCore.Functions.Notify("No toy in Box Looool", "error")
        	end
end)
