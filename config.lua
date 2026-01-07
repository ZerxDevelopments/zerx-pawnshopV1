Config = {}

-- Pawnshop NPC location
Config.PawnLocation = {
    coords = vector4(438.86, -1466.09, 28.29, 71.37), -- x, y, z, heading
    ped = 's_m_m_highsec_01', -- NPC model
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
