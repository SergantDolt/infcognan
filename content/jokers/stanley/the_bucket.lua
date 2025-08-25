SMODS.Joker {
    key = "the_bucket",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            stored_xmult = 0,
            percent = 5
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                1 + card.ability.extra.stored_xmult,
                card.ability.extra.percent
            }
        }
    end,
    loc_txt = {
        name = "The Jimbo Balatro's Reassurance Bucket",
        text = {
            'Whenever a card scores {C:chips}chips{},',
            'gain {C:attention}#2#{}% of its value as {X:mult,C:white}Xmult{}.',
            '{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive}){}'
        }
    },
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then
            local new_chips = (card.ability.extra.percent * 0.01) * context.other_card:get_chip_bonus()
            card.ability.extra.stored_xmult = card.ability.extra.stored_xmult + new_chips
            return {
                message_card = card,
                message = localize {type = 'variable', key = 'a_chips', vars = {new_chips}},
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                Xmult = 1 + card.ability.extra.stored_xmult
            }
        end
    end
}
