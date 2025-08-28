INFNAN = {
    util = {},
    enabled = {
        jokers = {},
        stickers = {},
        consumables = {}
    },
    sounds = {},
    enabled_sounds = {}
}
SMODS.load_file("config.lua")()
SMODS.load_file("ConfigTab.lua")()

INFNAN.config = SMODS.current_mod.config

SMODS.load_file("ControllerHooks.lua")()

-- Load the Atlases
SMODS.load_file("Atlases.lua")()

-- Load the Utilities
SMODS.load_file("Utilities.lua")()


INFNAN.enabled.jokers.game_engines = {
    'godot'
}

if INFNAN.config.blue_prince_enabled then
    INFNAN.enabled.consumables.blue_prince = {
        'rynna_angel',
        'joya_angel',
        --'dauja_angel',
        'lydia_angel',
        'mila_angel',
        'veia_angel',
        --'orinda_angel'
    }
    INFNAN.enabled.stickers.blue_prince = {
        --'black_border',
        --'blue_border',
        'green_border',
        'orange_border',
        'purple_border',
        'red_border',
        'yellow_border'
    }
    INFNAN.enabled.jokers.blue_prince = {
        'boiler_room',
        'chamber_of_mirrors',
        'freezer',
        'furnace'
    }
end

if INFNAN.config.stanley_enabled then
    INFNAN.enabled.jokers.stanley = {
        'the_bucket'
    }
end

if INFNAN.enabled then
    for o in pairs(INFNAN.enabled) do --content/(jokers, consumables, stickers, ect)..
        local object = INFNAN.enabled[o]
        for g in pairs(object) do --../(game_engines, blue_prince, stanley, ect)..
            local entry = INFNAN.enabled[o][g]
            for _, e in ipairs(entry) do --../(freezer, godot, the_bucket, ect)
                SMODS.load_file("content/"..o.."/"..g.."/"..e..".lua")()
            end
        end
    end
end

