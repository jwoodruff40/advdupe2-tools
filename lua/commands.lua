include "filesys.lua"

function ReadTable(dupe,tbl)
	return AdvDupe2.Decode(file.Read(dupe))
end

concommand.Add("ad2t_print", function(ply,cmd,args)
	local s, t, i = ReadTable("advdupe2/"..args[1]..".txt")
	PrintTable(t)
end)

concommand.Add("ad2t_decode", function(ply,cmd,args)
	local s, t, i = ReadTable("advdupe2/"..args[1]..".txt")
	CheckDir("ad2t/"..args[1])
	file.Write("ad2t/"..args[1].."info.txt", util.TableToJSON(i), true)
	file.Write("ad2t/"..args[1].."data.txt", util.TableToJSON(t), true)
end)

concommand.Add("ad2t_encode", function(ply,cmd,args)
	AdvDupe2.Encode(util.JSONToTable(file.Read("ad2t/"..args[1].."data.txt")),util.JSONToTable(file.Read("ad2t/"..args[1].."info.txt")),function(data)
		AdvDupe2.SendToClient(ply,data,0)
        end)
end)

