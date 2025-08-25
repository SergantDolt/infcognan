SMODS.Joker {
    key = "chamber_of_mirrors",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 3,
    cost = 10,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            numerator = 8,
            demoninator = 46
        }
    },
    loc_vars = function (self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, self.config.extra.numerator, self.config.extra.demoninator, 'identifier')
        return {vars = {new_numerator, new_denominator}}
    end,
    loc_txt = {
        name = "Chamber of Mirrors",
        text = {
            '{C:green}#1# in #2#{} chance per {C:attention}Reroll{}',
            'to {C:attention}spawn{} an already owned',
            '{C:attention}Joker{} or {C:attention}Consumable{} in',
            'the Shop.'
        }
    },
    calculate = function (self, card, context)
        if context.reroll_shop then
            local hit = SMODS.pseudorandom_probability(card, 'seed', self.config.extra.numerator, self.config.extra.demoninator)
            if hit then
                local pool = {}
                if G.jokers and #G.jokers.cards > 0 then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] ~= card then
                            pool[#pool+1] = G.jokers.cards[i].config.center_key
                        end
                    end
                end
                if G.consumeables and #G.consumeables.cards > 0 then
                    for i = 1, #G.consumeables.cards do
                        pool[#pool+1] = G.consumeables.cards[i].config.center_key
                    end
                end
                if pool then
                     G.E_MANAGER:add_event(Event({
                        func = function ()
                            local chosen_card = SMODS.create_card({key = pseudorandom_element(pool)})
                            create_shop_card_ui(chosen_card)
                            G.shop_jokers:emplace(chosen_card)
                            delay(0.5)
                            SMODS.calculate_effect({message = "Duped!", colour = G.C.CHIPS}, card)
                            return true
                        end
                    }))
                end
            end
        end
    end
}