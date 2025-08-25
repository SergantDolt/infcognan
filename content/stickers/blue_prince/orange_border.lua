INFNAN.util.Border {
    key = 'orange_border',
    atlas = ATLASES.BORDERS.key,
    pos = {x = 1, y = 0},
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
        name = 'Hallway',
        text = {
            '{C:green}#1# in #2#{} chance to ',
            'generate a {C:attention}Tarot card{}.'
        }
    },
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator, 'identifier') then
                SMODS.add_card({
                    set = 'Tarot',
                    key_append = 'infnan_orange_border'
                })
            end
        end
    end
}