local CollectPrompt
local active = false
local amount = 0
local cooldown = 0
local oldBush = {}
local checkbush = 0
local bush


local Plantgroup = GetRandomIntInRange(0, 0xffffff)
print('Plantgroup: ' .. Plantgroup)

function CollectHerbs()
    Citizen.CreateThread(function()
        local str = 'Collect'
        local wait = 0
        CollectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CollectPrompt, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(CollectPrompt, str)
        PromptSetEnabled(CollectPrompt, true)
        PromptSetVisible(CollectPrompt, true)
        PromptSetHoldMode(CollectPrompt, true)
        PromptSetGroup(CollectPrompt, Plantgroup)
        PromptRegisterEnd(CollectPrompt)
    end)
end

Citizen.CreateThread(function()
    Wait(2000)
    CollectHerbs()
    while true do
        Wait(1)
        local playerped = PlayerPedId()
        if checkbush < GetGameTimer() and not IsPedOnMount(playerped) and not IsPedInAnyVehicle(playerped) and not eat and cooldown < 1 then
            bush = GetClosestBush()
            checkbush = GetGameTimer() + 500
        end
        if bush then
            if active == false then
                local PlantgroupName  = CreateVarString(10, 'LITERAL_STRING', "Extract Water")
                PromptSetActiveGroupThisFrame(Plantgroup, PlantgroupName)
            end
            if PromptHasHoldModeCompleted(CollectPrompt) then
                active = true
                oldBush[tostring(bush)] = true
                goCollect()
            end
        end
    end
end)

function goCollect()
    local playerPed = PlayerPedId()
    RequestAnimDict("mech_pickup@plant@tobacco")
    while not HasAnimDictLoaded("mech_pickup@plant@tobacco") do
        Wait(100)
    end
    TaskPlayAnim(playerPed, "mech_pickup@plant@tobacco", "enter_lf", 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
    Wait(800)
    TaskPlayAnim(playerPed, "mech_pickup@plant@tobacco", "base", 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
    Wait(2300)
    TriggerServerEvent('rsg-water:addcactuswater')
    active = false
    ClearPedTasks(playerPed)
end

Citizen.CreateThread(function()
    while true do
        Wait(60000)
        if amount > 0 then
            amount = amount - 1
        end
    end
end)

function GetClosestBush()
    local playerped = PlayerPedId()
    local itemSet = CreateItemset(true)
    local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(playerped), 2.0, itemSet, 3, Citizen.ResultAsInteger())
    if size > 0 then
        for index = 0, size - 1 do
            local entity = GetIndexedItemInItemset(index, itemSet)
            local model_hash = GetEntityModel(entity)
            if (model_hash ==  -445059903 or model_hash == 28288302 or model_hash == -205289130 or model_hash == 1492341684) and not oldBush[tostring(entity)] then
              if IsItemsetValid(itemSet) then
                  DestroyItemset(itemSet)
              end
              return entity
            end
        end
    else
    end

    if IsItemsetValid(itemSet) then
        DestroyItemset(itemSet)
    end
end