-- store prototypes for age techs here to use them in control scripting

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--AGE TECHS
--====================================================================================================

local science = ei_data.science

data:extend({
    {
        name = "ei_temp",
        type = "technology",
        icon = ei_graphics_path.."graphics/128_placeholder.png",
        icon_size = 128,
        prerequisites = {

        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_dark-age",
        type = "technology",
        icon = ei_graphics_tech_path.."dark-age.png",
        icon_size = 128,
        prerequisites = {

        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 10
        },
        enabled = true,
        visible_when_disabled = true,
    },
    {
        name = "ei_steam-age",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {
            "ei_dark-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 20
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_electricity-age",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {
            "ei_steam-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["electricity-age"],
            time = 30
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_computer-age",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {
            "ei_electricity-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["steam-age"],
            time = 40
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_quantum-age",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {
            "ei_computer-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["computer-age"],
            time = 50
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_exotic-age",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {
            "ei_quantum-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["quantum-age"],
            time = 60
        },
        enabled = false,
        visible_when_disabled = true,
    },


    -- dummy techs to have all of their age as prerequisites for storage of "age-marks"
    {
        name = "ei_steam-age:dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_electricity-age:dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_computer-age:dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_quantum-age:dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_exotic-age:dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
})

-- if in dev mode unhidde dummy techs
if ei_mod.dev_mode == true then

    for _, tech in pairs(data.raw.technology) do
        if string.find(tech.name, ":dummy") then
            tech.hidden = false
        end
    end
    
end