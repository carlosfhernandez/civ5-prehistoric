-- Buildings
-- Author: carlos
-- DateCreated: 1/9/2014 4:57:20 PM
--------------------------------------------------------------

--[[

float error kept giving me 41.99999999999999999

end]]--

print("--------------------------------------------------");
print("    __FILE__ Buildings");
print("--------------------------------------------------");
print("");



local bldgCausewayPrereq = GameInfoTypes.BUILDING_CAUSEWAY_PREREQ;




-- UTILITIES (to go in util file)
function b2s( p_bool ) 
  return string.format("%s", tostring( p_bool ));
end


function GetNumResourcesInRange( player, types )
  
  local n = 0;
  
  for i, id in pairs(types) do
  
    if player:GetNumResourceAvailable(id, true) > 0 then
      n = n + 1;
    end
  
  end
  
  return n > 0

end


function HasFeatureWithinCity( iPlayer, p_feature )

  local player = Players[iPlayer]; -- we're all players in the end
  
  local playerHuman = player:IsHuman();
  local playerPlotImproved = player:IsAnyPlotImproved();
  local playerBldgFree_CausewayPrereq = player:IsBuildingFree( bldgCausewayPrereq );

  if playerHuman then
  for city in player:Cities() do

    print("[Buildings] "); 
    print("[Buildings] ");
    print("[Buildings] ----------------------------------");
    print("[Buildings] HasFeatureWithinCity");
    print("[Buildings] ----------------------------------");
    print("[Buildings] Player: " .. player:GetName());
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

    print("\n[Buildings] Scanning Plots...");
    local plot = city:Plot();
    -- int Plot:GetCityRadiusCount()
    -- int Plot:GetNumResource()
    -- PlayerID Plot:GetOwner()
    -- int Plot:GetPlayerCityRadiusCount(PlayerID index)
    -- int Plot:GetPlotCity()
    -- PlotType Plot:GetPlotType()
    -- TerrainType Plot:GetTerrainType()
    -- City Plot:GetWorkingCity()
    -- int Plot:GetX()
    -- int Plot:GetY()
    -- int Plot:IsCity()
    -- bool Plot:IsCityRadius()
    -- void Plot:UpdateFog()
    -- void Ploy:UpddateVisibility()
    




    print("[Buildings] CityRadiusCount: " .. plot:GetCityRadiusCount() );


    

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

  -- print("[Buildings] Count HasFeatureWithinCity: " .. GameEvents.PlayerDoTurn.Count(HasFeatureWithinCity));

end


GameEvents.PlayerDoTurn.Add( HasFeatureWithinCity );
print("subscribed to PlayerDoTurn: HasFeatureWithinCity");

function cleanpre()
  GameEvents.PlayerDoTurn.Remove( HasFeatureWithinCity );
  include( "Main_Prehistory" );
end