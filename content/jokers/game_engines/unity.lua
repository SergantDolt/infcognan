SMODS.Joker {
    key = "unity",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    steam_compat = true,
    atlas = ATLASES.JOKERS.key,
    rarity = 4,
    cost = 5,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            percentage_money = 45,
            percentage_taken = 15
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage_money,
                card.ability.extra.percentage_taken
            }
        }
    end,
    calculate = function (self, card, context)
        if context.after then
            local money = G.GAME.interest_cap * (card.ability.extra.percentage_money * 0.01)
            return {
                dollars = math.floor(to_number(to_big(money)))
            }
        end
        if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers then
            local m = ((G.GAME.dollars or 0 ) + (G.GAME.dollar_buffer or 0)) * (card.ability.extra.percentage_taken * 0.01)
            return {
                dollars = math.floor(to_number(to_big(-m)))
            }
        end
    end
}
