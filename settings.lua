data:extend({
--hidden settings for debug purposes.
    {--weather or not to do the whole starting sequence.
        type = "bool-setting",
        name = "start-as-SELF",
        setting_type = "runtime-global",
        default_value = false,
        hidden = true,
    },
})