SMODS.Joker {
    key = "furnace",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 2,
    cost = 5,
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            draw = 3
        }
    },
    loc_vars = function (self, info_queue, card)
        if card.ability.steam_powered then
            info_queue[#info_queue+1] = {set = "Other", key = "steam_powered"}
        end
        return {
            vars = {
                card.ability.extra.draw,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Red
                }
            }
        }
    end,
    loc_txt = {
        name = 'The Furnace',
        text = {
            'After discard, also draw {C:attention}#1#{}',
            '{V:1}Red-Bordered{} cards if possible.'
        }
    },
    calculate = function (self, card, context)
        if context.discard then
            local limit = 0
            for i, playing_card in ipairs(G.deck.cards) do
                if playing_card.ability.icn_red_border then
                    if limit < card.ability.extra.draw then
                        draw_card(G.deck, G.hand, i * 100 / card.ability.extra.draw, 'up', true, playing_card)
                        limit = limit + 1
                    end
                end
            end
        end
    end
}
