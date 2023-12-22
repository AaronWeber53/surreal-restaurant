Config.JobList["molinottis"] = {
    name = "Molinotti's",
    blip = {
        coords = vector3(-1183.16, -1410.12, 4.49),
        sprite = 78,
        colour = 1,
        scale = 0.75
    },
    ["duty"] = {
        [1] = vector4(-1188.08, -1388.13, 4.66, 205.13),
    },    
    ["cashregister"] = {
        [1] = vector4(-1186.33, -1397.96, 4.47, 217.92),
    },   
    ["fridge"] = {
        [1] = vector4(-1198.49, -1402.26, 4.47, 115.7),
    },      
    ["storage"] = {
        [1] = vector4(-1188.46, -1386.57, 4.67, 27.51),
        [2] = vector4(-1190.36, -1387.92, 4.61, 48.54),
    },
    ["garage"] = {
        [1] = vector4(-1175.07, -1374.62, 4.96, 110.62),
    },
    ['kitchentask'] = {
        ["oven"] = {
            closetext = "~g~E~w~ - Cooking Equiptment",
            closedistance = 0.75,
            fartext = "Cooking Equiptment",
            farDistance = 2.5,
            ["coords"] = {
                [1] = vector4(-1195.62, -1392.04, 4.47, 31.06),
                [2] = vector4(-1199.29, -1394.74, 4.47, 35.73),    
                [3] = vector4(-1194.44, -1391.27, 4.47, 29.16),    
                [4] = vector4(-1200.5, -1395.51, 4.47, 34.84),    
                [5] = vector4(-1196.95, -1393.02, 4.47, 30.04),
            },
            ['menu'] = {
                {
                    header = "| Cooking Items |",
                    isMenuHeader = true
                },
                recipeMenuEntry("• Spaghetti", "1 pasta, 1 sauce, 1 italianspices, 1 cheese, ", "spaghetti"),
                recipeMenuEntry("• Lasagna", "3 pasta, 2 sauce, 2 cheese, 2 italianspices", "lasagna"),
                recipeMenuEntry("• Pizza", "3 flour, 2 egg, 1 butter, 2 cheese, 2 sauce", "pizza"),
                recipeMenuEntry("• Chicken Parmesan", "1 rawchicken, 1 pasta, 1 sauce, 1 cheese 1 italianspices", "chickenparm"),
                recipeMenuEntry("• Cannoli", "1 flour, 1 egg, 1 butter, 1 sugar, 1 chocolate", "cannoli"),
                {
                    header = "• Close Menu",
                    txt = "", 
                    params = { 
                        event = "qb-menu:client:closeMenu"
                    }
                },        
            }
        },
        ["wineglass"] = {
            closetext = "~g~E~w~ - Pour a glass of wine",
            closedistance = 0.5,
            fartext = "Pour a glass of wine",
            farDistance = 2.5,
            recipe = "wineglass",
            ["coords"] = {
                [1] = vector4(-1193.83, -1403.45, 4.47, 232.01),
                --[2] = vector4(-1199.96, -900.52, 14.0, 122.91),    
            }
        },         
    },
    ['recipes'] = {
        ['spaghetti'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Spaghetti is ready",
            cooklabel = "Cooking the Spaghetti..",
            ['useditems'] = {
                [1] = {
                    name = "pasta",
                    quantity = 1
                },
                [2] = {
                    name = "sauce",
                    quantity = 1
                },
                [3] = {
                    name = "italianspices",
                    quantity = 1
                },
                [4] = {
                    name = "cheese",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "spaghetti",
                    quantity = 1
                }
            },
        },
        ['lasagna'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "lasagna is baked",
            cooklabel = "Baking the lasagna..",
            ['useditems'] = {
                [1] = {
                    name = "pasta",
                    quantity = 3
                },
                [2] = {
                    name = "sauce",
                    quantity = 2
                },
                [3] = {
                    name = "cheese",
                    quantity = 2
                },
                [4] = {
                    name = "italianspices",
                    quantity = 2
                },
            },
            ['receiveditems'] = {
                [1] = {
                    name = "lasagna",
                    quantity = 1
                }
            },
        },
        ['pizza'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "The pizza is ready",
            cooklabel = "Baking the pizza..",
            ['useditems'] = {
                [1] = {
                    name = "flour",
                    quantity = 3
                },
                [2] = {
                    name = "butter",
                    quantity = 1
                },
                [3] = {
                    name = "egg",
                    quantity = 2
                },
                [4] = {
                    name = "sauce",
                    quantity = 2
                },
                [5] = {
                    name = "cheese",
                    quantity = 2
                },
            },
            ['receiveditems'] = {
                [1] = {
                    name = "pizza",
                    quantity = 1
                }
            },
        },
        ['chickenparm'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Chicken Parmesan finished",
            cooklabel = "Making the Chicken Parmesan..",
            ['useditems'] = {
                [1] = {
                    name = "rawchicken",
                    quantity = 1
                },
                [2] = {
                    name = "pasta",
                    quantity = 1
                },
                [3] = {
                    name = "sauce",
                    quantity = 1
                },
                [4] = {
                    name = "cheese",
                    quantity = 1
                },
                [5] = {
                    name = "italianspices",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "chickenparm",
                    quantity = 1
                }
            },
        },
        ['cannoli'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Cannoli finished",
            cooklabel = "Making the cannoli..",
            ['useditems'] = {
                [1] = {
                    name = "flour",
                    quantity = 1
                },
                [2] = {
                    name = "egg",
                    quantity = 1
                },
                [3] = {
                    name = "butter",
                    quantity = 1
                },
                [4] = {
                    name = "sugar",
                    quantity = 1
                },
                [5] = {
                    name = "chocolate",
                    quantity = 1
                }
            },
            ['receiveditems'] = {
                [1] = {
                    name = "cannoli",
                    quantity = 4
                }
            },
        },
        ['champagneglass'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Glass of Champagne",
            cooklabel = "Pouring the glass..",
            ['useditems'] = {
                [1] = {
                    name = "champagne",
                    quantity = 1
                },
            },
            ['receiveditems'] = {
                [1] = {
                    name = "glassofwine",
                    quantity = 5
                }
            },
        },     
        ['wineglass'] ={
            anim = recipeCookAni(),
            prop = recipeCookProp(),
            cooktime = 4, -- seconds
            finishmessage = "Glass of Wine",
            cooklabel = "Pouring the glass..",
            ['useditems'] = {
                [1] = {
                    name = "winebottle2",
                    quantity = 1
                },
            },
            ['receiveditems'] = {
                [1] = {
                    name = "glassofwine",
                    quantity = 5
                }
            },
        },        
    },
    ['items'] = {
        label = "Shop",
        slots = 10,
        items = {
            [1] = {
                name = "flour", 
                price = 4,
                amount = 50,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "egg", 
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "chocolate", 
                price = 3,
                amount = 50,
                info = {},
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "sugar",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "butter",
                price = 3,
                amount = 50,
                info = {},
                type = "item",
                slot = 5,
            },            
            [6] = {
                name = "cheese",
                price = 4,
                amount = 50,
                info = {},
                type = "item",
                slot = 6,
            },
            [7] = {
                name = "pasta",
                price = 2,
                amount = 50,
                info = {},
                type = "item",
                slot = 7,
            },
            [8] = {
                name = "rawchicken",
                price = 8,
                amount = 50,
                info = {},
                type = "item",
                slot = 8,
            },   
            [9] = {
                name = "italianspices",
                price = 2,
                amount = 50,
                info = {},
                type = "item",
                slot = 9,
            },  
            [10] = {
                name = "sauce",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 10,
            },   
            [11] = {
                name = "cigar", 
                price = 20,
                amount = 50,
                info = {},
                type = "item",
                slot = 11,
            },     
            [12] = {
                name = "winebottle2", 
                price = 100,
                amount = 50,
                info = {},
                type = "item",
                slot = 12,
            },
            [13] = {
                name = "champagne", 
                price = 200,
                amount = 50,
                info = {},
                type = "item",
                slot = 13,
            },           
        },
    },
}

addItemsToFoodList({
    ['spagetti'] = {
        increase = math.random(10, 25),
        stressReduction = math.random(1,5)
    },
    ['lasagna'] = {
        increase = math.random(10, 25),
        stressReduction = math.random(1,5)
    },
    ['pizza'] = {
        increase = math.random(10, 25),
        stressReduction = math.random(1,5)
    },
    ['chickenparm'] = {
        increase = math.random(10, 25),
        stressReduction = math.random(1,5)
    },
    ['cannoli'] = {
        increase = math.random(10, 25),
        stressReduction = math.random(1,5)
    },
    
})
addItemsToDrinkList({
    ['winebottle2'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(10,15),
        stressReduction = math.random(10,15)
    },
    ['champagne'] = {
        increase = math.random(10, 25),
        effectDelay = math.random(10,15),
        stressReduction = math.random(10,15)
    },
})