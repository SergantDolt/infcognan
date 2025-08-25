SMODS.current_mod.config_tab = function ()
    return {
        n = G.UIT.ROOT,
        config = {r = 0.1, minw = 1, align = "tm", padding = 0.2, colour = G.C.BLACK},
        nodes = {
            {
                n = G.UIT.C,
                config = {align = "cm", padding = 0.1},
                nodes = {
                    create_toggle({
                        label = "Blue Prince",
                        ref_table = INFNAN.config,
                        ref_value = 'blue_prince_enabled'
                    })
                }
            },
            {
                n = G.UIT.C,
                config = {align = "cm", padding = 0.1},
                nodes = {
                    create_toggle({
                        label = "The Stanley Parable",
                        ref_table = INFNAN.config,
                        ref_value = 'stanley_enabled'
                    })
                }
            },
            {
                n = G.UIT.C,
                config = {align = "cm", padding = 0.1},
                nodes = {
                    create_toggle({
                        label = "Jackbox",
                        ref_table = INFNAN.config,
                        ref_value = 'jackbox_enabled'
                    })
                }
            },
        }
    }
end