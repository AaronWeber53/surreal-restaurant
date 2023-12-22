
Config.JobList["burgershot"] = {
    name = "Burgershot",
    blip = {
        coords = vector3(-1197.32, -897.655, 13.995),
        sprite = 106,
        colour = 75
    },
    ["duty"] = {
        [1] = vector4(-1192.95, -898.51, 14.0, 33.64),
    },    
    ["trays"] = {
        ["burgertray1"] = {
            [1] = vector4(-1196.25, -895.1, 14.0, 132.16),
            [2] = vector4(-1197.38, -896.16, 14.0, 307.73),
        },
        ["burgertray2"] = {
            [1] = vector4(-1197.14, -893.87, 14.0, 118.59),
            [2] = vector4(-1198.37, -894.76, 14.0, 303.27),
        },
        ["burgertray3"] = {
            [1] = vector4(-1197.87, -892.61, 14.0, 123.81),
            [2] = vector4(-1199.23, -893.42, 14.0, 296.2),
        },     
    },
    ["cashregister"] = {
        [1] = vector4(-1193.93, -895.48, 14.0, 297.0),
        [2] = vector4(-1195.29, -893.6, 14.0, 294.21),
        [3] = vector4(-1196.65, -891.61, 14.0, 297.02),
        [4] = vector4(0 , 0 , 0, 0),
    },   
    ["fridge"] = {
        [1] = vector4(-1203.46, -891.7, 14.0, 306.52),
    },      
    ["storage"] = {
        [1] = vector4(-1197.33, -899.96, 14.0, 27.72),
    },
    ["garage"] = {
        [1] = vector4(-1171.87, -898.36, 13.81, 332.18),
    },
    ["vehicles"] = {
        ['stalion2'] = {
            name = "Stallion",
            description = "Declasse Burger Shot Stallion"
        }
    },
    ['kitchentask'] = {
        ["pattycooker"] = {
            closetext = "~g~E~w~ - Cook Patties",
            closedistance = 0.5,
            fartext = "Cook Patties",
            farDistance = 2.5,
            recipe = "patty",
            ["coords"] = {
                [1] = vector4(-1202.3, -896.96, 14.0, 118.59),
                [2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            }
        }, 
        ["fryer"] = {
            closetext = "~g~E~w~ - Fry Sum Fries",
            closedistance = 0.5,
            fartext = "Fry Sum Fries",
            farDistance = 2.5,
            recipe = "fries",
            ["coords"] = {
                [1] = vector4(-1201.14, -898.71, 14.0, 122.54),
            }
        }, 
        ["meal"] = {
            closetext = "~g~E~w~ - Make a Meal",
            closedistance = 0.5,
            fartext = "Make a Meal",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(-1198.69, -902.22, 14.0, 126.8),
            },
            ['menu'] = {
                {
                    header = "| Available Burgers |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Moneyshot Burger", "Bun , Cooked Patty , Tomato , Lettuce", "moneyshot"),
                recipeMenuEntry("• Meat Free Burger", "Bun , Tomato , Lettuce", "meatfree"),
                recipeMenuEntry("• Bleeder Burger", "Bun , Cooked Patty , Tomato , Lettuce", "bleeder"),
                recipeMenuEntry("• The Heart Stopper", "Bun , Cooked Patty , Tomato , Lettuce", "heartstopper"),
                recipeMenuEntry("• Torpedo Roll", "Bun , Cooked Meat", "torpedoroll"),
                recipeMenuEntry("• Murder Meal", "The Heart Stopper, Fries and SoftDrink", "murdermeal"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }
        }, 
        ["drinks"] = {
            closetext = "~g~E~w~ -  Make Drinks",
            closedistance = 0.5,
            fartext = "Make Drinks",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(-1198.62, -895.56, 14.0, 115.28),
                [2] = vector4(-1199.15, -894.55, 14.0, 128.57),
            },
            ['menu'] = {
                {
                    header = "| Drink Menu |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Soft Drink", "Soda Syrup", "softdrink"),
                recipeMenuEntry("• Milkshake", "Milkshake Formula", "mshake"),
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
        ['patty'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "You cooked the meat",
            cooklabel = "Cooking the Patty..",
            ['useditems'] = {
                [1] = {
                    name = "burger-raw",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-meat",
                    quantity = 1
                }
            },
        },
        ['fries'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "You made 4 fries",
            cooklabel = "Frying the fries..",            
            ['useditems'] = {
                [1] = {
                    name = "burger-potato",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-fries",
                    quantity = 4
                }
            },
        },
        ['softdrink'] ={
            anim = nil,
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Soda",
            cooklabel = "Filling a cup..",            
            ['useditems'] = {
                [1] = {
                    name = "burger-sodasyrup",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-softdrink",
                    quantity = 1
                }
            },
        },
        ['mshake'] ={
            anim = nil,
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Milkshake",
            cooklabel = "Filling up a cup..",            
            ['useditems'] = {
                [1] = {
                    name = "burger-mshakeformula",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-mshake",
                    quantity = 1
                }
            },
        },

        -- Build burgers
        ['moneyshot'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a MoneyShot Burger",
            cooklabel = "Making Burgers..",
            ['useditems'] = {
                [1] = {
                    name = "burger-meat",
                    quantity = 1
                },
                [2] = {
                    name = "burger-lettuce",
                    quantity = 1
                },
                [3] = {
                    name = "burger-bun",
                    quantity = 1
                },
                [4] = {
                    name = "burger-tomato",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-moneyshot",
                    quantity = 1
                }
            },        
        },
        ['meatfree'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Meat Free Burger",
            cooklabel = "Making A Meat Free Burger..",
            ['useditems'] = {
                [1] = {
                    name = "burger-bun",
                    quantity = 1
                },
                [2] = {
                    name = "burger-tomato",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-meatfree",
                    quantity = 1
                }
            },        
        },
        ['bleeder'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Bleeder Burger",
            cooklabel = "Making Burgers..",
            ['useditems'] = {
                [1] = {
                    name = "burger-bun",
                    quantity = 1
                },
                [2] = {
                    name = "burger-tomato",
                    quantity = 1
                },
                [3] = {
                    name = "burger-lettuce",
                    quantity = 1
                },
                [4] = {
                    name = "burger-meat",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-bleeder",
                    quantity = 1
                }
            },        
        },
        ['heartstopper'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Heart Stopper",
            cooklabel = "Making Burgers..",
            ['useditems'] = {
                [1] = {
                    name = "burger-bun",
                    quantity = 1
                },
                [2] = {
                    name = "burger-tomato",
                    quantity = 1
                },
                [3] = {
                    name = "burger-lettuce",
                    quantity = 1
                },
                [4] = {
                    name = "burger-meat",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-heartstopper",
                    quantity = 1
                }
            },        
        },
        ['torpedoroll'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a Torpedo Roll",
            cooklabel = "Making A Torpedo..",
            ['useditems'] = {
                [1] = {
                    name = "burger-bun",
                    quantity = 1
                },
                [2] = {
                    name = "burger-meat",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-torpedo",
                    quantity = 1
                }
            },        
        },
        ['murdermeal'] = {
            anim = recipeFillOrderAni(),
            prop = nil,
            cooktime = 4, -- seconds
            finishmessage = "You made a A Murder Meal",
            cooklabel = "Making A Murder Meal..",
            ['useditems'] = {
                [1] = {
                    name = "burger-fries",
                    quantity = 1
                },
                [2] = {
                    name = "burger-softdrink",
                    quantity = 1
                },
                [3] = {
                    name = "burger-heartstopper",
                    quantity = 1
                }

            },
            ['receiveditems'] = {
                [1] = {
                    name = "burger-murdermeal",
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
                name = "burger-bun",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "burger-raw",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "burger-tomato",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "burger-lettuce",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "burger-potato",
                price = 0,
                amount = 2,
                info = {},
                type = "item",
                slot = 5,
            },
            [6] = {
                name = "burger-mshakeformula",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 6,
            },
            [7] = {
                name = "burger-sodasyrup",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 7,
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
addItemsToDrinkList({
    ['burger-mshake'] = {
        increase = math.random(40,50)
    },
    ['burger-softdrink'] = {
        increase = math.random(40,50)
    },
})
addItemsToCombinedList({
    items = {
        ['burger-murdermeal'] = {
            ['burger-murdermeal'] = 1,
            ['burger-heartstopper'] = 1,
            ['burger-softdrink'] = 1,
            ['burger-fries'] = 1,
        },
    },
    extraFunc = function(func)
        if randomToy < 4 then
			--QBCore.Functions.Notify("No toy in Box Looool", "error")
		elseif randomToy == 4 then
            func("burger-toy1", 1)
		elseif randomToy < 10 and randomToy > 4 then
			--QBCore.Functions.Notify("No toy in Box Looool", "error")
		elseif randomToy == 10 then
            func("burger-toy2", 1)
		else
            --QBCore.Functions.Notify("No toy in Box Looool", "error")
        end
    end
})