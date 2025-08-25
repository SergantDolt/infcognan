INFNAN.util.Border {
    key = 'green_border',
    atlas = ATLASES.BORDERS.key,
    pos = {x = 3, y = 0},
    config = {
        extra = {
            numerator = 1,
            demoninator = 5
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
        return {vars = {new_numerator, new_denominator}}
    end,
    loc_txt = {
        name = 'Green Room',
        text = {
            '{C:green}#1# in #2#{} chance to ',
            'generate a random {C:attention}Tag{}'
        }
    },
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator, 'identifier') then
                local tags = {}
                for k, v in pairs(G.P_TAGS) do
                    if v.key ~= "tag_orbital" then
                        table.insert(tags, v.key)
                    end
                end
                add_tag(Tag(pseudorandom_element(tags)))
            end
        end
    end
}