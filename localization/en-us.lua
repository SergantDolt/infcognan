return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            j_icn_godot = {
                name = "Godot",
                text = {
                    '{C:chips}+#1# chips{} for each card {C:attention}in full deck{}.',
                    '{X:chips,C:white}X#2#{} {C:chips}chips{} for each {C:attention}remaining card{}.',
                    '{X:dark_edition,C:white}^#3#{} {C:chips}chips{} for each {C:attention}filled Joker{} and {C:attention}consumable slot{}.',
                    '{C:inactive}(Currently {C:chips}+#4# chips{}{C:inactive}, {X:chips,C:white}X#5#{}{C:chips} chips{}{C:inactive}, {X:dark_edition,C:white}^#6#{}{C:chips} chips{}{C:inactive})'
                },
                steam_text = {
                    'When a scoring card is {C:attention}debuffed{}, trigger this Joker.'
                }
            },
            j_icn_furnace = {
                name = 'The Furnace',
                text = {
                    'After discard, also draw {C:attention}#1#{}',
                    '{V:1}Red-Bordered{} cards if possible.'
                },
                steam_text = {
                    '{C:attention}Burn{}{V:1}Red-Bordered{} cards if they are scored',
                    'Earn {C:money}$#2#{} for each burnt card.'
                }
            },
            j_icn_draxxus = {
                name = 'Draxxus the Dead',
                text = {
                    "{C:green}#1# in #2#{} chance to increase {C:attention}all{} odds by {C:green}#3#{}",
                    "when a {V:1}Red-Bordered{} card is scored.",
                    "Its {C:green}numerator{} acts as its {X:dark_edition,C:white}^mult{}."
                }
            }
        },
        Other={
            steam_powered = {
                name = "Steam Powered",
                text = {
                    "This Joker is",
                    "{C:attention}steam-powered{}!"
                }
            }
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={},
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={
            a_odds = "+#1# Odds"
        },
        v_text={},
    },
}