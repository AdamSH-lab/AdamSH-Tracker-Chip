----------------------------------------------
----------------------------------------------
--Coded By AdamSH#7861------------------------
--This Project protected by GNU Licence 3.0 --
----------------------------------------------
----------------------------------------------
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('AdamSH:Trackcoord')
AddEventHandler('AdamSH:Trackcoord', function()
    local SH = GetPlayerPed(-1)
    local sh = GetEntityCoords(SH)
    local getclose = ESX.Game.GetClosestVehicle()
    local SHrandom = GetVehicleNumberPlateText(getclose)
    if GetDistanceBetweenCoords(sh, getclose) > 3.0 then
        TaskStartScenarioInPlace(SH, "PROP_HUMAN_BUM_BIN", 0, 1)
        TriggerEvent('chatMessage', '^2Connecting Car Tracking Chip please wait...')
        Wait(10000)
        ClearPedTasks(SH)
        TriggerEvent('chatMessage', 'Car Tracking Chip is Connected successfully to :' ..SHrandom)
        adam = AddBlipForEntity(getclose)
        TriggerServerEvent('AdamSH:Remove')
    end
end)

RegisterCommand('removechip', function(source, args, rawCommand)
    if DoesBlipExist(adam) then
        RemoveBlip(adam)
        TriggerEvent('chatMessage', '^1Car Chip Tracker Is no Longer Available')
    end
end)