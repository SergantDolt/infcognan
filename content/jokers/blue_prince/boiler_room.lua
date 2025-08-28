SMODS.Joker {
    key = "boiler",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.ANIMATED.Boiler.key,
    rarity = 2,
    cost = 5,
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            current_direction = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        local is_up = false
        local joker_compat = false
        if card.area == G.jokers then
            joker_compat = is_steam_powerable(get_pointing_joker(card))
            is_up = card.ability.extra.current_direction == 1
        end

        local text = joker_compat and "Compatible" or "Incompatible"
        local colour = joker_compat and G.C.GREEN or G.C.RED
        if is_up then
            text = "Inactive"
            colour = G.C.GREY
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {align = "m", colour = colour, r = 0.05, padding = 0.05},
                        nodes = {
                            {n = G.UIT.T, config = {text = ' ' ..text.. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = false}},
                        }
                    }
                }
            }
        }
        return {
            main_end = main_end
        }
    end,
    loc_txt = {
        name = 'The Boiler',
        text = {
            'Allows {c:attention}certain Jokers{} ',
            'to have additional abilities.',
            '{C:inactive,s:0.7}({C:attention,s:0.7}Right-click{}{C:inactive,s:0.7} on this Joker to adjust.){}',
        }
    },
    calculate = function (self, card, context)
        if context.pre_align then
            card.ability.extra.current_direction = 1
            if card.ability.extra.remembered_joker then
                local remembered_powered = context.pre_align[card.ability.extra.remembered_joker]
                remembered_powered.ability.extra.steam_powered = false
                card.ability.extra.remembered_joker = nil
            end
        end
        if context.right_click and context.right_click.card == card then
            if card.ability.extra.current_direction then
                local joker_to_depower = get_pointing_joker(card)
                if joker_to_depower and is_steam_powerable(joker_to_depower) then
                    joker_to_depower.ability.extra.steam_powered = false
                end

                local d = card.ability.extra.current_direction + 1
                if d > 3 then
                    d = 1
                end
                card.ability.extra.current_direction = d

                local joker_to_power = get_pointing_joker(card)
                if joker_to_power and is_steam_powerable(joker_to_power) then
                    joker_to_power.ability.extra.steam_powered = true
                    card.ability.extra.remembered_joker = get_position(joker_to_power)
                end
            end
            card:stop_hover()
            card:hover()
        end
    end,
    add_to_deck = function (self, card, from_debuff)
        card.ability.extra.animated = true
    end,
    remove_from_deck = function (self, card, from_debuff)
        card.ability.extra.animated = nil
    end,
    update = function (self, card, dt)
        if not card.ability.extra.animated then
            return
        end
        local dir = card and get_animated_direction(card) or 0
        card.children.center:set_sprite_pos({x = dir, y = 0})
    end
}

function is_steam_powerable(card)
    return card and card.config.center.steam_compat or false
end

function get_pointing_joker(card)
    if card and card.ability.extra.current_direction then
        local _d = {0, -1, 1}
        local pos = get_position(card) + _d[card.ability.extra.current_direction]
        if pos > #G.jokers.cards then
            pos = #G.jokers.cards
        elseif pos < 0 then
            pos = 0
        end
        local joker = G.jokers.cards[pos]
        return joker or nil
    end
    return nil
end

function get_animated_direction(card)
    if card and card.ability.extra.current_direction then
        local _d = {2, 0, 1}
        return _d[card.ability.extra.current_direction]
    end
    return 0
end

function get_position(card)
    local current_pos = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            current_pos = i
            break
        end
    end
    return current_pos
end