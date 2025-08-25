INFNAN.util.AngelConsumable {
    key = 'blue_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_blue_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Blue
                }
            }
        }
    end,
    loc_txt = {
        name = 'Farmer',
        text = {
            "{V:1}Dauja{} blesses {C:attention}exactly #1#{} cards ",
            "with the power ",
            "of the {V:1}Blue Rooms{}."
        }
    },
    pos = {x = 3, y = 0}
}