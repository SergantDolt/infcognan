SMODS.Joker {
    key = "freezer",
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    atlas = ATLASES.JOKERS.key,
    rarity = 2,
    cost = 5,
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'The Freezer',
        text = {
            'You can no longer {C:attention}gain{} or {C:attention}lose{} money.',
            'If a {C:attention}Furnace Joker{} is owned, ',
            'this Joker will {c:attention}thaw{}.'
        }
    }
}

--Hook for the Freezer
local edo = ease_dollars
function ease_dollars(mod, instant)
    local f = is_freezer_present()
    if f then
        freezer_attention(f)
    else
        return edo(mod, instant)
    end
    
end

--Hooks for the shop to ensure that you cannot purchase anything if you have the Freezer, since it would logically make sense that your money is treated as zero.
--Prolly try and find a better way of handling this.

--Jokers and Cards
local cb = G.FUNCS.can_buy
function G.FUNCS.can_buy(e)
    local f = is_freezer_present()
    if f then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return cb(e)
    end
end

--Consumables
local cbau = G.FUNCS.can_buy_and_use
function G.FUNCS.can_buy_and_use(e)
    local f = is_freezer_present()
    if f then
        e.UIBox.states.visible = false
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return cbau(e)
    end
end

local co = G.FUNCS.can_open
function G.FUNCS.can_open(e)
    local f = is_freezer_present()
    if f then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return co(e)
    end
end

--Vouchers
local cr = G.FUNCS.can_redeem
function G.FUNCS.can_redeem(e)
    local f = is_freezer_present()
    if f then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return cr(e)
    end
end

--Rerolling. For consistency, the Freezer does not prevent free rerolls.
local cr = G.FUNCS.can_reroll
function G.FUNCS.can_reroll(e)
    local f = is_freezer_present()
    local reroll_has_cost = G.GAME.current_round.reroll_cost > 0
    if f and reroll_has_cost then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return cr(e)
    end
end

function is_freezer_present()
    local freezer = next(SMODS.find_card("j_infnan_freezer")) and SMODS.find_card("j_infnan_freezer")[1]
    if freezer then
        return freezer
    end
    return false
end

function freezer_attention(freezer)
    local dollar_ui = G.HUD:get_UIE_by_ID('dollar_text_UI')
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function ()
            freezer:juice_up(0.4, 0.2)
            attention_text({
                text = 'Brr!',
                scale = 0.8,
                hold = 0.7,
                cover = dollar_ui.parent,
                cover_colour = G.C.BLUE,
                align = 'cm'
            })
            return true
        end
    }))
end
