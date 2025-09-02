SMODS.Joker {
    key = "unreal",
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
            emult_gain = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        local negatives = 0
        if G.jokers then
            for i, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    negatives = negatives + 1
                end
            end
        end
        local size_loss = (card.ability.extra.jokers_lost and card.ability.extra.consumeables_lost) and card.ability.extra.emult_gain * (card.ability.extra.jokers_lost + card.ability.extra.consumeables_lost + negatives) or 0
        return {
            vars = {
                card.ability.extra.emult_gain,
                1 + size_loss
            }
        }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            local negatives = 0
            for i, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    negatives = negatives + 1
                end
            end
            local mult = (card.ability.extra.jokers_lost and card.ability.extra.consumeables_lost) and card.ability.extra.emult_gain * (card.ability.extra.jokers_lost + card.ability.extra.consumeables_lost + negatives) or 1
            return {
                e_xmult = mult
            }
        end
    end,
    add_to_deck = function (self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function ()
                local consumeables_loss = G.consumeables and math.max(1, (G.consumeables.config.card_limit - #G.consumeables.cards)) or 0
                local jokers_loss = G.jokers and math.max(1, (G.jokers.config.card_limit - #G.jokers.cards)) or 0
                card.ability.extra.jokers_lost = jokers_loss
                card.ability.extra.consumeables_lost = consumeables_loss
                G.jokers:change_size(-jokers_loss)
                G.consumeables:change_size(-consumeables_loss)
                return true
            end
        }))
    end,
    remove_from_deck = function (self, card, from_debuff)
        local jokers_gain = card.ability.extra.jokers_lost or 1
        local consumeables_gain = card.ability.extra.consumeables_lost or 1
        G.E_MANAGER:add_event(Event({
            func = function ()
                G.jokers:change_size(jokers_gain)
                G.consumeables:change_size(consumeables_gain)
                return true
            end
        }))
    end
}
