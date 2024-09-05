local notif = 'esx:showNotification'

if Config.ESX.NewESX then
  ESX = exports["es_extended"]:getSharedObject()
else
local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

-- Recolte Meth
RegisterServerEvent("gdrugs:recoltem")
AddEventHandler("gdrugs:recoltem", function()
  local item = Config.Item.Meth
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local meth = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountMeth

  if meth > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.Meth)
  end
end)

-- Recolte LSD
RegisterServerEvent("gdrugs:recoltel")
AddEventHandler("gdrugs:recoltel", function()
  local item = Config.Item.LSD
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local lsd = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountLSD

  if lsd > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.LSD)
  end
end)

-- Recolte Opium
RegisterServerEvent("gdrugs:recolteo")
AddEventHandler("gdrugs:recolteo", function()
  local item = Config.Item.Opium
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local opium = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountOpium

  if opium > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.Opium)
  end
end)

-- Recolte Coke
RegisterServerEvent("gdrugs:recoltec")
AddEventHandler("gdrugs:recoltec", function()
  local item = Config.Item.Coke
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local coke = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountCoke

  if coke > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.Coke)
  end
end)

-- Recolte Heroine
RegisterServerEvent("gdrugs:recolteh")
AddEventHandler("gdrugs:recolteh", function()
  local item = Config.Item.Heroine
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local hero = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountHeroine

  if hero > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.Heroine)
  end
end)

-- Recolte Marijuana
RegisterServerEvent("gdrugs:recoltema")
AddEventHandler("gdrugs:recoltema", function()
  local item = Config.Item.Marijuana
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local marijuana = xPlayer.getInventoryItem(item).count
  local count = Config.Item.CountMarijuana

  if marijuana > 50 then
    TriggerClientEvent(notif, _src, '~r~Vous n\'avez plus assez de place pour ceci')
  else
  xPlayer.addInventoryItem(item, count)
  TriggerClientEvent(notif, _src, 'Vous avez récolter ~g~' .. count .. Config.Notif.Marijuana)
  end
end)

-- Traitement Meth
RegisterNetEvent('gdrugs:traitm')
AddEventHandler('gdrugs:traitm', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.Meth
    local traitmeth = xPlayer.getInventoryItem(Config.Item.Meth).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitM).count
    local count_need = Config.Trait.NeedM
    local trait_give = Config.Item.TraitM
    local count_give = Config.Item.CountTraitM

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traitmeth < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez ~p~de cristals de meth !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.Meth " ~s~")
    end
end)

-- Traitement LSD
RegisterNetEvent('gdrugs:traitl')
AddEventHandler('gdrugs:traitl', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.LSD
    local traitlsd = xPlayer.getInventoryItem(Config.Item.LSD).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitL).count
    local count_need = Config.Trait.NeedL
    local trait_give = Config.Item.TraitL
    local count_give = Config.Item.CountTraitL

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traitlsd < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez ~p~de céréales de seigle !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.LSD " ~s~")
    end
end)

-- Traitement Opium
RegisterNetEvent('gdrugs:traito')
AddEventHandler('gdrugs:traito', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.Opium
    local traitopium = xPlayer.getInventoryItem(Config.Item.Opium).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitO).count
    local count_need = Config.Trait.NeedO
    local trait_give = Config.Item.TraitO
    local count_give = Config.Item.CountTraitO

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traitopium < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez ~p~d\'opium !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.Opium " ~s~")
    end
end)

-- Traitement Coke
RegisterNetEvent('gdrugs:traitc')
AddEventHandler('gdrugs:traitc', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.Coke
    local traitcoke = xPlayer.getInventoryItem(Config.Item.Coke).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitC).count
    local count_need = Config.Trait.NeedC
    local trait_give = Config.Item.TraitC
    local count_give = Config.Item.CountTraitC

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traitcoke < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de ~p~ poudre !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.Coke " ~s~")
    end
end)

-- Traitement Heroine
RegisterNetEvent('gdrugs:traith')
AddEventHandler('gdrugs:traith', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.Heroine
    local traithero = xPlayer.getInventoryItem(Config.Item.Heroine).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitH).count
    local count_need = Config.Trait.NeedC
    local trait_give = Config.Item.TraitH
    local count_give = Config.Item.CountTraitH

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traithero < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de ~p~diamorphine !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.Heroine " ~s~")
    end
end)

-- Traitement Marijuana
RegisterNetEvent('gdrugs:traitma')
AddEventHandler('gdrugs:traitma', function()
  local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_need = Config.Item.Marijuana
    local traitmari = xPlayer.getInventoryItem(Config.Item.Marijuana).count
    local item_give = xPlayer.getInventoryItem(Config.Item.TraitMA).count
    local count_need = Config.Trait.NeedMA
    local trait_give = Config.Item.TraitMA
    local count_give = Config.Item.CountTraitMA

    if item_give > 35 then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez de place pour porter ceci')
    elseif traitmari < count_need then
        TriggerClientEvent(notif, _src, 'Vous n\'avez pas assez d\' ~p~herbe de cannabis !~s~')
    else
        xPlayer.removeInventoryItem(item_need, count_need)
        xPlayer.addInventoryItem(trait_give, count_give)   
        TriggerClientEvent(notif, _src, 'Vous avez traité ~p~' .. count_need .. Config.Notif.Marijuana " ~s~")
    end
end)

-- Vente Meth 
RegisterNetEvent('gdrugs:ventem')
AddEventHandler('gdrugs:ventem', function()

    local _src = source
    local item_need = Config.Item.TraitM
    local count_need = Config.VNeed.NeedM
    local xPlayer = ESX.GetPlayerFromId(_src)
    local count_item = xPlayer.getInventoryItem(item_need).count
    local vente_item = 1
    local money = Config.Vente.Argent

    if count_item >= count_need then
			      local playerMoney  = Config.Vente.Meth

                xPlayer.removeInventoryItem(item_need, vente_item)
                xPlayer.addAccountMoney(money, playerMoney)
                        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, Michael vous à donner de l\'argent')
          end
        end)

        -- Vente Heroine 
RegisterNetEvent('gdrugs:venteh')
AddEventHandler('gdrugs:venteh', function()

    local _src = source
    local item_need = Config.Item.TraitH
    local count_need = Config.VNeed.NeedH
    local xPlayer = ESX.GetPlayerFromId(_src)
    local count_item = xPlayer.getInventoryItem(item_need).count
    local vente_item = 1
    local money = Config.Vente.Argent

    if count_item >= count_need then
			      local playerMoney  = Config.Vente.Hero

                xPlayer.removeInventoryItem(item_need, vente_item)
                xPlayer.addAccountMoney(money, playerMoney)
                        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, Michael vous à donner de l\'argent')
          end
        end)

-- Vente Heroine 
RegisterNetEvent('gdrugs:ventec')
AddEventHandler('gdrugs:ventec', function()
        
  local _src = source
  local item_need = Config.Item.TraitC
  local count_need = Config.VNeed.NeedH
  local xPlayer = ESX.GetPlayerFromId(_src)
  local count_item = xPlayer.getInventoryItem(item_need).count
  local vente_item = 1
  local money = Config.Vente.Argent
        
    if count_item >= count_need then
  local playerMoney  = Config.Vente.Coke
        
      xPlayer.removeInventoryItem(item_need, vente_item)
      xPlayer.addAccountMoney(money, playerMoney)
        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, Michael vous à donner de l\'argent')
  end
end)

-- Vente Marijuana 
RegisterNetEvent('gdrugs:ventema')
AddEventHandler('gdrugs:ventema', function()
        
  local _src = source
  local item_need = Config.Item.TraitMA
  local count_need = Config.VNeed.NeedMA
  local xPlayer = ESX.GetPlayerFromId(_src)
  local count_item = xPlayer.getInventoryItem(item_need).count
  local vente_item = 1
  local money = Config.Vente.Argent
        
  if count_item >= count_need then
  local playerMoney  = Config.Vente.Mari
        
      xPlayer.removeInventoryItem(item_need, vente_item)
      xPlayer.addAccountMoney(money, playerMoney)
        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, William vous à donner de l\'argent')
  end
end)

-- Vente Marijuana 
RegisterNetEvent('gdrugs:ventel')
AddEventHandler('gdrugs:ventel', function()
        
  local _src = source
  local item_need = Config.Item.TraitL
  local count_need = Config.VNeed.NeedL
  local xPlayer = ESX.GetPlayerFromId(_src)
  local count_item = xPlayer.getInventoryItem(item_need).count
  local vente_item = 1
  local money = Config.Vente.Argent
        
    if count_item >= count_need then
  local playerMoney  = Config.Vente.LSD
        
      xPlayer.removeInventoryItem(item_need, vente_item)
      xPlayer.addAccountMoney(money, playerMoney)
        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, William vous à donner de l\'argent')
  end
end)

-- Vente Opium 
RegisterNetEvent('gdrugs:venteo')
AddEventHandler('gdrugs:venteo', function()
        
  local _src = source
  local item_need = Config.Item.TraitO
  local count_need = Config.VNeed.NeedO
  local xPlayer = ESX.GetPlayerFromId(_src)
  local count_item = xPlayer.getInventoryItem(item_need).count
  local vente_item = 1
  local money = Config.Vente.Argent
        
    if count_item >= count_need then
  local playerMoney  = Config.Vente.Opium
        
      xPlayer.removeInventoryItem(item_need, vente_item)
      xPlayer.addAccountMoney(money, playerMoney)
        TriggerClientEvent(notif, _src, '~r~Vente effectué~s~, Matthew vous à donner de l\'argent')
  end
end)