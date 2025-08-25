INFNAN.util.Border {
    key = 'red_border',
    pos = {x = 0, y = 0},
    config = {
        extra = {
            numerator = 1,
            demoninator = 2,
            Xmult = 0.8
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
        return {vars = {new_numerator, new_denominator, 1}}
    end,
    loc_txt = {
        name = 'Red Room',
        text = {
            '{C:green}#1# in #2#{} chance to give ',
            '{X:mult,C:white}X0.8{} Mult{} when scoring.'
        }
    },
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
           local should_hit = SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
           if should_hit then
                return {
                    xmult = self.config.extra.Xmult
                }
           end
        end
    end
}