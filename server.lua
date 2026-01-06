local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    print("^5[zerx-pawnshop]^7 Zerx Pawnshop v1.0.0 is up to date and running!")
end)

-- Callback to get sellable items from player's inventory
QBCore.Functions.CreateCallback('pawnshop:getItems', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local items = {}

    for item, price in pairs(Config.SellableItems) do
        local itemData = Player.Functions.GetItemByName(item)
        if itemData then
            table.insert(items, {
                name = item,
                label = itemData.label,
                amount = itemData.amount,
                price = price
            })
        end
    end

    cb(items)
end)

-- Selling event
RegisterNetEvent('pawnshop:sellItem', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName(itemName)

    if item and item.amount >= amount and amount >= Config.MinSellAmount then
        local price = Config.SellableItems[itemName] * amount
        Player.Functions.RemoveItem(itemName, amount)
        Player.Functions.AddMoney('cash', price)
        TriggerClientEvent('QBCore:Notify', src, "You sold " .. amount .. "x " .. item.label .. " for $" .. price)
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough " .. itemName, "error")
    end
end)
