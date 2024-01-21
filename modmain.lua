local buildSpacing = GetModConfigData("build") or false
local deploySpacing = GetModConfigData("deploy") or false

if buildSpacing then
    for recipeName, recipe in pairs(GLOBAL.AllRecipes) do
        if recipe["min_spacing"] ~= nil then
            recipe["min_spacing"] = buildSpacing
        end
    end
end

if deploySpacing then
    local deployables = {
        boat_item = true,
        boat_grass_item = true
    }
    local spacingMap = {
        [0] = GLOBAL.DEPLOYSPACING["NONE"],
        [1] = GLOBAL.DEPLOYSPACING["MEDIUM"]
    }
    AddPrefabPostInitAny(function(inst)
        if not deployables[inst.prefab] then
            if inst.components.deployable ~= nil then
                inst.components.deployable:SetDeploySpacing(spacingMap[deploySpacing])
            end
        end
    end)
end

if GetModConfigData("GoThrough") then
    local buildings = {
        "pighouse",
        "rabbithouse",
        "mermhouse",
        "mermwatchtower",
        "dragonflyfurnace"
    }
    for _, building in ipairs(buildings) do
        AddPrefabPostInit(building, function(inst)
            if inst.Physics then
                inst.Physics:SetActive(false)
            end
        end)
    end
end