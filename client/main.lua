supp1 = {-2084633992, -1357824103, 2132975508, -494615257}
supp2 = {-1716589765, 324215364, -270015777, -1074790547, -1063057011, -1654528753, 984333226}
supp3 = {1593441988, -771403250, 584646201, 137902532, 736523883}
supp4 = {487013001}

flash1 = {453432689, 1593441988, 584646201, -1716589765, -771403250, 324215364}
flash2 = {736523883, -270015777, 171789620, -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 487013001, -494615257, -1654528753, 984333226}

grip1 = {171789620, -1074790547, -2084633992, -1063057011, 2132975508, 2144741730, -494615257, -1654528753, 984333226}

scope1 = {-2084633992}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


RegisterCommand("eklenticikart", function()
local ped = PlayerPedId()
local SilahHash = GetSelectedPedWeapon(ped)
TriggerServerEvent('ExeLds:eklentiCikart', SilahHash)
TriggerEvent('disc-inventoryhud:removeCurrentWeapon')
end)

RegisterNetEvent('ExeLds:susturucu')
AddEventHandler('ExeLds:susturucu', function()

    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped)
	
	ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun)
	if susturucu ~= 1 then
    if SilahHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
        exports['mythic_notify']:SendAlert('inform', 'Susturucu takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:susturucuTak', SilahHash)
    elseif table.includes(supp1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x837445AA)
        exports['mythic_notify']:SendAlert('inform', 'Susturucu takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:susturucuTak', SilahHash)
    elseif table.includes(supp2, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xA73D4664)
        exports['mythic_notify']:SendAlert('inform', 'Susturucu takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:susturucuTak', SilahHash)
    elseif table.includes(supp3, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xC304849A)
        exports['mythic_notify']:SendAlert('inform', 'Susturucu takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:susturucuTak', SilahHash)
    elseif table.includes(supp4, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xE608B35E)
        exports['mythic_notify']:SendAlert('inform', 'Susturucu takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:susturucuTak', SilahHash)
    else
        exports['mythic_notify']:SendAlert('inform', 'Bu silah susturucu takmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end
	else	
	    exports['mythic_notify']:SendAlert('inform', 'Silahında zaten susturucu bulunuyor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)


RegisterNetEvent('ExeLds:fener')
AddEventHandler('ExeLds:fener', function() 
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped)
    ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun)
	if fener ~= 1 then
    if table.includes(flash1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x359B7AAE)
        exports['mythic_notify']:SendAlert('inform', 'Fener takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:fenerTak', SilahHash)
    elseif table.includes(flash2, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x7BC4CDDC)
        exports['mythic_notify']:SendAlert('inform', 'Fener takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:fenerTak', SilahHash)
    else
        exports['mythic_notify']:SendAlert('inform', 'Bu silah fener takmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end
	else	
	    exports['mythic_notify']:SendAlert('inform', 'Silahında zaten fener bulunuyor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)


RegisterNetEvent('ExeLds:tutamac')
AddEventHandler('ExeLds:tutamac', function()
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped) 
	
	ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun)
	if tutamac ~= 1 then
    if table.includes(grip1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xC164F53)
        exports['mythic_notify']:SendAlert('inform', 'Tutamaç takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:tutamacTak', SilahHash)
    else
        exports['mythic_notify']:SendAlert('inform', 'Bu silah tutamaç takmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end	
	else	
	    exports['mythic_notify']:SendAlert('inform', 'Silahında zaten tutamaç bulunuyor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)

RegisterNetEvent('ExeLds:kaplama')
AddEventHandler('ExeLds:kaplama', function()
    local ped = PlayerPedId()
    local mevcutSilahHash = GetSelectedPedWeapon(ped)
	ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun)
	if kaplama ~= 1 then
        if mevcutSilahHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)
        
        elseif mevcutSilahHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:SendAlert('inform', 'Kaplama yapıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:kaplamaTak', mevcutSilahHash)
        else
            exports['mythic_notify']:SendAlert('inform', 'Bu silah kaplama yapmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
        end
	else	
	        exports['mythic_notify']:SendAlert('inform', 'Silahında zaten kaplama bulunuyor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end	
    end, mevcutSilahHash)
end)

RegisterNetEvent('ExeLds:durbun')
AddEventHandler('ExeLds:durbun', function()
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped) 
	
	ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun)
	if durbun ~= 1 then
    if table.includes(scope1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xA0D89C42)
        exports['mythic_notify']:SendAlert('inform', 'Dürbün takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('ExeLds:durbunTak', SilahHash)
    else
        exports['mythic_notify']:SendAlert('inform', 'Bu silah dürbün takmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end	
	else	
	    exports['mythic_notify']:SendAlert('inform', 'Silahında zaten dürbün bulunuyor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)

RegisterNetEvent('ExeLds:uzatilmis')
AddEventHandler('ExeLds:uzatilmis', function()
    local ped = PlayerPedId()
    local mevcutSilahHash = GetSelectedPedWeapon(ped)
	ESX.TriggerServerCallback('disc-inventoryhud:getAmmoCount', function(ammoCount, susturucu, fener, tutamac, kaplama, durbun, uzatilmis)
	if uzatilmis ~= 1 then
        if mevcutSilahHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)
        
        elseif mevcutSilahHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))
            exports['mythic_notify']:SendAlert('inform', 'Uzatılmış takıldı!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('ExeLds:uzatilmisTak', mevcutSilahHash)
        else
            exports['mythic_notify']:SendAlert('inform', 'Bu silah uzatılmış takmak için uygun değil!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
        end
	else	
	        exports['mythic_notify']:SendAlert('inform', 'Silahında zaten uzatılmış takılı!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end	
    end, mevcutSilahHash)
end)


function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end