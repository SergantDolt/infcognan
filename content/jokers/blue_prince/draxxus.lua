SMODS.Joker {
    key = "draxxus",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 4,
    cost = 5,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            numerator = 1,
            demoninator = 46,
            odds_increase = 0,
            odds_mod = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.demoninator, 'identifier')
        return {
            vars = {
                new_numerator,
                new_denominator,
                card.ability.extra.odds_mod,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Red
                }
            }
        }
    end,
    calculate = function (self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator + card.ability.extra.odds_increase
            }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local has_red_border = context.other_card.ability.icn_red_border or false
            if has_red_border and SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.numerator, card.ability.extra.demoninator, 'draxxus') then
                card.ability.extra.odds_increase = card.ability.extra.odds_increase + card.ability.extra.odds_mod
                return {
                    message = localize {type = 'variable', key = 'a_odds', vars = {card.ability.extra.odds_mod}},
                    message_card = card,
                    colour = G.C.GREEN
                }
            end
        end
        if context.joker_main then
            local modified_numerator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.demoninator, 'draxxus')
            return {
                e_mult = modified_numerator
            }
        end
    end
}
