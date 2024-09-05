-- Définition ESX
local PlayerData = {}

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

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	ESX.PlayerData.job = job   
end)

-- Début script

-- Marker récolte Meth
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recoltemeth
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter des cristals de meth", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("creatures@rottweiler@tricks@")
                            TaskPlayAnim(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenRecolteM()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte de Meth
function OpenRecolteM()
    local recoltem = RageUI.CreateMenu("Récolter", "Menu récolte Meth")    

    RageUI.Visible(recoltem, not RageUI.Visible(recoltem))
        while recoltem do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recoltem, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte de cristals de Meth en cours (~p~" .. math.floor(Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteM
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recoltem')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recoltem) then
            recoltem = RMenu:DeleteType("recoltem", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker récolte LSD
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recoltelsd
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter du seigle", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                            OpenRecolteL()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte de LSD
function OpenRecolteL()
    local recoltel = RageUI.CreateMenu("Récolter", "Menu récolte Seigle")    

    RageUI.Visible(recoltel, not RageUI.Visible(recoltel))
        while recoltel do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recoltel, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte de seigle en cours (~p~" .. math.floor(Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteL
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recoltel')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recoltel) then
            recoltel = RMenu:DeleteType("recoltel", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker récolte Opium
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recolteopium
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 35.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de l\'opium", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_WASH", 0, true)
                            OpenRecolteO()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte de Opium
function OpenRecolteO()
    local recolteo = RageUI.CreateMenu("Récolter", "Menu récolte Opium")    

    RageUI.Visible(recolteo, not RageUI.Visible(recolteo))
        while recolteo do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recolteo, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte d'opium en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteO
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recolteo')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recolteo) then
            recolteo = RMenu:DeleteType("recolteo", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker récolte Coke
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recoltecoke
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de la poudre", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v5_coccutter", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenRecolteC()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte de Coke
function OpenRecolteC()
    local recoltec = RageUI.CreateMenu("Récolter", "Menu récolte Cocaïne")    

    RageUI.Visible(recoltec, not RageUI.Visible(recoltec))
        while recoltec do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recoltec, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte de poudre en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteC
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recoltec')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recoltec) then
            recoltec = RMenu:DeleteType("recoltec", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker récolte Heroine
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recoltehero
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de la diamorphine", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                            OpenRecolteH()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte Heroine
function OpenRecolteH()
    local recolteh = RageUI.CreateMenu("Récolter", "Menu récolte Héroïne")    

    RageUI.Visible(recolteh, not RageUI.Visible(recolteh))
        while recolteh do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recolteh, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte de diamorphine en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteH
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recolteh')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recolteh) then
            recolteh = RMenu:DeleteType("recolteh", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker récolte Marijuana
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.Recoltemari
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de l\'herbe de cannabis", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                            OpenRecolteMA()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Récolte Marijuana
function OpenRecolteMA()
    local recoltema = RageUI.CreateMenu("Récolter", "Menu récolte Marijuana")    

    RageUI.Visible(recoltema, not RageUI.Visible(recoltema))
        while recoltema do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(recoltema, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Récolte d'herbe de cannabis en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.recolteMA
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:recoltema')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(recoltema) then
            recoltema = RMenu:DeleteType("recoltema", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement meth
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitM
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter les cristals de meth", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v5_coccutter", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenTraitM()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement meth
function OpenTraitM()
    local traitm = RageUI.CreateMenu("Traiter", "Menu traitement Meth")    

    RageUI.Visible(traitm, not RageUI.Visible(traitm))
        while traitm do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traitm, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement des cristaux de meth (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitM
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traitm')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traitm) then
            traitm = RMenu:DeleteType("traitm", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement LSD
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitL
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 25.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter les céréales de Seigle", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@weed@weed_sorting_seated@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_sorting_seated@", "sorter_right_sort_v3_sorter02", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenTraitL()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement LSD
function OpenTraitL()
    local traitl = RageUI.CreateMenu("Traiter", "Menu traitement LSD")    

    RageUI.Visible(traitl, not RageUI.Visible(traitl))
        while traitl do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traitl, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement des céréales de Seigle (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitL
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traitl')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traitl) then
            traitl = RMenu:DeleteType("traitl", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement Opium
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitO
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter l\'opium", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v5_coccutter", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenTraitO()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement Opium
function OpenTraitO()
    local traito = RageUI.CreateMenu("Traiter", "Menu traitement Opium")    

    RageUI.Visible(traito, not RageUI.Visible(traito))
        while traito do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traito, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement de l'opium en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitO
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traito')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traito) then
            traito = RMenu:DeleteType("traito", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement Coke
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitC
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter la poudre", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v5_coccutter", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenTraitC()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement Coke
function OpenTraitC()
    local traitc = RageUI.CreateMenu("Traiter", "Menu traitement Coke")    

    RageUI.Visible(traitc, not RageUI.Visible(traitc))
        while traitc do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traitc, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement de la poudre en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitC
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traitc')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traitc) then
            traitc = RMenu:DeleteType("traitc", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement Heroine
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitH
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter la diamorphine", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RequestAnimDict("anim@amb@business@coc@coc_unpack_cut_left@")
                            TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v5_coccutter", 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            OpenTraitH()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement heroine
function OpenTraitH()
    local traith = RageUI.CreateMenu("Traiter", "Menu traitement Diamorphine")    

    RageUI.Visible(traith, not RageUI.Visible(traith))
        while traith do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traith, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement de la diamorphine en cours (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitH
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traith')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traith) then
            traith = RMenu:DeleteType("traith", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker traitement Marijuana
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.TraitMA
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z, 0.0, 0.0, Config.Marker.Rotation, 0.0, 0.0, 0.0, 1.0, 0.5, 1.0, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, Config.Marker.Saute, Config.Marker.Tourne, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour traiter l\'herbe de cannabis", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                            OpenTraitMA()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction traitement Marijuana
function OpenTraitMA()
    local traitma = RageUI.CreateMenu("Traiter", "Menu traitement Herbe de Cannabis")    

    RageUI.Visible(traitma, not RageUI.Visible(traitma))
        while traitma do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(traitma, true, false, true, function()

            RageUI.Line()

            RageUI.PercentagePanel(Config.Load.load, "Traitement de l'herbe de cannabis (~p~" .. math.floor( Config.Load.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Load.load < 1.0 then
                    Config.Load.load = Config.Load.load + Config.Load.TraitMA
                else
                    Config.Load.load = 0
                    TriggerServerEvent('gdrugs:traitma')
                end
            end)
            
        end, function()  
        end)
        if not RageUI.Visible(traitma) then
            traitma = RMenu:DeleteType("traitma", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker Vente Meth | Coke | Hero
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.VenteMHC
        local displ = 3000
        local wait = 2000
        local attente = 2500
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(29, v.x, v.y, v.z + 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 200, 10, 10, 280, true, false, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour parler à Michael ", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RageUI.Text({

                                message = "[~b~Vous~w~] Salut, j'ai de la poudre à vendre !",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~Michael~w~] Bonjour, pas d'entourloupe ou t'es mort ok ?",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~b~Vous~w~] Oui oui...",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~Michael~w~] T'as quoi à vendre ?",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            OpenVenteMCH()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Vente Meth | Hero | Coke
function OpenVenteMCH()
    local ventemch = RageUI.CreateMenu("Vente", "Menu Vente")

    RageUI.Visible(ventemch, not RageUI.Visible(ventemch))
        while ventemch do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(ventemch, true, false, true, function()

            RageUI.ButtonWithStyle("Vendre des pochons de meth", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:ventem')
                end
            end)

            RageUI.ButtonWithStyle("Vendre des pochons d'héroïne", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:venteh')
                end
            end)

            RageUI.ButtonWithStyle("Vendre de la poudre de cocaïne", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:ventec')
                end
            end)
            
        end, function()  
        end)

        if not RageUI.Visible(ventemch) then
            ventemch = RMenu:DeleteType("ventemch", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker Vente Marijuana | LSD
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.VenteMAL
        local displ = 3000
        local wait = 2000
        local attente = 2500
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(29, v.x, v.y, v.z + 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 200, 10, 10, 280, true, false, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour parler à William", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RageUI.Text({

                                message = "[~b~Vous~w~] Salut, j'ai de la drogue à vendre !",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~William~w~] Salut, si tu me fais un coup de pute je te descend, c'est compris  ?",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~b~Vous~w~] Oui oui...",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~William~w~] T'as quoi à vendre ?",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            OpenVenteMAL()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Vente Marijuana | LSD
function OpenVenteMAL()
    local ventemal = RageUI.CreateMenu("Vente", "Menu Vente")   

    RageUI.Visible(ventemal, not RageUI.Visible(ventemal))
        while ventemal do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(ventemal, true, false, true, function()

            RageUI.ButtonWithStyle("Vendre des pochons de Marijuana", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:ventema')
                end
            end)

            RageUI.ButtonWithStyle("Vendre des pilules de LSD", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:ventel')
                end
            end)
            
        end, function()  
        end)

        if not RageUI.Visible(ventemal) then
            ventemal = RMenu:DeleteType("ventemal", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Marker Vente Opium
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Position.VenteO
        local displ = 3000
        local wait = 2000
        local attente = 2500
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    DrawMarker(29, v.x, v.y, v.z + 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 200, 10, 10, 280, true, false, 2, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour parler à Matthew", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            RageUI.Text({

                                message = "[~b~Vous~w~] Salut, j'ai de l\'opium à vendre !",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~Matthew~w~] Salut, Me fais pas perdre mon temps sinon tu vas mal finir, t'as pigé  ?",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~b~Vous~w~] Oui oui...",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            RageUI.Text({

                                message = "[~r~Matthew~w~] Vas y, montre moi ce que t'as !",
                    
                                time_display = displ
                    
                            })
                            Citizen.Wait(wait)
                            OpenVenteO()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- Fonction Vente Opium
function OpenVenteO()
    local venteo = RageUI.CreateMenu("Vente", "Menu Vente")   

    RageUI.Visible(venteo, not RageUI.Visible(venteo))
        while venteo do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(venteo, true, false, true, function()

            RageUI.ButtonWithStyle("Vendre des pochons d'Opium", nil, {RightLabel = "~r~ $"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('gdrugs:venteo')
                end
            end)
            
        end, function()  
        end)

        if not RageUI.Visible(venteo) then
            venteo = RMenu:DeleteType("venteo", true)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-- Ped Vente Meth | Hero | Coke 
Citizen.CreateThread(function()
    local name = "g_m_importexport_01"
    local hash = GetHashKey(name)
    local yes = true
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(2000)
    end 
    ped = CreatePed("PED_TYPE_CIVMALE", name, 2461.1787109375,1574.9780273438,33.112594604492 - 1.0, 283.737548828125, false, yes) 
    SetBlockingOfNonTemporaryEvents(ped, yes) 
    FreezeEntityPosition(ped, yes)
    SetEntityInvincible(ped, yes)
  end)

  -- Ped Vente Marijuana | LSD
Citizen.CreateThread(function()
    local name = "g_m_y_salvagoon_01"
    local hash = GetHashKey(name)
    local yes = true
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(2000)
    end 
    ped = CreatePed("PED_TYPE_CIVMALE", name, 2544.8645019531,4643.775390625,34.076801300049 - 1.0, 286.0836181640625, false, yes) 
    SetBlockingOfNonTemporaryEvents(ped, yes) 
    FreezeEntityPosition(ped, yes)
    SetEntityInvincible(ped, yes)
  end)

  -- Ped Vente Opium
  Citizen.CreateThread(function()
    local name = "g_m_m_chemwork_01"
    local hash = GetHashKey(name)
    local yes = true
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(2000)
    end 
    ped = CreatePed("PED_TYPE_CIVMALE", name, 1135.5533447266,-665.53686523438,57.08260345459 - 1.0, 94.33623504638672, false, yes) 
    SetBlockingOfNonTemporaryEvents(ped, yes) 
    FreezeEntityPosition(ped, yes)
    SetEntityInvincible(ped, yes)
  end)