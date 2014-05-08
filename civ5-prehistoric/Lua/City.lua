
--[[

City



                AddProductionExperience(Unit unit, bool conscript = false)
                AdoptReligionFully(ReligionType religion)
UnitType        AllUpgradesAvailable(UnitType unit, int upgradeCount = 0)
                AlterWorkingPlot(CityPlotID plotIndex)
bool            At(int x, int y)
bool            AtPlot(Plot plot)

C

bool            CanBuyPlot()
bool            CanBuyPlotAt(int hexX, int hexY, bool arg2)
bool            CanConscript()
int             CanConstructTooltip(int id)
bool            CanContinueProduction(OrderType orderType, int data1, int data2, bool save)
bool            CanCreate(ProjectType project, int continue, int testVisible)
bool            CanHurry(HurryType hurry, bool testVisible)
bool            CanJoin()
bool            CanMaintain(ProcessType process, int continue)
bool            CanPrepare(int specialist, bool continue)
int             CanRangeStrike()
bool            CanRangeStrikeAt(int x, int y, bool arg2, bool arg3)
int             CanRangeStrikeNow()
bool            CanTrain(UnitType unit, int continue, int testVisible, bool ignoreCost, bool ignoreUpgrades)
int             CanTrainTooltip(UnitType id)
int             CanWork(Plot plot)
                ChangeBaseGreatPeopleRate(int change)
                ChangeBuildingProduction(BuildingType index, int change)
                ChangeBuildingProductionTime(BuildingType index, int change)
                ChangeCultureRateModifier(int change)
                ChangeCultureUpdateTimer(int change)
                ChangeDamage(int change)
                ChangeFood(int change)
                ChangeGreatPeopleProgress(int change)
                ChangeGreatPeopleUnitProgress(UnitType index, int change)
                ChangeHealRate(int change)
                ChangeJONSCultureLevel(int change)
                ChangeJONSCulturePerTurnFromBuildings(int change)
                ChangeJONSCulturePerTurnFromPolicies(int change)
                ChangeJONSCulturePerTurnFromSpecialists(int change)
                ChangeJONSCultureStored(int change)
                ChangeProduction(int change)
int             ChangeRazingTurns()
int             ChangeResistanceTurns()
int             ChangeSpecialistGreatPersonProgressTimes100(SpecialistType index, int change)
                ChangeUnitProduction(UnitType index, int change)
                ChangeWeLoveTheKingDayCounter(int change)
                ChangeWonderProductionModifier(int change)
                ChooseProduction(UnitType trainUnit, BuildingType constructBuilding, ProjectType createProject, bool finish, bool front)
                ClearWorkingOverride(int index)
int             ConscriptMinCityPopulation()
                ConvertPercentFollowers(ReligionType arg0, ReligionType arg1, int arg2)
int             CountNumImprovedPlots()
int             CountNumRiverPlots()
int             CountNumWaterPlots()
                CreateGreatGeneral(UnitType greatPersonUnit)
-BNW-
?               ClearGreatWorks

D

bool            DoPickResourceDemanded()
int             DoReallocateCitizens()
                DoTask(TaskType task, int data1, int data2, bool option)
int             DoVerifyWorkingPlots()

F

int             FindBaseYieldRateRank(YieldType yield)
int             FindPopulationRank()
int             FindYieldRateRank(YieldType yield)
int             FoodConsumption(bool noAngry, int extra)
int             FoodDifference(bool bottom)
int             FoodDifferenceTimes100(bool bottom)

G

int             GetAirModifier()
ArtStyleType    GetArtStyleType()
int             GetBaseGreatPeopleRate()
int             GetBaseJONSCulturePerTurn()
int             GetBaseYieldRate(YieldType index)
int             GetBaseYieldRateFromBuildings(YieldType yieldType)
int             GetBaseYieldRateFromMisc(YieldType yieldType)
int             GetBaseYieldRateFromReligion(YieldType yieldType)
int             GetBaseYieldRateFromSpecialists(YieldType yieldType)
int             GetBaseYieldRateFromTerrain(YieldType yieldType)
int             GetBaseYieldRateModifier(YieldType index, int extra = 0)
int             GetBuildingDefense()
int             GetBuildingEspionageModifier(BuildingType building)
int             GetBuildingFaithPurchaseCost(BuildingType building, bool arg1 = nil)
int             GetBuildingGlobalEspionageModifier(BuildingType building)
int             GetBuildingOriginalOwner(BuildingType index)
int             GetBuildingOriginalTime(BuildingType index)
int             GetBuildingProduction(BuildingType index)
int             GetBuildingProductionModifier(BuildingType building)
int             GetBuildingProductionNeeded()
int             GetBuildingProductionTime(BuildingType index)
int             GetBuildingProductionTurnsLeft(BuildingType building, int num)
int             GetBuildingPurchaseCost(BuildingType building)
int             GetBuildingYieldChange(BuildingClassType buildingClass, YieldType yield)
...             GetBuyablePlotList()
int             GetBuyPlotCost(int x, int y)
Plot            GetCityIndexPlot(CityPlotID index)
CityPlotID      GetCityPlotIndex(Plot plot)
unknown         GetCitySizeType()
CivilizationType GetCivilizationType()
int             GetConscriptPopulation()
UnitType        GetConscriptUnit()
int             GetCultureFromSpecialist(SpecialistType specialist)
int             GetCultureRateModifier()
int             GetCultureUpdateTimer()
int             GetCurrAirlift()
int             GetCurrentProductionDifference(bool ignoreFood, bool overflow)
int             GetCurrentProductionDifferenceTimes100(bool ignoreFood, bool overflow)
int             GetDamage()
int             GetDomainFreeExperience(DomainType index)
int             GetDomainProductionModifier(DomainType index)
int             GetExtraProductionDifference(int extra)
int             GetExtraSpecialistYield(YieldType index)
int             GetExtraSpecialistYieldOfType(YieldType index, SpecialistType specialist)
int             GetFaithPerTurn()
int             GetFaithPerTurnFromBuildings()
int             GetFaithPerTurnFromPolicies()
int             GetFaithPerTurnFromReligion()
int             GetFaithPerTurnFromTraits()
int             GetFaithPurchaseBuildingTooltip(int id)
int             GetFaithPurchaseUnitTooltip(UnitType id)
int             GetFeatureProduction()
int             GetFirstBuildingOrder(BuildingType building)
int             GetFirstProjectOrder(ProjectType project)
int             GetFirstSpecialistOrder(SpecialistType specialist)
int             GetFirstUnitOrder(UnitType unit)
CityAIFocusType GetFocusType()
int             GetFood()
int             GetFoodKept()
int             GetFoodTimes100()
int             GetFoodTurnsLeft()
int             GetFreeExperience()
int             GetFreePromotionCount(PromotionType index)
int             GetGameTurnAcquired()
int             GetGameTurnFounded()
int             GetGameTurnLastExpanded()
Unit            GetGarrisonedUnit()
int             GetGeneralProductionTurnsLeft()
int             GetGreatPeopleProgress()
int             GetGreatPeopleRate()
int             GetGreatPeopleRateModifier()
int             GetGreatPeopleUnitProgress(UnitType index)
int             GetGreatPeopleUnitRate(UnitType index)
HandicapType    GetHandicapType()
int             GetHappiness()
int             GetHighestPopulation()
CityID          GetID()
int             GetJONSCultureLevel()
int             GetJONSCulturePerTurn()
int             GetJONSCulturePerTurnFromBuildings()
int             GetJONSCulturePerTurnFromPolicies()
int             GetJONSCulturePerTurnFromReligion()
int             GetJONSCulturePerTurnFromSpecialists()
int             GetJONSCulturePerTurnFromTerrain()
int             GetJONSCulturePerTurnFromTraits()
int             GetJONSCultureStored()
int             GetJONSCultureThreshold()
int             GetLakePlotYield(YieldType index)
int             GetLocalHappiness()
int             GetLocalResourceWonderProductionMod(BuildingType building)
int             GetMaxAirlift()
int             GetMaxFoodKeptPercent()
int             GetMaxHitPoints()
int             GetMilitaryProductionModifier()
string          GetName()
string          GetNameKey()
unknown         GetNextBuyablePlot()
int             GetNukeModifier()
int             GetNumActiveBuilding(BuildingType buildingType)
int             GetNumBuilding(BuildingType buildingType)
int             GetNumBuildings()
int             GetNumFollowers(ReligionType religion)
int             GetNumForcedWorkingPlots(Plot plot)
int             GetNumFreeBuilding(BuildingType index)
int             GetNumGreatPeople()
int             GetNumNationalWonders()
int             GetNumRealBuilding(BuildingType index)
int             GetNumSpecialistsAllowedByBuilding(BuildingType building)
int             GetNumSpecialistsInBuilding(BuildingType index)
int             GetNumTeamWonders()
int             GetNumThingsProduced()
int             GetNumTrainUnitAI(UnitAIType unitAI)
int             GetNumWorldWonders()
OrderType, int, unknown, unknown, unknown GetOrderFromQueue(int arg0)
int             GetOrderQueueLength()
PlayerID        GetOriginalOwner()
int             GetOverflowProduction()
PlayerID        GetOwner()
LeaderType      GetPersonalityType()
int             GetPopulation()
int             GetPressurePerTurn(ReligionType religion)
PlayerID        GetPreviousOwner()
int             GetProduction()
BuildingType    GetProductionBuilding()
int             GetProductionExperience(UnitType unit)
int             GetProductionModifier()
string          GetProductionNameKey()
int             GetProductionNeeded()
ProcessType     GetProductionProcess()
ProjectType     GetProductionProject()
SpecialistType  GetProductionSpecialist()
int             GetProductionTimes100()
int             GetProductionTurnsLeft()
UnitType        GetProductionUnit()
UnitAIType      GetProductionUnitAI()
int             GetProjectProductionModifier(ProjectType project)
int             GetProjectProductionNeeded()
int             GetProjectProductionTurnsLeft(ProjectType project, int num)
int             GetProjectPurchaseCost(ProjectType project)
int             GetPurchaseBuildingTooltip(int id)
int             GetPurchaseUnitTooltip(UnitType id)
unknown         GetRallyPlot()
int             GetRawProductionDifference(bool arg0, bool arg1)
int             GetRazingTurns()
int             GetRealPopulation()
int             GetReligionBuildingClassHappiness(BuildingClassType buildingClass)
int             GetReligionBuildingClassYieldChange(BuildingClassType buildingClass, YieldType arg1)
int             GetReligionCityRangeStrikeModifier()
ReligionType    GetReligiousMajority()
int             GetResistanceTurns()
ResourceType    GetResourceDemanded(bool arg0 = nil)
int             GetResourceYieldRateModifier(YieldType index, ResourceType resource)
int             GetRiverPlotYield(YieldType index)
int             GetSeaPlotYield(YieldType index)
int             GetSellBuildingRefund(BuildingType index)
int             GetSpaceProductionModifier()
int             GetSpecialistCount(SpecialistType index)
int             GetSpecialistFreeExperience()
int             GetSpecialistGreatPersonProgress(SpecialistType index)
int             GetSpecialistGreatPersonProgressTimes100(SpecialistType index)
int             GetSpecialistProductionModifier(SpecialistType specialist)
int             GetSpecialistProductionTurnsLeft(SpecialistType specialist, int num)
int             GetSpecialistUpgradeThreshold()
int             GetSpecialistYield(SpecialistType specialist, YieldType yield)
int             GetStrengthValue()
TeamID          GetTeam()
int             GetTotalBaseBuildingMaintenance(BuildingType index)
int             GetTotalGreatPeopleRateModifier()
int             GetUnitCombatFreeExperience(UnitCombatType index)
int             GetUnitFaithPurchaseCost(UnitType unit, bool arg1)
int             GetUnitProduction(int index)
int             GetUnitProductionModifier(UnitType unit)
int             GetUnitProductionNeeded()
int             GetUnitProductionTurnsLeft(UnitType unit, int num)
int             GetUnitPurchaseCost(UnitType unit)
int             GetWeLoveTheKingDayCounter()
int             GetWonderProductionModifier()
ResourceType    GetX()
ResourceType    GetY()
string          GetYieldModifierTooltip(YieldType yieldType)
int             GetYieldPerPopTimes100(YieldType yieldType)
int             GetYieldRate(YieldType index)
int             GetYieldRateModifier(YieldType index)
int             GetYieldRateTimes100(YieldType index)
int             GrowthThreshold()
-BNW-
City.GetBaseTourism
City.GetBuildingGreatWork
City.GetFaithBuildingTourism
City.GetFilledSlotsTooltip
City.GetJONSCulturePerTurnFromGreatWorks
City.GetJONSCulturePerTurnFromLeagues
City.GetLeagueBuildingClassYieldChange
City.GetNumGreatWorks
City.GetNumGreatWorksInBuilding
City.GetNumGreatWorkSlots
City.GetNumTradeRoutesAddingPressure
City.GetSecondaryReligion
City.GetSecondaryReligionPantheonBelief
City.GetThemingBonus
City.GetThemingTooltip
City.GetTotalSlotsTooltip
City.GetTourismMultiplier
City.GetTourismTooltip


H

bool            HasPerformedRangedStrikeThisTurn()
                Hurry(HurryType hurry)
int             HurryCost(HurryType hurry, bool extra)
int             HurryGold(HurryType hurry)
int             HurryPopulation(HurryType hurry)
int             HurryProduction(HurryType hurry)

I

bool            IsAirliftTargeted()
bool            IsBarbarian()
bool            IsBlockaded()
bool            IsBuildingLocalResourceValid(BuildingType building, bool checkForImprovement)
bool            IsBuildingSellable(BuildingType index)
bool            IsBuildingsMaxed()
bool            IsCanAddSpecialistToBuilding(BuildingType building)
bool            IsCanPurchase(UnitType unitType, int buildingType, int projectType, int projectID, int projectID = nil, YieldType yield = nil)
int             IsCapital()
bool            IsCoastal(int minWaterSize)
bool            IsDrafted()
bool            IsEverOwned(PlayerID index)
int             IsFoodProduction()
bool            IsForcedAvoidGrowth()
int             IsForcedWorkingPlot(Plot plot)
bool            IsFreePromotion(PromotionType index)
bool            IsHasBuilding(BuildingType building)
bool            IsHasResourceLocal(ResourceType resource)
bool            IsHolyCityForReligion(ReligionType religion)
bool            IsHuman()
bool            IsNationalWondersMaxed()
bool            IsNeverLost()
bool            IsNoAutoAssignSpecialists()
bool            IsNone()
bool            IsNoOccupiedUnhappiness()
int             IsOccupied()
int             IsPlotBlockaded(Plot plot)
int             IsProduction()
bool            IsProductionAutomated()
bool            IsProductionBuilding()
bool            IsProductionLimited()
int             IsProductionProcess()
bool            IsProductionProject()
bool            IsProductionSpecialist()
bool            IsProductionUnit()
int             IsPuppet()
int             IsRazing()
bool            IsResistance()
bool            IsRevealed(TeamID index, bool debug)
bool            IsTeamWondersMaxed()
bool            IsUnitFoodProduction(UnitType unit)
bool            IsVisible(TeamID team, bool debug)
int             IsWorkingPlot(Plot plot)
bool            IsWorldWondersMaxed()
-BNW-
City.IsHoldingGreatWork
City.IsOriginalMajorCapital
City.IsThemingBonusPossible

K

?               Kill

M

int             MaxHurryPopulation()

P

Plot            Plot()
                PopOrder(int num, bool finish, bool choose)
int             ProductionLeft()
                PushOrder(OrderType order, int data1, int data2, bool save, bool pop, bool append, bool force)

R

int             RangeCombatDamage(Unit theirUnit, unknown arg1)
int             RangeCombatUnitDefense(Unit theirUnit)

S

                SetAirliftTargeted(int newValue)
                SetBuildingProduction(BuildingType index, int newValue)
                SetBuildingProductionTime(BuildingType index, int newValue)
                SetBuildingYieldChange(BuildingClassType buildingClass, YieldType yield, int change)
                SetCitySizeBoost(int boost)
                SetDamage(int value)
                SetDrafted(int newValue)
                SetFeatureProduction(int newValue)
int             SetFocusType()
                SetFood(int newValue)
                SetGreatPeopleUnitProgress(UnitType index, int newValue)
                SetHighestPopulation(int newValue)
                SetJONSCultureLevel(int value)
                SetJONSCultureStored(int value)
                SetName(string newValue, bool found)
                SetNeverLost(int newValue)
                SetNumRealBuilding(BuildingType index, int newValue)
                SetOccupied(bool value)
                SetOverflowProduction(int newValue)
                SetProduction(int newValue)
                SetProductionAutomated(bool newValue)
                SetPuppet(bool value)
bool            SetResourceDemanded(ResourceType resource)
                SetRevealed(TeamID index, bool newValue)
                SetUnitProduction(int index, int newValue)
                SetWeLoveTheKingDayCounter(int value)
-BNW-
City.SetBuildingGreatWork
                
U

?               UpdateStrengthValue

W










================================================================================



Used by

string          GetCultureTooltip(City city)
string          GetFaithTooltip(City city)
string          GetFoodTooltip(City city)
string          GetGoldTooltip(City city)
string          GetProductionTooltip(City city)
string          GetReligionTooltip(City city)
string          GetScienceTooltip(City city)
string          GetYieldTooltip(City city, YieldType yieldType, int base, int total, string iconString, string modifiersString)
string          GetYieldTooltipHelper(City city, YieldType yieldType, string icon)
Game.CityPurchaseBuilding(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
Game.CityPurchaseProject(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
Game.CityPurchaseUnit(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
Game.CityPushOrder(City city, OrderType order, UnitType data, bool alt, bool shift, bool ctrl)
Game.FoundReligion(PlayerID vaticanPlayer, ReligionType religion, unknown arg2, BeliefType belief2, BeliefType belief3, BeliefType belief3, int arg6, City vaticanCity)
City  Game.GetHolyCityForReligion(ReligionType religion, PlayerID player)
Game.SetAdvisorRecommenderCity(City city)
Game.SetHolyCity(ReligionType arg0, City newHolyCity)
Player:AcquireCity(City city, bool conquest, bool trade)
bool            Player:CanRaze(City city, bool arg1 = nil)
iterator(City)  Player:Cities()
Player:Disband(City city)
int             Player:GetAdvancedStartBuildingCost(BuildingType building, bool add, City city)
int             Player:GetAdvancedStartPopCost(bool add, City city)
City  Player:GetCapitalCity()
City  Player:GetCityByID(CityID city)
int             Player:GetRouteGoldTimes100(City city)
int             Player:GetUnhappinessForecast(City newCity, City newCity)
int             Player:GetUnhappinessFromCityForUI(City city)
City  Player:InitCity(int x, int y, bool bumpUnits = true)
int             Player:IsCapitalConnectedToCity(City city)
Player:Raze(City city)
int             Plot:GetFeatureProduction(BuildActionType build, TeamID team, City city)
City  Plot:GetWorkingCity()
City  UI.GetHeadSelectedCity()
UI.SelectCity(City city)
int             Unit:GetRangeCombatDamage(Unit defender, City city, bool includeRand)




--]]





-- TODO: change initial city to ruins or camp


function OnCityFounded(iPlayer, iCityX, iCityY)
  local pPlayer = Players[iPlayer];
  if (pPlayer == nil) then return; end

  local pPlot = Map.GetPlot(iCityX, iCityY);
  if (pPlot == nil) then return; end

  local pCity = pPlot:GetPlotCity();
  if (pCity == nil) then return; end

  -- Add free buildings based on our current era
  local iCurrentEra = pPlayer:GetCurrentEra();
  for tBuilding in GameInfo.Buildings() do
    if (IsBuildingFreeInEra(tBuilding, iCurrentEra)) then
      AddBuilding(pCity, tBuilding);
    end
  end

  -- Add extra population based on our current era
  AddPopulation(pCity, GetNumFreeCitizensInEra(iCurrentEra));
end
GameEvents.PlayerCityFounded.Add( OnCityFounded );



function AddPopulation(pCity, iPopulation)
  if (pCity == nil) then return; end

  pCity:ChangePopulation(iPopulation, true);
end


-- City.ConscriptMinCityPopulation (Civ5 API)


