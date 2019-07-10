local realhash = "Changethispart"

RegisterCommand("announce", function(source, args, raw) 
    local hash = args[1] 
    if hash == realhash then    
    local scaleType, time, font = tonumber(args[2]), tonumber(args[3]), args[4]
    local extraArgs
    if tonumber(args[4]) then
        extraArgs = 4
    else
        extraArgs = 3
    end
    for i = 1, extraArgs do table.remove(args, 1) end
    TriggerClientEvent("Scaleform:Announce", -1, scaleType, time, font,
                       table.concat(args, " "))
    end
end, false)

RegisterCommand("kickplayerforfxcontroller", function(source, args, raw)
    -- if IsPlayerAceAllowed(source,"command")then
    local hash, id = args[1], tonumber(args[2])
    local reason = string.gsub(raw, args[1], "")
    reason = string.gsub(reason, args[2], "")
    reason = string.gsub(reason, "kickplayerforfxcontroller", "")
    if realhash == hash then DropPlayer(id, reason) end
end, false)
