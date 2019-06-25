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



 --Deneme amaçlı
RegisterCommand("kickplayerforfxcontroller", function(source,args,raw)
	local Source = args[1]
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', args[1], function(target)
			TriggerEvent('es:canGroupTarget', user.getGroup(), groupsRequired[args[2]], function(available)
				TriggerEvent('es:canGroupTarget', user.getGroup(), target.getGroup(), function(canTarget)
					if canTarget and available then
						if args[2] == "ban" then
							local id
							local ip
							for k,v in ipairs(GetPlayerIdentifiers(source))do
								if string.sub(v, 1, string.len("steam:")) == "steam:" then
									permBanUser("Qadir", v)
								elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
									permBanUser("Qadir", v)
								end
							end

							DropPlayer(id, GetConvar("es_admin_banreason", "You were banned from this server"))
						end
					else
						if not available then
							TriggerClientEvent('chat:addMessage', Source, {
								args = {"^1SYSTEM", "You do not have permission to do this"}
							})
						else
							TriggerClientEvent('chat:addMessage', Source, {
								args = {"^1SYSTEM", "You do not have permission to do this"}
							})
						end
					end
				end)
			end)
		end)
	end)
end)

function permBanUser(bannedBy, id)
	bannedTable[id] = {
		banner = bannedBy,
		reason = "Permanently banned from this server",
		expire = 0
	}

	SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedTable), -1)
end
