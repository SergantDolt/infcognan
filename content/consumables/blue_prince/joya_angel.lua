INFNAN.util.AngelConsumable {
    key = 'shop_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_yellow_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Yellow
                }
            }
        }
    end,
    loc_txt = {
        name = 'Chef',
        text = {
            "{V:1}Joya{} blesses {C:attention}2{} cards ",
            "with the power ",
            "of the {V:1}Shops{}."
        }
    },
    pos = {x = 2, y = 0}
}