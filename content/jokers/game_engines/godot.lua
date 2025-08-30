SMODS.Joker {
    key = "godot",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    steam_compat = true,
    atlas = ATLASES.JOKERS.key,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            full_deck = 25,
            held_in_hand = 10,
            remaining_card = 0.1,
            filled_slots = 0.01,
            repetitions = 0
        }
    },
    loc_vars = function (self, info_queue, card)
        if card.ability.steam_powered then
            info_queue[#info_queue+1] = {set = "Other", key = "steam_powered"}
        end

        local full_deck = card.ability.extra.full_deck * ((G.playing_cards) and #G.playing_cards or 52)
        local held_in_hand = card.ability.extra.held_in_hand * ((G.hand and G.hand.cards) and #G.hand.cards or 0)
        local remaining = card.ability.extra.remaining_card * ((G.deck and G.deck.cards) and #G.deck.cards or 52)
        local filled_slots = 1 + card.ability.extra.filled_slots * (((G.jokers and G.jokers.cards) and (G.consumeables and G.consumeables.cards)) and #G.jokers.cards + #G.consumeables.cards or 0)
        return {
            vars = {
                card.ability.extra.full_deck,
                card.ability.extra.remaining_card,
                card.ability.extra.filled_slots,
                full_deck + held_in_hand,
                remaining,
                filled_slots
            }
        }
    end,
    calculate = function (self, card, context)
        local return_table = {}
        
        if context.joker_main then
            local full_deck = card.ability.extra.full_deck * #G.playing_cards
            local remaining = 1 + (card.ability.extra.remaining_card * #G.deck.cards)
            local filled_slots = 1 + (card.ability.extra.filled_slots * (#G.jokers.cards + #G.consumeables.cards))

            if (full_deck > 1) then
                return_table.chips = full_deck
            end
            if (remaining ~= 1) then
                return_table.x_chips = remaining
            end
            if (filled_slots ~= 1) then
                return_table.e_chips = filled_slots
            end
            if return_table then
                return return_table
            end
        end
    end
}
