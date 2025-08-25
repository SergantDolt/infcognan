INFNAN.C = {
    MAIN = HEX("5b235f"),
    CONTENT = {
        BLUE_PRINCE = {
            Borders = {
                Red = HEX("d82942"),
                Orange = HEX("ec772c"),
                Yellow = HEX("e5e74b"),
                Green = HEX("67b864"),
                Blue = HEX("6175b6"),
                Purple = HEX("a350a8"),
                Black = HEX("3e4b4d")
            }
        }
    }
}

if INFNAN.config.blue_prince_enabled then
    INFNAN.util.Border = SMODS.Sticker:extend {
        atlas = ATLASES.BORDERS.key
    }

    INFNAN.util.angel_set = SMODS.ConsumableType {
        key = 'border_granter',
        prefix_config = {key = true},
        primary_colour = INFNAN.C.MAIN,
        secondary_colour = INFNAN.C.MAIN,
        shop_rate = 0,
        default = 'green_border_consumable',
        collection_rows = {3, 3}
    }

    ---@type SMODS.Consumable
    INFNAN.util.AngelConsumable = SMODS.Consumable:extend {
        set = INFNAN.util.angel_set.key,
        atlas = ATLASES.ANGEL_BLESSINGS.key,
        loc_vars = function (self, info_queue, card)
            if not self.config then
                return
            end
        end,
        use = function (self, card, area, copier)
            if card.ability.border then
                for _, v in ipairs(G.hand.highlighted) do
                    v.ability[card.ability.border] = true
                end
            end
        end
    }
end

---@param path string
---@param items table
INFNAN.util.load_from_folder = function (path, items)
    for i = 1, #items do
        SMODS.load_file(path.."/"..items[i] .. ".lua")()
    end
end

function Card:right_click()
    if self.area == G.jokers then
        SMODS.calculate_context({right_click = {card = self}})
    end
end

local cardarea_aligncards = CardArea.align_cards
function CardArea:align_cards()
    local original_cards = {}
    for k, card in ipairs(self.cards) do
        original_cards[#original_cards+1] = card
    end

    cardarea_aligncards(self)

    local is_sort_different = false
    for k, sorted_card in ipairs(self.cards) do
        if original_cards[k] ~= sorted_card then
            is_sort_different = true
        end
    end

    if is_sort_different then
        SMODS.calculate_context({pre_shuffle = original_cards})
    end
end