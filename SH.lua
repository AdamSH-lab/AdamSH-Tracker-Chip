ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('TrackingChip', function(source)
    TriggerClientEvent("AdamSH:Trackcoord", source)
end)


RegisterNetEvent("AdamSH:Remove")
AddEventHandler("AdamSH:Remove", function()
    local user = ESX.GetPlayerFromId(source)
    user.removeInventoryItem('TrackingChip', 1)
end)