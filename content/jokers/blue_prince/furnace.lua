SMODS.Joker {
    key = "furnace",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 0 },
    loc_vars = function (self, info_queue, card)
        if card.ability.steam_powered then
            info_queue[#info_queue+1] = {set = "Other", key = "steam_powered"}
        end
        return {
            vars = {
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Red
                }
            }
        }
    end,
    loc_txt = {
        name = 'The Furnace',
        text = {
            'When drawing your deck, prioritise',
            '{V:1}Red-Bordered{} cards when possible.'
        }
    }
}
