include "filesys.lua"

function ReadTable(dupe)
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
	args[2] =args[2] or args[1]
	args[3] =args[3] or false
	base_dir =tobool(args[3]) and "advdupe2/" or "ad2t/"
	
	AdvDupe2.Encode(util.JSONToTable(file.Read("ad2t/"..args[1].."data.txt")),util.JSONToTable(file.Read("ad2t/"..args[1].."info.txt")),function(encString) file.Write(base_dir..args[2]..".txt",encString) end)
end)

