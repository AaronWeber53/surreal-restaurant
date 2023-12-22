
Config.JobList["gassatopia"] = {
    name = "Gass-Atopia",
    blip = {
        coords = vector3(377.78, -828.32, 29.3),
        sprite = 496,
        colour = 25,
        scale = 0.75
    },
    ["duty"] = {
        [1] = vector4(377.34, -819.81, 29.3, 357.94),
    },    
    ["trays"] = {
        ["storefront1"] = {
            [1] = vector4(378.69, -826.69, 29.3, 180.96),
        },
        ["storefront2"] = {
            [1] = vector4(374.91, -828.93, 29.3, 273.43),
        },
    },
    ["cashregister"] = {
        [1] = vector4(380.2, -826.7, 29.3, 181.61),
        [2] = vector4(375.36, -826.7, 29.3, 179.11),
    },   
    ["fridge"] = {
        [1] = vector4(374.37, -824.07, 29.3, 107.68),
    },      
    ["storage"] = {
        [1] = vector4(374.39, -822.04, 29.3, 92.96),
        [2] = vector4(377.47, -823.77, 29.3, 171.94),
    },
    ["garage"] = {
        [1] = vector4(370.08, -821.2, 29.29, 180.21),
    },
    ["vehicles"] = {
        ['bcexpress'] = {
            name = "Gass Wagon",
            description = "The Gassatopia Wagon"
        }
    },
    ['kitchentask'] = {
        ["thcextractor"] = {
            closetext = "~g~E~w~ - Extract THC",
            closedistance = 0.5,
            fartext = "Extract THC",
            farDistance = 2.5,
            recipe = "extract",
            ["coords"] = {
                [1] = vector4(380.3, -820.55, 29.3, 174.52),
                --[2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            }
        },
        ["oven"] = {
            closetext = "~g~E~w~ - EZ Bake Oven",
            closedistance = 0.75,
            fartext = "EZ Bake Oven",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(383.11, -819.73, 29.3, 0.17),
                --[2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            },
            ['menu'] = {
                {
                    header = "| Baking Items |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Cookies", "2 Flour, 2 Butter, 2 Sugar, 2 Egg, 2 Baking Soda, 1 Weed Extract", "cookie"),
                recipeMenuEntry("• Brownies", "2 Flour, 2 Butter, 2 Sugar, 2 Egg, 2 Baking Soda, 2 Chocolate, 1 Weed Extract", "brownie"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }
        },
        ["gummymaker"] = {
            closetext = "~g~E~w~ - Make Gummies",
            closedistance = 0.75,
            fartext = "Make Gummies",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(378.12, -821.54, 29.3, 273.46),
                --[2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            },
            ['menu'] = {
                {
                    header = "| Other Items |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Gummies", "1 Butter, 2 Sugar, 2 Syrup, 1 Extract", "gummy"),
                recipeMenuEntry("• THC Shot", "2 Sugar, 4 Syrup, 1 Extract", "thcshot"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }

        },
        ["mixbag"] = {
            closetext = "~g~E~w~ - Make a Mix-bag",
            closedistance = 0.5,
            fartext = "Make a Mix-bag",
            farDistance = 2.5,
            recipe = "mixbag",
            ["coords"] = {
                [1] = vector4(376.63, -826.79, 29.3, 187.02),
                --[2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            }
        },         
    },
    ['recipes'] = {
        ['extract'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "92% OG",
            cooklabel = "Extracting THC..",
            ['useditems'] = {
                [1] = {
                    name = "weed_og-gass",
                    quantity = 2
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "weed_extract",
                    quantity = 1
                }
            },
        },
        ['cookie'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Cookies are baked",
            cooklabel = "Baking the cookies..",
            ['useditems'] = {
                [1] = {
                    name = "flour",
                    quantity = 2
                },
                [2] = {
                    name = "butter",
                    quantity = 2
                },
                [3] = {
                    name = "sugar",
                    quantity = 2
                },
                [4] = {
                    name = "egg",
                    quantity = 2
                },
                [5] = {
                    name = "bakingsoda",
                    quantity = 2
                },
                [6] = {
                    name = "weed_extract",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "Gass_Cookie",
                    quantity = 6
                }
            },
        },
        ['brownie'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "The brownies are ready",
            cooklabel = "Baking the brownies..",
            ['useditems'] = {
                [1] = {
                    name = "flour",
                    quantity = 2
                },
                [2] = {
                    name = "butter",
                    quantity = 2
                },
                [3] = {
                    name = "sugar",
                    quantity = 2
                },
                [4] = {
                    name = "egg",
                    quantity = 2
                },
                [5] = {
                    name = "bakingsoda",
                    quantity = 2
                },
                [6] = {
                    name = "chocolate",
                    quantity = 2
                },
                [7] = {
                    name = "weed_extract",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "Gass_Brownie",
                    quantity = 4
                }
            },
        },
        ['gummy'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Gummies are finished",
            cooklabel = "Making the gummies..",
            ['useditems'] = {
                [1] = {
                    name = "butter",
                    quantity = 1
                },
                [2] = {
                    name = "sugar",
                    quantity = 2
                },
                [3] = {
                    name = "syrup",
                    quantity = 2
                },
                [4] = {
                    name = "weed_extract",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "Gass_Gummy",
                    quantity = 10
                }
            },
        },
        ['thcshot'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Shot prepared",
            cooklabel = "Preparing the shot..",
            ['useditems'] = {
                [1] = {
                    name = "sugar",
                    quantity = 2
                },
                [2] = {
                    name = "syrup",
                    quantity = 4
                },
                [3] = {
                    name = "weed_extract",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "Gass_Shot",
                    quantity = 2
                }
            },
        },
        ['mixbag'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Happiness in a bag",
            cooklabel = "Preparing the bag..",
            ['useditems'] = {
                [1] = {
                    name = "Gass_cookie",
                    quantity = 1
                },
                [2] = {
                    name = "Gass_brownie",
                    quantity = 1
                },
                [3] = {
                    name = "Gass_Gummy",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "Gass_mixbag",
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
                name = "flour", 
                price = 4,
                amount = 10,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "egg", 
                price = 2,
                amount = 5,
                info = {},
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "chocolate", 
                price = 3,
                amount = 10,
                info = {},
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "sugar",
                price = 2,
                amount = 10,
                info = {},
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "butter",
                price = 1,
                amount = 10,
                info = {},
                type = "item",
                slot = 5,
            },            
            [6] = {
                name = "bakingsoda",
                price = 1,
                amount = 10,
                info = {},
                type = "item",
                slot = 6,
            },
            [7] = {
                name = "syrup",
                price = 1,
                amount = 10,
                info = {},
                type = "item",
                slot = 7,
            },
            [8] = {
                name = "weed_og-gass_seed",
                price = 500,
                amount = 4,
                info = {},
                type = "item",
                slot = 8,
            },            
        }
    }
}

addItemsToFoodList({
    ['gass_brownie'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(10,15),
        stressReduction = math.random(10,15)
    },
    ['gass_gummy'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(10,15),
        stressReduction = math.random(15,25)
    },
    ['gass_cookie'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(10,15),
        stressReduction = math.random(10,15)
    },
})
addItemsToDrinkList({
    ['gass_shot'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(5,10),
        stressReduction = math.random(25,35)
    },
})