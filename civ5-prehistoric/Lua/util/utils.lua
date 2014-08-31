-- utils
-- Author: carlos
-- DateCreated: 1/16/2014 6:28:02 AM
--------------------------------------------------------------

-- module "util"

logger.PREFIX = "util"

logger:info( "" )
logger:info( "__FILE__ util/utils" )






-- from IGE


-----------------------------------------------------------------------------
function Neighbors(plot)
  local i = 0
  local x = plot:GetX()
  local y = plot:GetY()
  return function()
    while true do
      if i > 5 then return nil end
      local neighbor = Map.PlotDirection(x, y, i)
      i = i + 1
      if neighbor then return neighbor end
    end
  end
end




-----------------------------------------------------------------------------
function Neighbors_Pre(plot, radius)

  



end







-----------------------------------------------------------------------------
local function GetClosestCity(player, plot)
  local newCity = nil;
  local newCityDist = 100000000;
    for city in player:Cities() do
    local dist = Map.PlotDistance(city:GetX(), city:GetY(), plot:GetX(), plot:GetY());
    if dist < newCityDist then
      newCity = city;
      newCityDist = dist
    end
    end
  return newCity;
end

-----------------------------------------------------------------------------
local function UpdateOwnership(plot)
  local owner = Players[plot:GetOwner()];
  if owner ~= nil then
    local city = plot:GetWorkingCity();

    if city and city:Plot() ~= plot then
      UpdateOwnershipForCityPlot(owner, city, plot);
    else
      plot:SetOwner(-1);
      plot:SetOwner(owner:GetID());
    end
  end
end

-----------------------------------------------------------------------------
local function RemoveOwnership(plot)
  local owner = Players[plot:GetOwner()];
  if owner ~= nil then
    local city = plot:GetWorkingCity();
    if city then
      RemoveOwnershipForCityPlot(city, plot);
    else
      plot:SetOwner(-1);
    end
  end
end

-----------------------------------------------------------------------------
local function AddOwnership(player, plot)
  if player ~= nil then
    local city = GetClosestCity(player, plot);
    local cityID = city and city:GetID() or -1;
    plot:SetOwner(player:GetID(), cityID, true, true);

    -- Reveal
    local playerTeamID = player:GetTeam();
    local hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
    Events.HexFOWStateChanged(hexpos, true, false);
    for neighbor in Neighbors(plot) do
      plot:SetRevealed(playerTeamID, true);
      plot:UpdateFog();
      hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
      Events.HexFOWStateChanged(hexpos, true, false);
    end
  end
end

-----------------------------------------------------------------------------
function CommitFogChanges()
  if #plotsToFog == 0 then return end
  print("commit fog changes")

  local pPlayer = Players[IGE.currentPlayerID];
  local playerTeamID = pPlayer:GetTeam();
  local width = Map.GetGridSize();
  local data = {};

  -- Init data with the current state
  for i = 0, Map.GetNumPlots()-1, 1 do
    local otherPlot = Map.GetPlotByIndex(i);
    data[i] = otherPlot:IsRevealed(playerTeamID, false);
  end

  -- Modify data
  for _, v in ipairs(plotsToFog) do
    local index = v:GetY() * width + v:GetX();
    data[index] = false;
  end

  -- Apply data
  FOW_SetAll(1);
  for i = 0, Map.GetNumPlots()-1, 1 do
    local plot = Map.GetPlotByIndex(i);
    plot:SetRevealed(playerTeamID, data[i]);
    plot:UpdateFog();
  end

  Game.UpdateFOW(true);
  UI:RequestMinimapBroadcast();
  plotsToFog = {};
end





--[[
My Notes:



-- print user data from TABLE in DATABASE (Lua Console State: Main_Pre)

> print(GameInfo.Units)
  Main_Pre: userdata: 17970CB0

> print(GameInfo.Units[2])
  Main_Pre: table: 179712B0

> print(GameInfo.Units[2].Type)
  Main_Pre: UNIT_WORKBOAT

> print(GameInfo.Units["UNIT_WORKBOAT"])
  Main_Pre: table: 179712B0

> print(GameInfo.Units["UNIT_WORKBOAT"].ID)
  Main_Pre: 2




-- list attributes for an OBJECT
for k, v in pairs(getmetatable(player).__index) do print(k) end
for k, v in pairs(getmetatable(unit).__index) do print(k) end
for k, v in pairs(getmetatable(city).__index) do print(k) end
for k, v in pairs(getmetatable(plot).__index) do print(k) end

-- and some example objects:
local plot = Map.GetPlot(0, 0)
local player = Players[0]
local unit = Players[0]:GetFirstReadyUnit()



-- list all TABLES in DATABASE
?? for k,v in pairs(GameInfo) do print(k) end



-- list column names from a TABLE
?? for k,v in pairs(GameInfo.Units) do print(k) end



-- list all current global DEFINES
for row in GameInfo.Defines() do print(row.Name .. " : " .. row.Value) end



-- list column values from a TABLE
for row in GameInfo.Units() do print(row.ID) end



-- list certain rows from TABLE
for row in GameInfo.Units{UnitType="UNITCLASS_WARRIOR"} do print(row.ID) end



-- list units for a player
for u in Players[0]:Units() do print(u:GetUnitType()) end



-- list or get cities from player
-- this is the only way that is working for me so far:
c = p:GetCityByID(0)



-- inital setup for testing
player =  Players[0]
team = player:GetTeam()
unit =  player:GetFirstReadyUnit()
x =  u:GetX()
plot = unit:GetPlot()




-- reload testing
Events.SerialEventUnitCreated.Count(SerialEvenUnitCreated_Pre)
Events.SerialEventUnitCreated.Remove(SerialEvenUnitCreated_Pre) 
FindCity = nil
UnitBuildingPromotion = nil
include("Units_Pre")




-- plots 
pl = Map.GetPlot( x, y )

plot:SetRevealed(team, false)
plot:UpdateFog()
plot:IsVisible()



--]]