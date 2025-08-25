INFNAN.util.AngelConsumable {
    key = 'green_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_green_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Green
                }
            }
        }
    end,
    loc_txt = {
        name = 'Gardener',
        text = {
            "{V:1}Rynna{} blesses {C:attention}exactly #1#{} cards ",
            "with the power ",
            "of the {V:1}Green Rooms{}."
        }
    },
    pos = {x = 1, y = 0}
}