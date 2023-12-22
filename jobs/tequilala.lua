local pouringBeerPintRecipe = function(beerName)
    return {
        anim = recipeCookAni(),
        prop = recipeCookProp(),
        cooktime = 4, -- seconds
        finishmessage = "You poured a pint",
        cooklabel = "Pouring Pint...",
        ['useditems'] = {
            [1] = {
                name = "pintglass",
                quantity = 1
            }
        },
        ['receiveditems'] = {
            [1] = {
                name = beerName,
                quantity = 1
            }
        },
    }
end

Config.JobList["tequilala"] = {
    name = "Tequilala",
    blip = {
        coords = vector3(-565.24, 278.28, 83.14),
        sprite = 93,
        colour = 0
    },
    ["duty"] = {
        [1] = vector4(-565.24, 278.28, 83.14, 340.83),
    },    
    ["trays"] = {
        ["bartray1"] = {
            [1] = vector4(-561.8, 286.03, 82.18, 270.19),
        },
        ["bartray2"] = {
            [1] = vector4(-564.75, 284.7, 85.38, 287.12),
        },
    },
    ["cashregister"] = {
        [1] = vector4(-562.36, 287.42, 82.18, 78.06),
        [2] = vector4(-563.39, 279.29, 82.98, 207.14), -- Cloak room
        [3] = vector4(-565.63, 284.7, 85.38, 98.95), -- upstairs bar
    },   
    ["fridge"] = {
        [1] = vector4(-562.04, 289.75, 82.18, 61.28),
        [2] = vector4(-565.38, 287.71, 85.38, 68.01), -- upstairs bar
    },      
    ["storage"] = {
        [1] = vector4(-575.85, 286.26, 79.18, 175.38),
    },
    ['kitchentask'] = {
        ["mixer"] = {
            closetext = "~g~E~w~ -  Mix Drinks",
            closedistance = 0.5,
            fartext = "Mix Drinks",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(-562.44, 285.1, 82.18, 102.61),
                [2] = vector4(-565.51, 286.13, 85.38, 75.33), -- upstairs bar
            },
            ['menu'] = {
                {
                    header = "| Mixer Burgers |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Sunny Cocktail", "Cocktail Glass", "sunnycock"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }
        }, 
        ["beertap"] = {
            closetext = "~g~E~w~ - Pour Beer",
            closedistance = 0.5,
            fartext = "Pour Beer",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(-561.71, 288.08, 82.18, 276.72),
                [2] = vector4(-564.91, 286.49, 85.38, 247.19), -- upstairs bar
            },
            ['menu'] = {
                {
                    header = "| Beer Menu |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• A.M. Beer", "Pint Glass", "ambeer"),
                recipeMenuEntry("• Logger Beer", "Pint Glass", "loggerbeer"),
                recipeMenuEntry("• Stronzo Beer", "Pint Glass", "stronzobeer"),
                recipeMenuEntry("• Dusche Beer", "Pint Glass", "duschebeer"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }
        }, 

    },
    ['recipes'] = {
        ['ambeer'] = pouringBeerPintRecipe('am-beer'),
        ['loggerbeer'] = pouringBeerPintRecipe('logger-beer'),
        ['stronzobeer'] = pouringBeerPintRecipe('stronzo-beer'),
        ['duschebeer'] = pouringBeerPintRecipe('dusche-beer'),
        ['sunnycock'] ={
            anim = {
                animDict = "anim@amb@clubhouse@bar@drink@one",
                anim = "one_bartender",
                flags = 8,
            },
            prop = {
                model = "prop_shot_glass",
                bone = 60309,
                coords = vector3(-0.005, 0.00, 0.00),
                rotation = vector3(175.0, 160.0, 0.0),
            },
            prop2 = {
                model = "prop_cs_whiskey_bottle",
                bone = 28422,
                coords = vector3(-0.005, 0.00, 0.00),
                rotation = vector3(175.0, 160.0, 0.0),
            },
            cooktime = 4, -- seconds
            finishmessage = "You made a cocktail",
            cooklabel = "Mixing Cocktail...",            
            ['useditems'] = {
                [1] = {
                    name = "cocktailglass",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "sunny-cocktail",
                    quantity = 1
                }
            },
        },
    },
    ['items'] = {
        label = "Shop",
        slots = 7,
        items = {
            [1] = {
                name = "pintglass",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "smallglass",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "wineglass",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "cocktailglass",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "crisps",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 5,
            },
        }
    }
}

addItemsToFoodList({
    ['burger-heartstopper'] = {
        increase = math.random(35, 54)
    },
    ['burger-bleeder'] = {
        increase = math.random(35, 54)
    },
    ['burger-moneyshot'] = {
        increase = math.random(35, 54)
    },
    ['burger-torpedo'] = {
        increase = math.random(35, 54)
    },
    ['burger-meatfree'] = {
        increase = math.random(35, 54)
    },
    ['burger-fries'] = {
        increase = math.random(35, 54)
    },
})
addItemsToAlcoholList({
    ['dusche-beer'] = {
        increase = math.random(5,15)
    },
    ['stronzo-beer'] = {
        increase = math.random(5,15)
    },
    ['am-beer'] = {
        increase = math.random(5,15)
    },
    ['logger-beer'] = {
        increase = math.random(5,15)
    },
    ['sunny-cocktail'] = {
        increase = math.random(5,15)
    },
})