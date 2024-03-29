local function e_or_z(en, zh)
	return (locale == "zh" or locale == "zhr" or locale == "zht") and zh or en
end

name = e_or_z("No Spacing", "建造无间距")
author = 'OpenSource'
version = '1.0.4'
description = e_or_z(
    [[
Deploy all things with no spacing. 
By default, all functions are turned on. Please turn off the function yourself.
Remove building physics for Specific Buildings (Pig House, Rabbit Hutch, Mermhouse, Mermhouse Fortress, Dragonfly Furnace)
Please turn off Geometric Placement
    ]],
    [[
建造无间距
默认全部打开，请自己酌情关闭。
移除部分建筑(猪屋,兔屋,鱼人房,鱼人堡垒,龙蝇火炉)的碰撞体积。
需要关闭几何建筑学。
    ]]
)
	
forumthread = ""
	
api_version = 10

icon_atlas = 'modicon.xml'
icon = 'modicon.tex'

dst_compatible = true
client_only_mod = false
all_clients_require_mod = true

priority = 99

local function AddConfig(label, name, hover, options, default)
	return {
		label = label,
		name = name,
		hover = hover or '',
		options = options or {
            {description = e_or_z('No spacing', '无间距'), data = 0, hover = e_or_z('No spacing', '没有间距')},
			{description = e_or_z('Small', '小间距'), data = 1, hover = e_or_z('Small spacing', '有较小间距')},
			{description = e_or_z('Default', '默认'), data = false, hover = e_or_z('Default spacing', '默认间距')}
		},
		default = default
	}
end

configuration_options =
{
    AddConfig(e_or_z("Building", "建造类"), "build", "", nil, 0),
    AddConfig(e_or_z("Deploy and Planting", "放置 & 种植类"), "deploy", "", nil, 0),
    AddConfig(
        e_or_z("Specific Buildings", "部分建筑"),
        "GoThrough",
        e_or_z("Pig House, Rabbit Hutch, Mermhouse, Mermwatchtower, Dragonfly Furnace", "猪屋,兔屋,鱼人房,鱼人堡垒,龙蝇火炉"),
        {
            {description = e_or_z("No spacing", "无间距"), data = true, hover = e_or_z("No spacing", "没有间距")},
            {description = e_or_z("Default", "默认"), data = false, hover = e_or_z("Default spacing", "默认间距")}
        },
        true
    )
}