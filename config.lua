Config = {}
Config.JobList = {}

recipeMenuEntry = function (header, txt, recipe)
    return {
        header = header,
        txt = txt,
        recipe = recipe
    }
end

recipeFillOrderAni = function ()
    return {
        animDict = "mp_common",
        anim = "givetake1_a",
        flags = 8,
    }
end
recipeCookAni = function ()
    return {
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }
end
recipeCookProp = function ()
    return {
        model = "prop_cs_fork",
        bone = 28422,
        coords = vector3(-0.005, 0.00, 0.00),
        rotation = vector3(175.0, 160.0, 0.0),
    } 
end

recipeBeerAni = function ()
    return {
        animDict = "amb@world_human_drinking_fat@coffee@female@base",
        anim = "base",
        flags = 8,
    }
end
recipeBeerProp = function ()
    return {
        model = "prop_pint_glass_tall",
        bone = 28422,
        coords = vector3(-0.005, 0.00, 0.00),
        rotation = vector3(175.0, 160.0, 0.0),
    } 
end