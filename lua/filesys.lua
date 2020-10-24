if !file.Exists("ad2t", "DATA") then
	file.CreateDir("ad2t")
end

function CheckDir(dir)
	if !file.Exists(dir, "DATA") then
	file.CreateDir(dir)
	end
end