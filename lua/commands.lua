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

	local sb, se = string.find("ad2t/"..args[1], "/[^/]+$", 1)
	local folder = string.sub("ad2t/"..args[1], 1, sb)
	CheckDir(folder)

	local wt = {info = i, data = t}
	file.Write("ad2t/"..args[1]..".txt", util.TableToJSON(wt, true))

	print("outputted to garrysmod/data/"..folder)
end)

concommand.Add("ad2t_encode", function(ply,cmd,args)
	args[2] = args[2] or args[1]
	args[3] = args[3] or false
	local base_dir =tobool(args[3]) and "advdupe2/" or "ad2t/"
	local rt = util.JSONToTable(file.Read("ad2t/"..args[1]..".txt"))
	
	AdvDupe2.Encode(rt.data,rt.info, function(encString) 
		file.Write(base_dir..args[2]..".txt",encString) 
	end)

	print("saved to "..base_dir..args[2])
end)
