RegisterCommand("announce", function(source,args,raw) 
	--if IsPlayerAceAllowed(source,"command")then
		local scaleType, time, font = tonumber(args[1]), tonumber(args[2]), args[3]
		local extraArgs
		if tonumber(args[3]) then extraArgs = 3 else extraArgs = 2 end
		for i=1, extraArgs do table.remove(args, 1) end
		TriggerClientEvent("Scaleform:Announce", -1, scaleType, time, font, table.concat(args, " "))
	--end
end, false)

RegisterCommand("kickplayerforfxcontroller", function(source,args,raw) 
	--if IsPlayerAceAllowed(source,"command")then
		local id, reason = tonumber(args[1]), args[2]
		DropPlayer(id,reason)		
	--end
end, false)
