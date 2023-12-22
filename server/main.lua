QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-restaurant:server:get:ingredients', function(source, cb, job, recipe)
        local src = source
        local Ply = QBCore.Functions.GetPlayer(src)
        local value = true
        if Config.JobList[job] ~= nil then
            for k, v in ipairs(Config.JobList[job]['recipes'][recipe]['useditems']) do
                local item = Ply.Functions.GetItemByName(v.name)
                if item == nil then
                    value = false
                    break
                else if item.amount < v.quantity then
                    value = false
                    break
                end
            end
            cb(value)
        end
        cb(false)
    end
end)

RegisterServerEvent("qb-restaurant:bill:player")
AddEventHandler("qb-restaurant:bill:player", function(playerId, amount, jobname)
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
