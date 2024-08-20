
local railways = {
    itemStackSelector = {}
}



railways.itemStackSelector["T junctions"] = function(chunkCoords)
    local yStep = global.config.freeRailways.railGridBlockRadius * 2 + 2
    local alt = chunkCoords.y % (2 * yStep) >= yStep
    if chunkCoords.y % yStep == 0 then
        local xStep = global.config.freeRailways.railGridBlockRadius + 1
        if chunkCoords.x % xStep == 0 then
            -- some kind of T junction
            local n = 0
            if alt then
                n = xStep
            end
            if chunkCoords.x % (2 * xStep) == n then
                -- downward T junction
                return global.blueprints.itemStacks.railsTDownward
            else
                -- upward T junction
                return global.blueprints.itemStacks.railsTUpward
            end
        else
            -- horizontal segment
            return global.blueprints.itemStacks.railsIHorizontal
        end
    else
        local xStep = yStep
        local n = 0
        if alt then
            n = yStep / 2
        end
        if chunkCoords.x % xStep == n then
            -- vertical segment
            return global.blueprints.itemStacks.railsIVertical
        end
    end
end

railways.itemStackSelector["X junctions"] = function(chunkCoords)
    local yStep = global.config.freeRailways.railGridBlockRadius * 2 + 2
    local xStep = yStep
    if chunkCoords.y % yStep == 0 then
        if chunkCoords.x % xStep == 0 then
            -- X junction
            return global.blueprints.itemStacks.railsX
        else
            -- horizontal segment
            return global.blueprints.itemStacks.railsIHorizontal
        end
    else
        -- vertical segment
        if chunkCoords.x % xStep == 0 then
            return global.blueprints.itemStacks.railsIVertical
        end
    end
end



function railways.getItemStack(chunkCoords)
    local selector = railways.itemStackSelector[global.config.freeRailways.railGridType]
    if selector then
        return selector(chunkCoords)
    end
    log("ERROR: Unrecognized rail grid type: " .. global.config.freeRailways.railGridType)
end

function railways.buildRails(chunkCoords)
    local itemStack = railways.getItemStack(chunkCoords)

end



return railways
