
local blueprints = {}



function blueprints.getItemStack(bpID)
    if global.blueprints.itemStacks[bpID] then
        return global.blueprints.itemStacks[bpID]
    end
    local inv = game.create_inventory(1)
    local itemStack = inv.find_empty_stack()
    if itemStack.import_stack(global.blueprints.strings[bpID]) == 0 then
        return itemStack
    end
end



return blueprints
