INFNAN.util.AngelConsumable {
    key = 'bedroom_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_purple_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Purple
                }
            }
        }
    end,
    loc_txt = {
        name = 'Maid',
        text = {
            "{V:1}Mila{} blesses {C:attention}2{} cards ",
            "with the power ",
            "of the {V:1}Bedrooms{}."
        }
    },
    pos = {x = 5, y = 0}
}