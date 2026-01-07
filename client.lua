local QBCore = exports['qb-core']:GetCoreObject()
local pawnPed = nil

-- Spawn pawnshop NPC and blip
Citizen.CreateThread(function()
    local pedModel = Config.PawnLocation.ped
    local coords = Config.PawnLocation.coords

    -- Load model
    RequestModel(GetHashKey(pedModel))
    while not HasModelLoaded(GetHashKey(pedModel)) do
        Wait(10)
    end

    -- Create Ped
    pawnPed = CreatePed(4, GetHashKey(pedModel), coords.x, coords.y, coords.z, coords.w, false, true)
    SetPedFleeAttributes(pawnPed, 0, 0)
    SetPedDropsWeaponsWhenDead(pawnPed, false)
    SetEntityInvincible(pawnPed, true)
    FreezeEntityPosition(pawnPed, true)
    TaskStartScenarioInPlace(pawnPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    -- Add interaction using your interact export
    exports.interact:AddLocalEntityInteraction({
        entity = pawnPed,
        id = 'pawnshop_interaction',
        name = 'Pawnshop',
        distance = 3.0,
        interactDst = 1.8,
        options = {
            {
                label = "Sell Items",
                action = function(entity, coords, args)
                    openPawnShopMenu()
                end
            }
        }
    })

    -- Add map blip
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 500)           -- Blip icon (can be changed)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(true)
    SetBlipColour(blip, 2)             -- Green color
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pawnshop")
    EndTextCommandSetBlipName(blip)
end)

-- Menu function using qb-menu + qb-input
function openPawnShopMenu()
    QBCore.Functions.TriggerCallback('pawnshop:getItems', function(items)
        if #items == 0 then
            QBCore.Functions.Notify("You have nothing to sell", "error")
            return
        end

        local menuElements = {}
        for i,v in ipairs(items) do
            table.insert(menuElements, {
                header = v.label,  -- Item name only
                txt = "Amount: " .. v.amount .. " | Price: $" .. v.price .. "\nSell this item",
                params = {
                    event = "pawnshop:sellItemPrompt",
                    args = { itemName = v.name, maxAmount = v.amount }
                }
            })
        end

        exports['qb-menu']:openMenu(menuElements)
    end)
end

-- Event to ask how many to sell
RegisterNetEvent('pawnshop:sellItemPrompt', function(data)
    local amount = exports['qb-input']:ShowInput({
        header = "Sell " .. data.itemName,
        submitText = "Sell",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount to sell',
            }
        }
    })

    if amount and tonumber(amount.amount) then
        local amt = tonumber(amount.amount)
        if amt > 0 and amt <= data.maxAmount then
            TriggerServerEvent('pawnshop:sellItem', data.itemName, amt)
        else
            QBCore.Functions.Notify("Invalid amount", "error")
        end
    end
end)
