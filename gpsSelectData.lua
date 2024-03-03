-- Select gps data matching this frame
i=math.floor( time*gpsRate )
speed=0
if( i < #gpsSpeed3d ) then
    speed = gpsSpeed3d[i]
end
if( i < #gpsAltitude ) then
    altitude = gpsAltitude[i]
end

-- Format the data
speed_ms = string.format("%5.1f", speed) 
speed_kmh = string.format("%5.1f", speed*3.6) 
altitude_m = string.format("%5.f", altitude)

self.StyledText=Text(speed_ms .. " m/s (" .. speed_kmh .. " km/h) " .. altitude_m .. " möh"  )