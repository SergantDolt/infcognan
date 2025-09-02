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

    if is_sort_different and self == G.jokers then
        SMODS.calculate_context({pre_align = original_cards})
    end
end