if Config.ESX.NewESX then
    ESX = exports["es_extended"]:getSharedObject()
else
local ESX = nil
Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	while ESX == nil do Citizen.Wait(100) end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)
end
CreateThread(function()
    Wait(10)
    while true do 
        local interval = 250
        local coord = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Teleportation) do
                local dist = GetDistanceBetweenCoords(coord, v.position, true)
                if dist < 30 then 
                    interval = 1
                    if v.marker then 
                        DrawMarker(Config.Marker.Type, v.position.x, v.position.y, v.position.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, p19, false, false, false, false)
                    end
                    if dist < 1.5 then 
                        ESX.ShowHelpNotification(v.help)
                        if IsControlJustPressed(1,51) then 
                            v.interact()
                        end 
                    end 
                end 
            end
        Wait(interval)
    end 
end)

function TeleportTO(postp)
    SetEntityCoords(PlayerPedId(), postp)
end