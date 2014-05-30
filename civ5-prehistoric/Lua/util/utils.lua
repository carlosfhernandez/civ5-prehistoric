-- utils
-- Author: carlos
-- DateCreated: 1/16/2014 6:28:02 AM
--------------------------------------------------------------

-- module "util"

logger.PREFIX = "util"

logger:info( "" )
logger:info( "__FILE__ util/utils" )



--[[
My Notes:


How to get function names for other game objects

local plot = Map.GetPlot(0, 0)
print("Attributes:")
for k, v in pairs(getmetatable(plot).__index) do print(k) end
print("End attributes.");

for k, v in pairs(getmetatable(player).__index) do print(k) end
for k, v in pairs(getmetatable(unit).__index) do print(k) end
for k, v in pairs(getmetatable(city).__index) do print(k) end


-- list units for a player
for u in iPlayer:Units() do print(u:GetUnitType()) end


p = Players[0]
u = p:GetFirstReadyUnit()
u:GetX()
pl = u:GetPlot()


Events.SerialEventUnitCreated.Count(SerialEvenUnitCreated_Pre)
Events.SerialEventUnitCreated.Remove(SerialEvenUnitCreated_Pre) 
FindCity = nil
include("Units_Pre")





--]]