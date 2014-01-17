-- Buildings
-- Author: carlos
-- DateCreated: 1/9/2014 4:57:20 PM
--------------------------------------------------------------------------------

--[[

--------------------------------------------------------------------------------
float error kept giving me 41.99999999999999999
--------------------------------------------------------------------------------

HasXXXWithinCityBorders -- Explanation, Reasonings, Thoughts, Questions

Determines if certain _things_ are within the city borders. These things are
anything that the game currently does not have a check for. As an example,
worked resources are checked by adding an entry in the XML (Table), 
"Building_LocalResourceOrs" and "Building_LocalResourceAnds". These two
create a requirement for "worked" resources. 

There are other programmable prerequesites for buildings such as:
- other buildings
- technologues
- general empire resource amounts
- global instances
- per player instances

I did not find a few of the prerequestites checking that I needed, so I am 
starting to build it. 

This is where I need the community's help. Am I duplicating work? Do these 
checks already exist in the game? Is there already a somewhat-standard library
that everyone uses for some of these preqrequisite checks?  I would love to find
out and I will post at the forums. In the meantime, this is my aim:

For Cities:
- HasFeatureWithinCityBorders(feature)
- HasTerrainWithinCityBorders(terrain)
- HasFeatureInRadius(feature, radius)
- HasTerrainInRadius(terrain, radius)
- HasConnectedResource(resource)
- HasConnectedResourceArea(resource, area)


Ownership

For now, I am taking the liberty of just saying if the _thing_ is within 
the city radius (whether it is 3, less, or more -- 5) then it counts as being 
"accessible" and therefore returns true. 

It is therefore possible for two or more cities to share the benefit of this
unworked and unimproved _thing_.

The point is that these tests can be used to determine if a _thing_ is close 
enough to a city to have some small impact (without having to be worked).


Progression

As an example, I could test for FLINT as a requirement for building a 
FIREPIT in a city. But, improving FLINT (creating an OUTPOST at the plot), on 
the other hand, could provide additional bonsues, such as enhanced arrowheads 
for archers and a new PROMOTION.  

The idea is to progress the level of effect that terrain, resources, 
features, and other _things_ have on a city and/or civilization. 

The full FLINT example:

Plot + FLINT = no bonus to Plot
FLINT within City borders = allow building
Outpost created on FLINT = promotion for primitive archers
2nd level improvement (tech req.) = bonus production on plot


Balance

Since I am adding resources to the game, I want to limit their immediate gains. 
FLINT gave no default extras. I do this because I use the ResourceGen script
which I think adds new resources in _addition_ to the standard set. If I were
to add luxury-type resources I would proabably also lower the happiness gain
down to 3. 


Performance

To start, I could organize logic for esacpe tests, such as asking the City if
it has a resource (meaning it is improved). Then, there is no need to proceed 
with the plot checks. B

Since I am testing all plots within range of each city, I am bound to double or 
triple check the plots. If there are 200 cities in the game, each with 37 plots,
that would be 7400 plot checks. I could keep a lookup table to avoid overlap
but that wouldn't be much of a gain. 

For resource checking I may be able to get a gain by using the resource as the 
starting plot and checking for cities within their radius -- maybe -- especially
if there are more cities than resources.


Non-Resource Performance

For other checks, such as "HasFeatureWithinCity(__ForestID__)", I would stick
with the city-first strategy.



Finally

Since I am new to all this, I could be rewriting methods and actions that 
already exist or that others have already created. I am still disecting code
and reading APIs (a little sparse -- I hope I can contribute). 

Please let me know if something is already there or if you have suggestions
on better ways to do this. 


Thanks!


end]]--

print("\n\n--------------------------------------------------");
print("  __FILE__   Buildings_Prehistory                 ");
print("--------------------------------------------------\n");



include "util/logging"


local logger = logging.new(function(self, level, message)
                             print(level, message)
                             return true
                           end)

logger:info("testing...")

local bldgCausewayPrereq = GameInfoTypes.BUILDING_CAUSEWAY_PREREQ;
local bDebug = true



-- UTILITIES (to go in separatte util file)
function b2s( p_bool ) 
  return string.format("%s", tostring( p_bool ));
end

function debug( s )
  if bDebug then
    print( s )
  end
end
-- END UTILITIES


--
-- GetNumResourcesInRange
-- 
function GetNumResourcesInRange( player, types )
  
  local n = 0;
  
  for i, id in pairs(types) do
  
    if player:GetNumResourceAvailable(id, true) > 0 then
      n = n + 1;
    end
  
  end
  
  return n > 0

end

--
-- HasResourceWithinCity
--
function HasResourceWithinCity( iPlayer, p_resource )

  local player = Players[iPlayer]; -- we're all players in the end
  
  local playerHuman = player:IsHuman();
  local playerPlotImproved = player:IsAnyPlotImproved();
  local playerBldgFree_CausewayPrereq = player:IsBuildingFree( bldgCausewayPrereq );

  if playerHuman then -- temporary debug

  for city in player:Cities() do

    print("[Buildings] "); 
    print("[Buildings] ");
    print("[Buildings] ----------------------------------");
    print("[Buildings] HasFeatureWithinCity");
    print("[Buildings] ----------------------------------");
    print("[Buildings] Player: " .. player:GetName() .. " " .. player:GetID() );
    print("[Buildings] Player: IsHuman: " .. b2s( playerHuman ) );
    print("[Buildings] Player: IsAnyPlotImproved: " .. b2s( playerPlotImproved ) );
    print("[Buildings] Player: IsBuildingFree(bldgCausewayPrereq): " .. b2s( playerBldgFree_CausewayPrereq ) );
    print("[Buildings] ----");
    print("[Buildings] Name: " .. city:GetName());
    print("[Buildings] NumPlots: " .. city:GetNumCityPlots());
    print("[Buildings] IsCapital: " .. b2s( city:IsCapital() ) );
    print("[Buildings] GetX: " .. city:GetX());
    print("[Buildings] GetY: " .. city:GetY());
    print("[Buildings] GameInfoTypes.RESOURCE_STONE: " .. GameInfoTypes.RESOURCE_STONE);
    print("[Buildings] IsHasResourceLocal(-stone-): " .. b2s( city:IsHasResourceLocal( GameInfoTypes.RESOURCE_STONE ) ) );
    print("[Buildings] IsHasResourceLocal(-gold-): " .. b2s( city:IsHasResourceLocal( GameInfoTypes.RESOURCE_GOLD ) ) );
    print("[Buildings] GetCitySizeType: " .. city:GetCitySizeType());

    print("\n\n[Plot] Scanning Plots...");

    local plot = city:Plot()
    local x = plot:GetX()
    local y = plot:GetY()
    local r = 3
    local t = null

    for dx = -r, r do
      for dy = -r, r do
        plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, r)
        if plot then
          local s1 = "[" .. dx .. " x " .. dy .. "]"

          t = plot:GetResourceType()
          if t and t>0 then
            
            local city_valid = plot:IsPlayerCityRadius(player) and plot:IsOwned()
            print("[Plot] Found resource " .. t .. " at " .. s1)
            if city_valid then
              print "[Plot]    within city boundary"
              return true
            end

          else

          end
        end
      end
    end


    local bplots = city:GetBuyablePlotList();


    -- int Plot:GetCityRadiusCount()
    -- int Plot:GetNumResource()
    -- PlayerID Plot:GetOwner()
    -- int Plot:GetPlayerCityRadiusCount(PlayerID index)
    -- int Plot:GetPlotCity()
    -- PlotType Plot:GetPlotType()
    -- TerrainType Plot:GetTerrainType()
    -- City Plot:GetWorkingCity()

    -- bool Plot:IsCityRadius()
    -- void Plot:UpdateFog()
    -- void Ploy:UpddateVisibility()


    -- local x, y = 

    -- city:
      -- boolean city:IsForcedWorkingPlot(<Plot> pPlot);
      -- IsForcedAvoidGrowth / int city:GetForcedAvoidGrowth();
      -- IsHasBuilding / with city:getNumBuildings();
      -- boolean city:IsHasResourceLocal(ResourceTypes iResource);
      -- void city:setNumRealBuilding(BuildingTypes iIndex, int iNewValue);
      -- int city:getNumRealBuilding(BuildingTypes iIndex);

      -- check for 
    print("[Buildings] Num bldgCausewayPrereq: " .. city:GetNumRealBuilding( bldgCausewayPrereq ));
    if not city:IsHasBuilding( bldgCausewayPrereq ) then
      print("[Buildings] No CausewayPrereq detected");
      city:SetNumRealBuilding(bldgCausewayPrereq, 1);
      print("[Buildings] NEW Num bldgCausewayPrereq: " .. city:GetNumRealBuilding( bldgCausewayPrereq ));
    end
    
    -- set food
    -- city:SetNumRealBuilding(bonusFoodID, newBonus);
  end
  end

  return false

end

GameEvents.PlayerDoTurn.Add( HasResourceWithinCity );
print("subscribed to PlayerDoTurn: HasResourceWithinCity");
