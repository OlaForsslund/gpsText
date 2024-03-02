

i=math.floor( time*gpsHz/fps )
myvar=0
if( i < #gpsSpeed3d )
    myvar = gpsSpeed3d[i]
end

myvar="banan"
textArray={}

frameCount = self.Comp.GlobalEnd
print("frameCount" .. frameCount)
startFrame=0

for i = 1, frameCount do
    -- Customize the text for each frame as needed
    textArray[i] = "Frame " .. tostring(startFrame + i - 1)
end


frameCount = self.Comp.GlobalEnd
print("frameCount" .. frameCount)
myvar = MediaIn1.ClipName.Value

myvar = time

myvar = textArray[time]
self.StyledText=Text(myvar .. " / " .. self.Comp.GlobalEnd )