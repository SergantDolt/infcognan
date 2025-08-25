INFNAN.util.AngelConsumable {
    key = 'red_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_red_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Red
                }
            }
        }
    end,
    loc_txt = {
        name = 'Chimney Sweep',
        text = {
            "{V:1}Veia{} blesses {C:attention}2{} cards ",
            "with the dubious power",
            "of the {V:1}Red Rooms{}."
        }
    },
    pos = {x = 4, y = 0}
}