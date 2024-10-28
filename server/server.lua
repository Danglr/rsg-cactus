local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('rsg-water:addcactuswater')
AddEventHandler('rsg-water:addcactuswater', function() 
	local src = source
	local Player = RSGCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
	local randomNumber = math.random(1,100)

	if randomNumber > 0 and randomNumber <= 70 then
		local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('cactuswater', givewater)
				TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cactuswater'], "add")
				--TriggerClientEvent('RSGCore:Notify', src, 'You Collected Some Water')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Collected Some Water", "generic_textures" , "tick" , "COLOR_GREEN", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering water   🌱')
			elseif _subRan == 3 then
				Player.Functions.AddItem('cactuswater', givewater)
				TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cactuswater'], "add")
				--TriggerClientEvent('RSGCore:Notify', src, 'You Collected Some Water')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Collected Some Water", "generic_textures" , "tick" , "COLOR_GREEN", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering water   🌱')
			elseif _subRan == 4 then
				Player.Functions.AddItem('cactuswater', givewater)
				TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cactuswater'], "add")
				--TriggerClientEvent('RSGCore:Notify', src, 'You Collected Some Water')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Collected Some Water", "generic_textures" , "tick" , "COLOR_GREEN", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering water   🌱')
			else
			--TriggerClientEvent('RSGCore:Notify', src, 'You Failed To Collect Water')
			TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Failed To Collect Water", "generic_textures" , "tick" , "COLOR_RED", 4000)
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering water   🌱')
		end

	elseif randomNumber > 0 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('cactuswater', givewater)
				TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cactuswater'], "add")
				--TriggerClientEvent('RSGCore:Notify', src, 'You Collected Some Water')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Collected Some Water", "generic_textures" , "tick" , "COLOR_GREEN", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering water   🌱')
			elseif _subRan == 2 then
				Player.Functions.AddItem('cactuswater', givewater)
				TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cactuswater'], "add")
				--TriggerClientEvent('RSGCore:Notify', src, 'You Collected Some Water')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Collected Some Water", "generic_textures" , "tick" , "COLOR_GREEN", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering water   🌱')
			else
				--TriggerClientEvent('RSGCore:Notify', src, 'you failed to find anything')
				TriggerClientEvent('rNotify:ShowAdvancedRightNotification', source, "You Failed To Collect Water", "generic_textures" , "tick" , "COLOR_RED", 4000)
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering water   🌱')
			end
		end
	end)

