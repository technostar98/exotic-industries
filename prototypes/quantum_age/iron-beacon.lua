ei_data = require("lib/data")

--====================================================================================================
--IRON BEACON
--====================================================================================================

data:extend({
    {
        name = "ei_iron-beacon",
        type = "recipe-category",
    },
    {
        name = "ei_iron-beacon_slave",
        type = "recipe-category",
    },
    {
        name = "ei_iron-beacon",
        type = "item",
        icon = ei_graphics_item_path.."iron-beacon.png",
        icon_size = 64,
        subgroup = "module",
        order = "a-a-2",
        place_result = "ei_iron-beacon",
        stack_size = 10
    },
    {
        name = "ei_iron-beacon",
        type = "recipe",
        category = "crafting",
        energy_required = 6,
        ingredients =
        {
            {"ei_copper-beacon", 2},
            {"ei_steel-mechanical-parts", 30},
            {"ei_carbon-structure", 5},
            {"ei_superior-data", 20},
            {"ei_magnet", 8}
        },
        result = "ei_iron-beacon",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_iron-beacon",
    },
    {
        name = "ei_iron-beacon_slave",
        type = "recipe",
        category = "ei_iron-beacon_slave",
        energy_required = 1,
        ingredients = {},
        results = {},
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        icon = ei_graphics_other_path.."64_empty.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a",
    },
    {
        name = "ei_iron-beacon",
        type = "technology",
        icon = ei_graphics_tech_path.."iron-beacon.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-computer", "research-speed-5", "mining-productivity-3", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_iron-beacon"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_iron-beacon",
        type = "beacon",
        icon = ei_graphics_item_path.."iron-beacon.png",
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-upgradable"},
        max_health = 500,
        corpse = "big-remnants",
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = ei_data.colors.assembler,
        allowed_effects = {"speed", "consumption", "pollution"},
        minable = {
            mining_time = 1,
            result = "ei_iron-beacon",
        },
        distribution_effectivity = 0.25,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            --input_flow_limit = "400MW",
        },
        energy_usage = "5MW",
        module_specification = {
            module_slots = 12,
            module_info_icon_shift = {0, 0.5},
            module_info_multi_row_initial_height_modifier = -0.3,
        },
        supply_area_distance = 6,
        radius_visualisation_picture =
        {
            filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
            width = 10,
            height = 10,
        },
        graphics_set = {
            module_icons_suppressed = false,
        
            animation_list = {
                -- Beacon Base
                {
                    render_layer = "lower-object-above-shadow",
                    always_draw = true,
                    animation = {
                        layers = {
                            -- Base
                            {
                                filename = ei_graphics_entity_path.."iron-beacon.png",
                                width = 232,
                                height = 186,
                                shift = util.by_pixel(13, 1.5),
                                scale = 0.525
                            },
                            -- Shadow
                            {
                                filename = ei_graphics_entity_path.."beacon_shadow.png",
                                width = 116*2,
                                height = 93*2,
                                shift = util.by_pixel(13, 1.5),
                                draw_as_shadow = true,
                                scale = 0.5
                            }
                        }
                    }
                },
                -- Beacon Antenna
                {
                    render_layer = "object",
                    always_draw = true,
                    animation = {
                        layers = {
                            -- Base
                            {
                                filename = ei_graphics_entity_path.."copper-beacon_top-animation.png",
                                width = 54*2,
                                height = 50*2,
                                line_length = 8,
                                frame_count = 32,
                                animation_speed = 0.5,
                                shift = util.by_pixel(1, -57),
                                scale = 0.5
                            },
                            -- Shadow
                            {
                                filename = ei_graphics_entity_path.."beacon_top-shadow.png",
                                width = 63*2,
                                height = 49*2,
                                line_length = 8,
                                frame_count = 32,
                                animation_speed = 0.5,
                                shift = util.by_pixel(102.5, 17.5),
                                draw_as_shadow = true,
                                scale = 0.5
                            }
                        }
                    }
                }
            }
        }
    },
    {
        name = "ei_iron-beacon_slave",
        type = "assembling-machine",
        icon = ei_graphics_other_path.."64_empty.png",
        fixed_recipe = "ei_iron-beacon_slave",
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-blueprintable"},
        max_health = 300,
        corpse = "big-remnants",
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        --selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = {r=0, g=0, b=1, a=1},
        crafting_categories = {"ei_iron-beacon_slave"},
        crafting_speed = 1,
        energy_source = {
            type = "fluid",
            fluid_box = {
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_south_basic_insulated,
                pipe_connections =
                {
                  {type = "input-output", position = {-2, 0}},
                  {type = "input-output", position = {2, 0}},
                  {type = "input-output", position = {0, -2}},
                  {type = "input-output", position = {0, 2}}
                },
                production_type = "input-output",
                filter = "ei_liquid-nitrogen"
            },
            effectivity = 1,
            burns_fluid = true,
            scale_fluid_usage = true,
        },
        energy_usage = "6MW",
        --animation
        animation = {
            filename = ei_graphics_other_path.."64_empty.png",
            size = {64,64},
            scale = 1,
            line_length = 1,
            lines_per_file = 1,
            frame_count = 1,
            animation_speed = 1,
        }
    }
})