ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('susturucu', function(source)   
    TriggerClientEvent('ExeLds:susturucu', source)
end)

ESX.RegisterUsableItem('fener', function(source) 
    TriggerClientEvent('ExeLds:fener', source)
end)

ESX.RegisterUsableItem('tutamac', function(source)
    TriggerClientEvent('ExeLds:tutamac', source)
end)

ESX.RegisterUsableItem('kaplama', function(source)
    TriggerClientEvent('ExeLds:kaplama', source)
end)

ESX.RegisterUsableItem('durbun', function(source)
    TriggerClientEvent('ExeLds:durbun', source)
end)

ESX.RegisterUsableItem('uzatilmis', function(source)
    TriggerClientEvent('ExeLds:uzatilmis', source)
end)

RegisterNetEvent('ExeLds:eklentiCikart')
AddEventHandler('ExeLds:eklentiCikart', function(hash)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE disc_ammo SET susturucu = @susturucu, fener = @fener, tutamac = @tutamac, kaplama = @kaplama, durbun = @durbun WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@susturucu'] = 0,
		['@fener'] = 0,
		['@tutamac'] = 0,
		['@kaplama'] = 0,
		['@durbun'] = 0
    }, function(results)
    end)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tüm eklentiler çıkartıldı.', length = 3000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
end)

RegisterNetEvent('ExeLds:susturucuTak')
AddEventHandler('ExeLds:susturucuTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('susturucu', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET susturucu = @susturucu WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@susturucu'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, susturucu) VALUES (@owner, @hash, @susturucu)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@susturucu'] = 1
            })
        end
    end)
end)

RegisterNetEvent('ExeLds:fenerTak')
AddEventHandler('ExeLds:fenerTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('fener', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET fener = @fener WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@fener'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, fener) VALUES (@owner, @hash, @fener)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@fener'] = 1
            })
        end
    end)
end)

RegisterNetEvent('ExeLds:tutamacTak')
AddEventHandler('ExeLds:tutamacTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('tutamac', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET tutamac = @tutamac WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@tutamac'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, tutamac) VALUES (@owner, @hash, @tutamac)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@tutamac'] = 1
            })
        end
    end)
end)

RegisterNetEvent('ExeLds:kaplamaTak')
AddEventHandler('ExeLds:kaplamaTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('kaplama', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET kaplama = @kaplama WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@kaplama'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, kaplama) VALUES (@owner, @hash, @kaplama)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@kaplama'] = 1
            })
        end
    end)
end)

RegisterNetEvent('ExeLds:durbunTak')
AddEventHandler('ExeLds:durbunTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('durbun', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET durbun = @durbun WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@durbun'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, durbun) VALUES (@owner, @hash, @durbun)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@durbun'] = 1
            })
        end
    end)
end)

RegisterNetEvent('ExeLds:uzatilmisTak')
AddEventHandler('ExeLds:uzatilmisTak', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('uzatilmis', 1)
    MySQL.Async.execute('UPDATE disc_ammo SET uzatilmis = @uzatilmis WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@uzatilmis'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, uzatilmis) VALUES (@owner, @hash, @uzatilmis)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@uzatilmis'] = 1
            })
        end
    end)
end)