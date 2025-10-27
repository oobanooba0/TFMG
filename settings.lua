data:extend({
--hidden settings for debug purposes.
    {--weather or not to do the whole starting sequence.
        type = "bool-setting",
        name = "start-as-SELF",
        setting_type = "runtime-global",
        default_value = true,
        forced_value = true,
        hidden = true,
    },
    {--weather or not to do the whole starting sequence.
        type = "bool-setting",
        name = "SELF-has-extra-stuff",
        setting_type = "runtime-global",
        default_value = false,
        forced_value = false,
        hidden = true,
    },
})