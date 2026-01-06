Config = {}

-- Pawnshop NPC location
Config.PawnLocation = {
    coords = vector4(450.96, -1470.68, 28.29, 112.93), -- x, y, z, heading
    ped = 's_m_m_highsec_01', -- NPC model
}

Config.PawnLocation = {
    [1] = {
            coords = vector3(449.18, -1471.93, 29.29),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 100.97,
            maxZ = 105.42,
            distance = 3.0
        },
    }

-- Items you allow players to sell
Config.SellableItems = {
    ['goldchain'] = math.random(50,100),
    ['diamond_ring'] = math.random(50,100),
    ['rolex'] = math.random(50,100),
    ['tenkgoldchain'] = math.random(50,100),
    ['tablet'] = math.random(50,100),
    ['phone'] = math.random(50,100),
    ['samsungphone'] = math.random(50,100),
    ['laptop'] = math.random(50,100),
    ['sim_card'] = math.random(50,100),
}

-- Minimum amount to sell
Config.MinSellAmount = 1

-- Interaction text
Config.InteractText = "[E] Sell Items"
