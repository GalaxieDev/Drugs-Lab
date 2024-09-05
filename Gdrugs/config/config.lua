Config = {}

Config.ESX = {
  NewESX = false, -- Metter sur true si vous êtes sous une version récente de esx (ESX = exports["es_extended"]:getSharedObject())
}

Config.Marker = {
    Type = 6, -- Type du marker
    Rotation = 360.0, -- Réglé sur 0.0 si vous souhaitez que le marker ne soit pas aplatis
    ColorR = 200, -- Couleur du marker (R)
    ColorG = 10, -- Couleur du marker (G)
    ColorB = 10, -- Couleur du marker (B)
    Opacite = 280, -- Opacité du marker
    Saute = false, -- Si le marker saute ou non
    Tourne = false -- Si le marker tourne ou non
}

Config.Position = {
    Recoltemeth = {
        vector3(1986.3316650391, 4805.44921875, 42.772480010986-0.9)  -- position récolte meth
     },
    Recoltelsd = {
        vector3(530.41082763672, 1899.8319091797, 33.471042633057-0.9) -- position récolte lsd
    },
    Recolteopium = {
        vector3(2233.5600585938, 4779.5322265625, 40.059028625488-0.9) -- position récolte opium
    },
    Recoltecoke = {
        vector3(1093.27, -3196.67, -38.99-0.9) -- position récolte coke
    },
    Recoltehero = {
        vector3(-502.95999145508, -1400.9948730469, 14.340923309326-0.9) -- position récolte heroine
    },
    Recoltemari = {
        vector3(1057.4505615234, -3197.2746582031, -39.147216796875-0.9) -- position récolte marijuana
    },
    TraitM = {
        vector3(1012.108581543, -3195.1518554688, -38.993137359619-0.9) -- position traitement meth
    },
    TraitL = {
        vector3(536.35693359375, 1895.8243408203, 33.548603057861-0.9) -- position traitement lsd
    },
    TraitO = {
        vector3(2830.0458984375, 3438.1674804688, 46.764583587646-0.9) -- position traitement opium
    },
    TraitC = {
        vector3(1100.6815185547, -3198.7536621094, -38.993461608887-0.9) -- position traitement coke
    },
    TraitH = {
        vector3(-496.2126159668, -1405.4844970703, 14.304582595825-0.9) -- position traitement heroine
    },
    TraitMA = {
        vector3(1032.9842529297, -3205.4768066406, -38.180309295654-0.9) -- position traitement marijuana
    },
    VenteMHC = {
        vector3(2461.1787109375, 1574.9780273438, 33.112594604492) -- position vente de la coke, heroine et meth
    },
    VenteMAL = {
        vector3(2544.8645019531, 4643.775390625, 34.076801300049) -- position vente de la marijuana et lsd
    },
    VenteO = {
        vector3(1135.5533447266, -665.53686523438, 57.08260345459) -- position vente de l'Opium
    }
}

Config.Load = {
    load = 0.0, -- Ne pas toucher à cette ligne !!!
    recolteM = 0.0035, -- Vitesse à laquel on récolte (Meth)
    recolteL = 0.0035, -- Vitesse à laquel on récolte (lsd)
    recolteO = 0.0035, -- Vitesse à laquel on récolte (Opium)
    recolteC = 0.0035, -- Vitesse à laquel on récolte (Coke)
    recolteH = 0.0035, -- Vitesse à laquel on récolte (Heroine)
    recolteMA = 0.0035, -- Vitesse à laquel on récolte (Marijuana)
    TraitM = 0.0035, -- Vitesse à laquel on traite (Meth)
    TraitL = 0.0035, -- Vitesse à laquel on traite (lsd)
    TraitO = 0.0035, -- Vitesse à laquel on traite (Opium)
    TraitC = 0.0035, -- Vitesse à laquel on traite (Coke)
    TraitH = 0.0035, -- Vitesse à laquel on traite (heroine)
    TraitMA = 0.0035 -- Vitesse à laquel on traite (marijuana)
}

Config.Item = {
    Meth = "cristal_meth", -- Item de récolte
    CountMeth = 1, -- Nombre d'item reçus lorsque 100% est atteint
    LSD = "seigle", -- Item de récolte
    CountLSD = 1, -- Nombre d'item reçus lorsque 100% est atteint
    Opium = "opium", -- Item de récolte
    CountOpium = 1, -- Nombre d'item reçus lorsque 100% est atteint
    Coke = "coke", -- Item de récolte
    CountCoke = 1, -- Nombre d'item reçus lorsque 100% est atteint
    Heroine = "diamorphine", -- Item de récolte
    CountHeroine = 1, -- Nombre d'item reçus lorsque 100% est atteint
    Marijuana = "herbe_cannabis", -- Item de récolte
    CountMarijuana = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitM = "pochon_meth", -- Item de traitement
    CountTraitM = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitL = "pilule_lsd", -- Item de traitement
    CountTraitL = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitO = "pochon_opium", -- Item de traitement
    CountTraitO = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitC = "poudre_coke", -- Item de traitement
    CountTraitC = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitH = "pochon_heroine", -- Item de traitement
    CountTraitH = 1, -- Nombre d'item reçus lorsque 100% est atteint
    TraitMA = "pochon_marijuana", -- Item de traitement
    CountTraitMA = 1 -- Nombre d'item reçus lorsque 100% est atteint
}

Config.Trait = {
    NeedM = 5, -- Nombre d'item que l'on a besoin pour traiter (meth)
    NeedL = 5, -- Nombre d'item que l'on a besoin pour traiter (lsd)
    NeedO = 5, -- Nombre d'item que l'on a besoin pour traiter (opium)
    NeedC = 5, -- Nombre d'item que l'on a besoin pour traiter (coke)
    NeedMA = 5 -- Nombre d'item que l'on a besoin pour traiter (marijuana)
}

Config.VNeed = {
    NeedM = 1, -- Nombre d'item qu'il faut pour vendre (meth)
    NeedH = 1, -- Nombre d'item qu'il faut pour vendre (heroine)
    NeedC = 1, -- Nombre d'item qu'il faut pour vendre (coke)
    NeedMA = 1, -- Nombre d'item qu'il faut pour vendre (marijuana)
    NeedL = 1, -- Nombre d'item qu'il faut pour vendre (lsd)
    NeedO = 1 -- Nombre d'item qu'il faut pour vendre (opium)
}

Config.Vente = {
    Argent = "black_money", -- Remplacé cela par "bank" si vous souhaitez que le joueur recoive de l'argent propre en banque
    Meth = 875, -- Argent reçus par le joueur lors de la vente (meth)
    Hero = 685, -- Argent reçus par le joueur lors de la vente (heroine)
    Coke = 745, -- Argent reçus par le joueur lors de la vente (cocaine)
    Mari = 525, -- Argent reçus par le joueur lors de la vente (marijuana)
    LSD = 495, -- Argent reçus par le joueur lors de la vente (lsd)
    Opium = 715 -- Argent reçus par le joueur lors de la vente (opium)
}

Config.Notif = {
    Meth = '~s~ ~o~Cristal(s) de Meth~s~', -- Nom de l'item affiché en jeu
    LSD = '~s~ ~g~Céréales de Seigle~s~', -- Nom de l'item affiché en jeu
    Opium = '~s~ ~r~Opium~s~', -- Nom de l'item affiché en jeu
    Coke = '~s~ ~w~Poudre de Cocaïne~s~', -- Nom de l'item affiché en jeu
    Heroine = '~s~ ~b~Diamorphine~s~', -- Nom de l'item affiché en jeu
    Marijuana = '~s~ ~y~Herbe(s) de cannabis~s~' -- Nom de l'item affiché en jeu
}

Config.Teleportation = {
    ["LaboMethE"]={
      marker = true,
      position = vector3(346.46810913086, 3406.6120605469, 36.514209747314-0.9),
      help = "Appuyez sur [~b~E~s~] pour entrer !",
      interact = function ()
        postp = vector3(997.2470703125, -3200.6313476563, -36.393688201904)
        TeleportTO(postp)
      end
    },
  
    ["LaboMethS"]={
      marker = true,
      position = vector3(997.2470703125, -3200.6313476563, -36.393688201904-0.9),
      help = "Appuyez sur [~b~E~s~] pour sortir !",
      interact = function()
        postp = vector3(346.46810913086, 3406.6120605469, 36.514209747314)
        TeleportTO(postp)
      end
    },
    ["LaboLSDE"]={
        marker = true,
        position = vector3(530.61248779297, 1892.3220214844, 33.434543609619-0.9),
        help = "Appuyez sur [~b~E~s~] pour sortir !",
        interact = function()
          postp = vector3(1062.6730957031, -2407.8896484375, 29.981281280518)
          TeleportTO(postp)
        end
      },
      ["LaboLSDS"]={
        marker = true,
        position = vector3(1062.6730957031, -2407.8896484375, 29.981281280518-0.9),
        help = "Appuyez sur [~b~E~s~] pour entrer !",
        interact = function()
          postp = vector3(530.61248779297, 1892.3220214844, 33.434543609619)
          TeleportTO(postp)
        end
      },
      ["LaboMariE"]={
        marker = true,
        position = vector3(1066.2291259766, -3183.4697265625, -39.163578033447-0.9),
        help = "Appuyez sur [~b~E~s~] pour sortir !",
        interact = function()
          postp = vector3(180.11514282227, 2793.228515625, 45.655178070068)
          TeleportTO(postp)
        end
      },
      ["LaboMariS"]={
        marker = true,
        position = vector3(180.11514282227, 2793.228515625, 45.655178070068-0.9),
        help = "Appuyez sur [~b~E~s~] pour entrer !",
        interact = function()
          postp = vector3(1066.2291259766, -3183.4697265625, -39.163578033447)
          TeleportTO(postp)
        end
      },
      ["LaboCokeE"]={
        marker = true,
        position = vector3(1088.9606933594, -3187.8288574219, -38.993461608887-0.9),
        help = "Appuyez sur [~b~E~s~] pour sortir !",
        interact = function()
          postp = vector3(-292.29583740234, -2602.2517089844, 6.1958661079407)
          TeleportTO(postp)
        end
      },
      ["LaboCokeS"]={
        marker = true,
        position = vector3(-292.29583740234, -2602.2517089844, 6.1958661079407-0.9),
        help = "Appuyez sur [~b~E~s~] pour entrer !",
        interact = function()
          postp = vector3(1088.9606933594, -3187.8288574219, -38.993461608887)
          TeleportTO(postp)
        end
      },
  }