INFNAN.util.Border {
    key = 'purple_border',
    atlas = ATLASES.BORDERS.key,
    pos = {x = 5, y = 0},
    config = {
        extra = {
            numerator = 1,
            demoninator = 5
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
        return {vars = {new_numerator, new_denominator, 1}}
    end,
    loc_txt = {
        name = 'Bedroom',
        text = {
            '{C:green}#1# in #2#{} chance to give {C:blue}+1{} hand ',
            "if it's the {C:attention}final hand{}."
        }
    },
    calculate = function (self, card, context)
        if context.main_scoring and G.GAME.current_round.hands_left == 0 then
            if SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator, 'identifier') then
                G.E_MANAGER:add_event(
                    Event({
                        func = function ()
                            ease_hands_played(1, true)
                            return true
                        end
                    })
                )
            end
        end
    end
}