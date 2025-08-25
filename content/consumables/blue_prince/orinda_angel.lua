INFNAN.util.AngelConsumable {
    key = 'blackprint_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_black_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Black
                }
            }
        }
    end,
    loc_txt = {
        name = 'Queen',
        text = {
            "{V:1}Orinda{} blesses {C:attention}exactly #1#{} cards ",
            "with the power ",
            "of the {V:1}Blackprints{}."
        }
    },
    pos = {x = 0, y = 0}
}