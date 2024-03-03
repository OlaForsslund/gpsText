print("GPS loading started")
mediaprops = MediaIn1:GetData('MediaProps')
local mediaPath = tostring(mediaprops.MEDIA_PATH)
print(mediaPath)
path = mediaPath..".track"
gpsSamples = 0

-- Try to open track, if it dosen't exist, create it using exiftool and try to open it again
file, err = io.open(path, "r")
if not file then 	
	command = "exiftool -ee3 \"" .. mediaPath .. "\" > \""  .. path .. "\""
	print( "Extracting gps data: " .. command )
	os.execute( command )	
	file, err = io.open(path , "r")
end
if not file then
	print("Error using exiftool to create the file " .. path )    
else
	-- Load the gps data (track file)    
	gpsSpeed3d = {}
    gpsAltitude = {}
	-- Pattern to match lines containing "GPS Speed 3D : <number>"
	local patternSpeed3d  = "GPS%s+Speed%s+3D%s+:%s+([%-%d%.?%d*]+)"
	local patternAltitude =   "GPS%s+Altitude%s+:%s+([%-%d%.?%d*]+)"
	
    for line in file:lines() do
		-- Extract the number where it matches the pattern
		local number = line:match(patternSpeed3d)
		if number then			
			table.insert(gpsSpeed3d, tonumber(number))			
        else
            number = line:match(patternAltitude)
            if number then                
                table.insert(gpsAltitude, tonumber(number))
				gpsSamples = gpsSamples + 1
            end
        end
	end

	file:close()
end

-- Calculate the number of gps samples per frame
gpsRate = #gpsSpeed3d / mediaprops.MEDIA_NUM_FRAMES
print("Laded " .. gpsSamples .. " GPS samples")