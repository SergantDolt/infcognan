INFNAN.util.AngelConsumable {
    key = 'hallway_border_consumable',
    config = {
        min_highlighted = 2,
        max_highlighted = 2,
        border = 'icn_orange_border'
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                colours = {
                    INFNAN.C.CONTENT.BLUE_PRINCE.Borders.Orange
                }
            }
        }
    end,
    loc_txt = {
        name = 'Equestrian',
        text = {
            "{V:1}Lydia{} blesses {C:attention}exactly #1#{} cards ",
            "with the power ",
            "of the {V:1}Hallways{}."
        }
    },
    pos = {x = 6, y = 0}
}