print("GPS loading started")
mediaprops = MediaIn1:GetData('MediaProps')
local mediaPath = tostring(mediaprops.MEDIA_PATH)
print(mediaPath)
path = mediaPath..".track"

-- Try to open track, if not exist, try to create one using exiftool
file, err = io.open(path, "r")
if not file then
	command = "exiftool -ee3 " .. mediaPath .. ">" .. path
	os.execute( command )
	print( command )
	file, err = io.open(path , "r")
end
if not file then
	print("Error using exiftool to create the file " .. path )    
else
    print("Loaded track: " .. path)
	-- Initialize an array to store the numeric values
	gpsSpeed3d = {}
    gpsAltitude = {}
	-- Pattern to match lines containing "GPS Speed 3D : <number>"
	local patternSpeed3d = "GPS%s+Speed%s+3D%s+:%s+([%-%d%.?%d*]+)"
	local patternAltitude =  "GPS%s+Altitude%s+:%s+([%-%d%.?%d*]+)"
	
    for line in file:lines() do
		-- Match the pattern in the current line
		local number = line:match(patternSpeed3d)
		if number then
			-- Convert the matched number to a floating-point value and add it to the array
			table.insert(gpsSpeed3d, tonumber(number))
        else
            number = line:match(patternAltitude)
            if number then
                -- Convert the matched number to a floating-point value and add it to the array
                table.insert(gpsAltitude, tonumber(number))
            end
        end
	end

	file:close()
end


gpsHz=18.14
fps=tonumber(mediaprops.MEDIA_SRC_FRAME_RATE)

print("GPS loading ended")