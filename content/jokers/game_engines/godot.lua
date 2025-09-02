SMODS.Joker {
    key = "godot",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    steam_compat = true,
    atlas = ATLASES.JOKERS.key,
    rarity = 4,
    cost = 20,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            e_xchips_mod = 0.1
        }
    },
    loc_vars = function (self, info_queue, card)
        local key = card.ability.steam_powered and card.config.center.key.."_steam_alt" or card.config.center.key
        return {
            key = key,
            vars = {
                card.ability.extra.e_xchips_mod
            }
        }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            local e_chips = 1
            
            if card.ability.steam_powered then
                local suit_tallies = {['Spades'] = 0, ['Hearts'] = 0, ['Clubs'] = 0, ['Diamonds'] = 0}

                for k, v in ipairs(G.playing_cards) do
                    suit_tallies[v.base.suit] = (suit_tallies[v.base.suit] or 0) + 1
                end
                print(suit_tallies)

                local total = suit_tallies['Spades'] + suit_tallies['Hearts'] + suit_tallies['Clubs'] + suit_tallies['Diamonds']
                e_chips = e_chips + (total * card.ability.extra.e_xchips_mod)
            end

            local full_deck_size = #G.playing_cards
            local jokers = #G.jokers.cards
            local consumables = #G.consumeables.cards
            local hand_size = #G.hand.cards
            local total = full_deck_size + jokers + consumables + hand_size

            return {
                x_chips = total,
                e_chips = e_chips
            }
        end
    end
}

function count_total_suits(suit)
    local num = 0
    for i = 1, #G.playing_cards do
        if G.playing_cards[i].base.suit == suit then
            num = num + 1
        end
    end
    return num
end