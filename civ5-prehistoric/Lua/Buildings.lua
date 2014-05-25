-- Buildings
-- Author: carlos
-- DateCreated: 1/16/2014 4:01:58 PM
--------------------------------------------------------------


-- include( "HasWithinCityBorders" )



--
-- Building Bonuses Check
--
GameEvents.PlayerDoTurn.Add(function(iPlayer) 
  

  local iTurn = Game.GetGameTurn();
  
  local pPlayer = Players[iPlayer];



  -- Only on first player's turn
  if (iPlayer > 0 or iTurn < 1) then
    return false;
  end

  if (iReformationTurn > -1) then
    if (iReformationTurn == iTurn) then
      StartReformation();
    elseif (GetPersistentProperty("SecondReformer") == iTurn) then
      ReformationPhaseTwo();
    elseif (GetPersistentProperty("ThirdReformer") == iTurn) then
      ReformationPhaseThree();
    end
  else
    if (Game.GetGameTurnYear() > 1514) then
      SetPersistentProperty("ReformationStart", iTurn + 1);
      SetPersistentProperty("SecondReformer", iTurn + 4);
      SetPersistentProperty("ThirdReformer", iTurn + 7);    
    end
  end
  
  ScoreHolyCities();
  
  if (iTurn == 40) then
    BringInMongols();
  elseif (iTurn == 50 or iTurn == 60 or iTurn == 70 or iTurn == 85 or iTurn == 110) then
    ReinforceMongols();
  elseif (iTurn == 150) then
    MongolsPullOut();
  end

  return false;
end);




--[[


A
AssignStartingPlots.AttemptToPlaceNaturalWonder (Civ5 API)
B
Events.BuildingLibrarySwap (Civ5 API)
C
AssignStartingPlots.CanBeThisNaturalWonderType (Civ5 API)
Player.ChangeBaseBuildingGoldMaintenance (Civ5 API)
City.ChangeBaseYieldRateFromBuildings (Civ5 API)
Team.ChangeBridgeBuildingCount (Civ5 API)
City.ChangeBuildingProduction (Civ5 API)
City.ChangeBuildingProductionTime (Civ5 API)
ChangeBuildingSize (Civ5 API)
City.ChangeJONSCulturePerTurnFromBuildings (Civ5 API)
Player.ChangeNumWorldWonders (Civ5 API)
Team.ChangeProjectCount (Civ5 API)
City.ChangeWonderProductionModifier (Civ5 API)
GameEvents.CityBuildingsIsBuildingSellable (Civ5 API)
Game.CityPurchaseBuilding (Civ5 API)
Game.CityPurchaseProject (Civ5 API)
Player.CountNumBuildings (Civ5 API)
D
Map.DoPlaceNaturalWonders (Civ5 API)
E
AssignStartingPlots.ExamineCandidatePlotForNaturalWondersEligibility (Civ5 API)
AssignStartingPlots.ExaminePlotForNaturalWondersEligibility (Civ5 API)
G
AssignStartingPlots.GenerateNaturalWondersCandidatePlotLists (Civ5 API)
Player.GetAdvancedStartBuildingCost (Civ5 API)
City.GetBaseYieldRateFromBuildings (Civ5 API)
Game.GetBestWondersPlayer (Civ5 API)
Team.GetBridgeBuildingCount (Civ5 API)
Player.GetBuildingClassCount (Civ5 API)
Team.GetBuildingClassCount (Civ5 API)
Player.GetBuildingClassCountPlusMaking (Civ5 API)
Team.GetBuildingClassCountPlusMaking (Civ5 API)
Game.GetBuildingClassCreatedCount (Civ5 API)
Player.GetBuildingClassMaking (Civ5 API)
Team.GetBuildingClassMaking (Civ5 API)
Player.GetBuildingClassPrereqBuilding (Civ5 API)
City.GetBuildingDefense (Civ5 API)
City.GetBuildingEspionageModifier (Civ5 API)
City.GetBuildingFaithPurchaseCost (Civ5 API)
City.GetBuildingGlobalEspionageModifier (Civ5 API)
Player.GetBuildingGoldMaintenance (Civ5 API)
City.GetBuildingOriginalOwner (Civ5 API)
City.GetBuildingOriginalTime (Civ5 API)
City.GetBuildingProduction (Civ5 API)
City.GetBuildingProductionModifier (Civ5 API)
Player.GetBuildingProductionModifier (Civ5 API)
City.GetBuildingProductionNeeded (Civ5 API)
Player.GetBuildingProductionNeeded (Civ5 API)
City.GetBuildingProductionTime (Civ5 API)
City.GetBuildingProductionTurnsLeft (Civ5 API)
City.GetBuildingPurchaseCost (Civ5 API)
City.GetBuildingYieldChange (Civ5 API)
Game.GetBuildingYieldChange (Civ5 API)
Game.GetBuildingYieldModifier (Civ5 API)
G cont.
Player.GetCultureWonderMultiplier (Civ5 API)
Player.GetExtraBuildingHappinessFromPolicies (Civ5 API)
City.GetFaithPerTurnFromBuildings (Civ5 API)
City.GetFaithPurchaseBuildingTooltip (Civ5 API)
City.GetFirstBuildingOrder (Civ5 API)
City.GetFirstProjectOrder (Civ5 API)
City.GetHappinessFromBuildings (Civ5 API)
Player.GetHappinessFromBuildings (Civ5 API)
Player.GetHappinessFromNaturalWonders (Civ5 API)
GetHelpTextForBuilding (Civ5 API)
GetHelpTextForProject (Civ5 API)
Game.GetInitWonders (Civ5 API)
City.GetJONSCulturePerTurnFromBuildings (Civ5 API)
City.GetLocalResourceWonderProductionMod (Civ5 API)
Player.GetMaxGlobalBuildingProductionModifier (Civ5 API)
Player.GetMaxPlayerBuildingProductionModifier (Civ5 API)
Player.GetMaxTeamBuildingProductionModifier (Civ5 API)
Game.GetMaxWonders (Civ5 API)
Player.GetMinorCivCurrentCulturePerBuildingBonus (Civ5 API)
Player.GetNaturalWonderYieldModifier (Civ5 API)
City.GetNumActiveBuilding (Civ5 API)
City.GetNumBuilding (Civ5 API)
City.GetNumBuildings (Civ5 API)
City.GetNumFreeBuilding (Civ5 API)
City.GetNumNationalWonders (Civ5 API)
City.GetNumRealBuilding (Civ5 API)
Game.GetNumResourceRequiredForBuilding (Civ5 API)
City.GetNumSpecialistsAllowedByBuilding (Civ5 API)
City.GetNumSpecialistsInBuilding (Civ5 API)
City.GetNumTeamWonders (Civ5 API)
Player.GetNumWondersBeatenTo (Civ5 API)
City.GetNumWorldWonders (Civ5 API)
Game.GetNumWorldWonders (Civ5 API)
Player.GetNumWorldWonders (Civ5 API)
Team.GetObsoleteBuildingCount (Civ5 API)
Player.GetPlayerBuildingClassHappiness (Civ5 API)
Player.GetPlayerBuildingClassYieldChange (Civ5 API)
Player.GetPolicyBuildingClassYieldChange (Civ5 API)
Player.GetPolicyBuildingClassYieldModifier (Civ5 API)
City.GetProductionBuilding (Civ5 API)
City.GetProductionProject (Civ5 API)
Team.GetProjectArtType (Civ5 API)
Team.GetProjectCount (Civ5 API)
Game.GetProjectCreatedCount (Civ5 API)
Team.GetProjectDefaultArtType (Civ5 API)
Team.GetProjectMaking (Civ5 API)
City.GetProjectProductionModifier (Civ5 API)
Player.GetProjectProductionModifier (Civ5 API)
City.GetProjectProductionNeeded (Civ5 API)
Player.GetProjectProductionNeeded (Civ5 API)
City.GetProjectProductionTurnsLeft (Civ5 API)
G cont.
City.GetProjectPurchaseCost (Civ5 API)
City.GetPurchaseBuildingTooltip (Civ5 API)
City.GetReligionBuildingClassHappiness (Civ5 API)
City.GetReligionBuildingClassYieldChange (Civ5 API)
Player.GetScoreFromWonders (Civ5 API)
City.GetSellBuildingRefund (Civ5 API)
City.GetTotalBaseBuildingMaintenance (Civ5 API)
Player.GetWonderDisputeLevel (Civ5 API)
City.GetWonderProductionModifier (Civ5 API)
Player.GetWonderProductionModifier (Civ5 API)
Player.GetWondersScore (Civ5 API)
I
Unit.IgnoreBuildingDefense (Civ5 API)
Team.IsBridgeBuilding (Civ5 API)
Game.IsBuildingClassMaxedOut (Civ5 API)
Player.IsBuildingClassMaxedOut (Civ5 API)
Team.IsBuildingClassMaxedOut (Civ5 API)
Game.IsBuildingEverActive (Civ5 API)
Player.IsBuildingFree (Civ5 API)
City.IsBuildingLocalResourceValid (Civ5 API)
Game.IsBuildingRecommended (Civ5 API)
City.IsBuildingSellable (Civ5 API)
City.IsBuildingsMaxed (Civ5 API)
City.IsCanAddSpecialistToBuilding (Civ5 API)
City.IsHasBuilding (Civ5 API)
City.IsNationalWondersMaxed (Civ5 API)
Team.IsObsoleteBuilding (Civ5 API)
City.IsProductionBuilding (Civ5 API)
Player.IsProductionMaxedBuildingClass (Civ5 API)
Player.IsProductionMaxedProject (Civ5 API)
City.IsProductionProject (Civ5 API)
Team.IsProjectAndArtMaxedOut (Civ5 API)
Game.IsProjectMaxedOut (Civ5 API)
Team.IsProjectMaxedOut (Civ5 API)
Game.IsProjectRecommended (Civ5 API)
City.IsTeamWondersMaxed (Civ5 API)
City.IsWorldWondersMaxed (Civ5 API)
N
Events.NaturalWonderRevealed (Civ5 API)
P
AssignStartingPlots.PlaceNaturalWonders (Civ5 API)
R
Player.RemoveBuildingClass (Civ5 API)
S
Network.SendSellBuilding (Civ5 API)
Events.SerialEventBuildingSizeChanged (Civ5 API)
Player.SetBaseBuildingGoldMaintenance (Civ5 API)
City.SetBuildingProduction (Civ5 API)
City.SetBuildingProductionTime (Civ5 API)
City.SetBuildingYieldChange (Civ5 API)
City.SetNumRealBuilding (Civ5 API)
Player.SetNumWondersBeatenTo (Civ5 API)
Team.SetProjectArtType (Civ5 API)
Team.SetProjectDefaultArtType (Civ5 API)









------------------------
USED BY:
------------------------
string  GetHelpTextForBuilding(BuildingType building, bool excludeName, bool excludeHeader, bool noMaintenance)
bool  City:CanConstruct(BuildingType building, int continue, int testVisible, bool ignoreCost)
City:ChangeBuildingProduction(BuildingType index, int change)
City:ChangeBuildingProductionTime(BuildingType index, int change)
City:ChooseProduction(UnitType trainUnit, BuildingType constructBuilding, ProjectType createProject, bool finish, bool front)
int City:GetBuildingEspionageModifier(BuildingType building)
int City:GetBuildingFaithPurchaseCost(BuildingType building, bool arg1 = nil)
int City:GetBuildingGlobalEspionageModifier(BuildingType building)
int City:GetBuildingOriginalOwner(BuildingType index)
int City:GetBuildingOriginalTime(BuildingType index)
int City:GetBuildingProduction(BuildingType index)
int City:GetBuildingProductionModifier(BuildingType building)
int City:GetBuildingProductionTime(BuildingType index)
int City:GetBuildingProductionTurnsLeft(BuildingType building, int num)
int City:GetBuildingPurchaseCost(BuildingType building)
int City:GetFirstBuildingOrder(BuildingType building)
int City:GetLocalResourceWonderProductionMod(BuildingType building)
int City:GetNumActiveBuilding(BuildingType buildingType)
int City:GetNumBuilding(BuildingType buildingType)
int City:GetNumFreeBuilding(BuildingType index)
int City:GetNumRealBuilding(BuildingType index)
int City:GetNumSpecialistsAllowedByBuilding(BuildingType building)
int City:GetNumSpecialistsInBuilding(BuildingType index)
BuildingType  City:GetProductionBuilding()
int City:GetSellBuildingRefund(BuildingType index)
int City:GetTotalBaseBuildingMaintenance(BuildingType index)
bool  City:IsBuildingLocalResourceValid(BuildingType building, bool checkForImprovement)
bool  City:IsBuildingSellable(BuildingType index)
bool  City:IsCanAddSpecialistToBuilding(BuildingType building)
bool  City:IsHasBuilding(BuildingType building)
City:SetBuildingProduction(BuildingType index, int newValue)
City:SetBuildingProductionTime(BuildingType index, int newValue)
City:SetNumRealBuilding(BuildingType index, int newValue)
int Game.GetBuildingYieldChange(BuildingType building, YieldType arg1)
int Game.GetBuildingYieldModifier(BuildingType building, YieldType arg1)
bool  Game.IsBuildingEverActive(BuildingType building)
Game.SelectedCitiesGameNetMessage(GameMessageType message, TaskType data2, int data3, BuildingType data4, bool option, bool alt, bool shift, bool ctrl)
GameEvents.CityBuildingsIsBuildingSellable(PlayerID player, BuildingType building)
GameEvents.CityCanConstruct(PlayerID player, CityID city, BuildingType buildingType)
Network.SendSellBuilding(CityID arg0, BuildingType buildingToSell)
bool  Player:CanConstruct(BuildingType building, bool continue, bool testVisible, bool ignoreCost)
int Player:CountNumBuildings(BuildingType building)
int Player:GetAdvancedStartBuildingCost(BuildingType building, bool add, City city)
int Player:GetBuildingClassPrereqBuilding(BuildingType building, unknown ePrereqBuildingClass, int extra)
bool  Player:IsBuildingFree(BuildingType building)
int Player:IsCanPurchaseAnyCity(bool arg0, bool arg1, UnitType arg2, BuildingType arg3, YieldType arg4)
int Team:GetObsoleteBuildingCount(BuildingType index)
bool  Team:IsObsoleteBuilding(BuildingType index)
bool  Unit:CanConstruct(Plot plot, BuildingType building)



--]]