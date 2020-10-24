function ReadTable(dupe,tbl)
	local s,t,i =AdvDupe2.Decode(file.Read(dupe))
	if tbl =="t" then return t elseif tbl =="i" then return i else return {} end
end

concommand.Add("ad2t_print", function(ply,cmd,args)
	PrintTable(ReadTable("advdupe2/"..args[1]..".txt","t"))
end)

concommand.Add("ad2t_decode", function(ply,cmd,args)
	file.Write("ad2t/"..args[1]..".txt", util.TableToJSON((ReadTable("advdupe2/"..args[1]..".txt","t")), true))
end)

concommand.Add("ad2t_encode", function(ply,cmd,args)
	--[[
	AdvDupe2.Encode(util.JSONToTable(file.Read("ad2t/"..args[1]..".txt")),ReadTable("advdupe2/"..args[1]..".txt",i),function(data)
		AdvDupe2.SendToClient(ply,data,0)
	end)
	]]

	AdvDupe2.Encode(util.JSONToTable(file.Read("ad2t/"..args[1]..".txt")),AdvDupe2.GenerateDupeStamp(ply),function(data)
		AdvDupe2.SendToClient(ply,data,0)
        end)
end)

