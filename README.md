# zerx-pawnshop-V2
# Zerx Pawnshop Script for QBCore ox_inventory

A simple pawnshop script for QBCore-based FiveM servers that allows players to sell specific items to an NPC using `qb-menu`, `qb-input`, and `interact` for interactions.

---

## Features

- Spawn a pawnshop NPC at a configurable location.
- Players can sell predefined items from their inventory.
- Supports dynamic pricing per item.
- Uses `qb-menu` for the selling interface and `qb-input` for quantity selection.
- Fully integrated with `QBCore.Functions.GetPlayer` for inventory checks.
- Interaction handled via `exports.interact:AddLocalEntityInteraction`.

---

## Requirements

- QBCore Framework
- `qb-menu`
- `qb-input`
- `interact` export (for NPC interaction)
- `ox_inventory`
- FiveM server

---

## Installation

1. Place the script in your resources folder:
    ```
    resources/[scripts]/zerx-pawnshop
    ```

2. Add it to your `server.cfg`:
    ```cfg
    ensure zerx-pawnshop
    ```

3. Make sure you have the following dependencies installed and running:
    - `qb-core`
    - `qb-menu`
    - `qb-input`
    - `interact`
    - `ox_inventory`

---

## Configuration

Edit `config.lua` to customize the pawnshop:

```lua
Config = {}

-- Pawnshop NPC location
Config.PawnLocation = {
    coords = vector4(450.96, -1470.68, 28.29, 112.93), -- x, y, z, heading
    ped = 's_m_m_highsec_01', -- NPC model
}

-- Items players are allowed to sell (item name = price range)
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

-- Minimum amount a player can sell at once
Config.MinSellAmount = 1
