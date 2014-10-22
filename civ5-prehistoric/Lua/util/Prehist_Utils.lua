-- utils
-- Author: carlos
-- DateCreated: 1/16/2014 6:28:02 AM
--------------------------------------------------------------

-- module "util"

logger.PREFIX = "util"

logger:info( "" )
logger:info( "__FILE__ util/utils" )








-- GENERIC UTILITIES


--
-- L
--
function L(str, ...)
  if str == nil then return "???" end
  if type(str) ~= "string" then return tostring(str) end
  return Locale.ConvertTextKey(str, ...); -- Locale.Lookup
end

--
-- tostr
--
function tostr(x)
  if x == nil then
    return "nil";
  elseif type(x) == "boolean" then
    return (x and "true" or "false");
  elseif type(x) == "string" then
    return '"'..x..'"';
  elseif type(x) == "number" then
    return tostring(x);
  else
    return "...";
  end
end





















-- SPECIFIC UTILITIES






















-- PLOT AND FOW


--
--
--
function UpdateOwnership_( plot )
  local owner = Players[plot:GetOwner()];
  if owner ~= nil then
    local city = plot:GetWorkingCity();

    if city and city:Plot() ~= plot then
      UpdateOwnershipForCityPlot( owner, city, plot );
    else
      plot:SetOwner(-1);
      plot:SetOwner(owner:GetID());
    end
  end
end

--
--
--
function UpdateOwnershipForCityPlot_( player, city, plot )
  if city:IsWorkingPlot(plot) then
    city:AlterWorkingPlot(city:GetCityPlotIndex(plot));
  end

  plot:SetOwner(-1);
  plot:SetOwner(player:GetID(), city:GetID(), true, true);
  city:DoTask(TaskTypes.TASK_CHANGE_WORKING_PLOT, 0, -1);

end

--
--
--
function TakePlot( player, plot )

  if player ~= nil then
    local city = GetClosestCity(player, plot)
    local cityID = city and city:GetID() or -1
    plot:SetOwner(player:GetID(), cityID, true, true)

    local playerTeamID = player:GetTeam()
    FOWUpdateNeighbors( plot, playerTeamID )
  end

end

--
-- FOWUpdateNeighbors
--
function FOWUpdateNeighbors( plot, playerTeamID )

  local hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
  Events.HexFOWStateChanged(hexpos, true, false);
  for neighbor in Neighbors(plot) do
    plot:SetRevealed(playerTeamID, true)
    plot:UpdateFog()
    hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
    Events.HexFOWStateChanged(hexpos, true, false)
  end

end

--
-- GetClosestCityAny
--
-- @param {Player} player
-- @param {Plot} plot
--
-- Get the closest city to a *plot*. The city can be very far away and there is
-- no limit to the distance.
--
function GetClosestCityAny( player, plot )
  local newCity = nil
  local newCityDist = 100000000
    for city in player:Cities() do
      local dist = Map.PlotDistance(city:GetX(), city:GetY(), plot:GetX(), plot:GetY())
      if dist < newCityDist then
        newCity = city
        newCityDist = dist
      end
    end
  return newCity
end

--
-- GetClosestCityByRadius
--
-- @param {Plot} plotstart
-- @param {Int} radius
--
-- get home city hack kluge dirty rotten attempt because I can't find the
-- right way to get this. this won't work 100%, either, because I am only
-- checking for the closes city within an X-radius (default=2). 
--
-- THere is potential problem if your city is surrounded by units when the
-- new dummy unit built and gets placed somwhere far away that is closer
-- to another city.
--
-- All this kluging around is ugly. I may try to figure out a way to ensure
-- this unit can stack into the city regardless of what is there.
--
-- TODO: ANY HELP WOULD BE APPRECIATED
--
function GetClosestCityByRadius( plotStart, radius )

  local x = plotStart:GetX();
  local y = plotStart:GetY();
  local r = radius;
  local bCity = plotStart:IsCity();
  local bCityRadius = plotStart:IsCityRadius();
  local bCityPlayerRadius = plotStart:IsPlayerCityRadius();
  logger:debug( "IsCityRadius: " .. ( bCityRadius and "true" or "false" ) );
  logger:debug( "IsPlayerCityRadius: " .. ( bCityPlayerRadius and "true" or "false" ) );
  local city = plotStart:GetPlotCity();
  local plot = plotStart;

  if not city then
    for dx = -r, r do
      for dy = -r, r do
        plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, r);
        if plot then
          local plot_location_debug = "[ " .. x .. " x " .. y .. "   " .. dx .. " x " .. dy .. "]";
          -- logger:debug( "check plot location: " ..  plot_location_debug );
          if plot:IsCity() then
            city = plot:GetPlotCity();
            break;
          end
        end -- if plot
      end -- for x
      if city then break end;
    end -- for y
  end -- if not city

  -- debug section -- lots of debug, some of it to find out what certain function do
  if city then
    logger:debug( "[FindCity] " )
    logger:debug( "[FindCity] city found!" );
    local cityID = city:GetID();
    local player = city:GetOwner();
    local cityPlayerRadiusCount = plot:GetPlayerCityRadiusCount(player);
    local cityRadiusCount = plot:GetCityRadiusCount(player);
    local workingCity = plot:GetWorkingCity();
    logger:debug( "[FindCity] city id: " .. cityID );
    logger:debug( "[FindCity] city owner: " .. player );
    logger:debug( "[FindCity] cityRadiusCount: " .. cityRadiusCount );
    logger:debug( "[FindCity] cityPlayerRadiusCount: " .. cityPlayerRadiusCount );
  else
    logger:debug( "[FindCity] " )
    logger:debug( "[FindCity] city *NOT* found!" )
  end
  -- end debug section

  return city;

end

--
-- NeighborPlots
--
function NeighborPlots( plot )
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

--
-- NeighborPlots2
--
function NeighborPlots2( plot, radius )





end

--
-- CommitFogChanges_
--
function CommitFogChanges_()
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



































-- BUILDINGS


--
--
--
function UpdateBuildingList_( buildings, manager, instance, prefix )
  for _, v in ipairs(buildings) do
    local count = currentCity:GetNumRealBuilding(v.ID);
    v.label = (count > 1) and prefix..v.name.." x"..count or v.name;
    v.enabled = currentCity:CanConstruct(v.ID, 1, 1, 1) or count ~= 0;
    v.selected = count ~= 0;
  end

  UpdateHierarchizedList(buildings, manager, BuildingClickHandler);
end


















--[[
My Notes:








-- list ATTRIBUTES for an OBJECT
for k, v in pairs(getmetatable(player).__index) do print(k) end
for k, v in pairs(getmetatable(unit).__index) do print(k) end
for k, v in pairs(getmetatable(city).__index) do print(k) end
for k, v in pairs(getmetatable(plot).__index) do print(k) end

-- and some example objects:
local plot = Map.GetPlot(0, 0)
local player = Players[0]
local unit = Players[0]:GetFirstReadyUnit()


-- list ALL TABLES in DATABASE
?? for k,v in pairs(GameInfo) do print(k) end


-- list COLUMN NAMES from a TABLE
?? for k,v in pairs(GameInfo.Units) do print(k) end


-- list COLUMN VALUES from a TABLE
for row in GameInfo.Units() do print(row.ID) end


-- list FILTERED ROWS from TABLE
for row in GameInfo.Units{UnitType="UNITCLASS_WARRIOR"} do print(row.ID) end




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




-- list all current global DEFINES
for row in GameInfo.Defines() do print(row.Name .. " : " .. row.Value) end


-- list units for a player
for u in Players[0]:Units() do print(u:GetUnitType()) end


-- list or get cities from player
-- this is the only way that is working for me so far:
c = p:GetCityByID(0)



-- inital setup for testing
player =  Players[0]; team = player:GetTeam(); unit =  player:GetFirstReadyUnit(); x =  u:GetX(); plot = unit:GetPlot(); city =    player:GetCityByID(0)
player =  Players[0]
team =    player:GetTeam()
unit =    player:GetFirstReadyUnit()
x =       u:GetX()
plot =    unit:GetPlot()
city =    player:GetCityByID(0) -- this may not work - only way I can get a city right now



-- reload testing
Events.SerialEventUnitCreated.Count(SerialEvenUnitCreated_Pre)
Events.SerialEventUnitCreated.Remove(SerialEvenUnitCreated_Pre) 
FindCity = nil
UnitBuildingPromotion = nil
include("Units_Pre")




-- plots 
pl = Map.GetPlot( x, y )

pl:SetRevealed(team, false)
pl:UpdateFog()
pl:IsVisible()



--]]