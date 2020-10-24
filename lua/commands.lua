function ReadTable(dupe)
	local s,t,i =AdvDupe2.Decode(file.Read(dupe))
	return t
end

concommand.Add("ad2t_print", function(ply,cmd,args)
	PrintTable(ReadTable(args[1])
end)

concommand.Add("ad2t_decode", function(ply,cmd,args)
	file.Write("ad2t/"..args[1], PrintTable(ReadTable(args[1])))
end)

--[[
concommand.Add("ad2t_encode", function(ply,cmd,args)

end)
]]
