INFNAN.util.Border {
    key = 'yellow_border',
    atlas = ATLASES.BORDERS.key,
    pos = {x = 2, y = 0},
    config = {
        extra = {
            numerator = 1,
            demoninator = 2,
            dollar = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
        return {vars = {new_numerator, new_denominator, self.config.extra.dollar}}
    end,
    loc_txt = {
        name = 'Shop',
        text = {
            '{C:green}#1# in #2#{} chance to give ',
            '{C:money}$1{} when scored.'
        }
    },
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator, 'identifier') then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.config.extra.dollar
                return {
                    dollars = self.config.extra.dollar,
                    func = function ()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                }
            end
        end
    end
}