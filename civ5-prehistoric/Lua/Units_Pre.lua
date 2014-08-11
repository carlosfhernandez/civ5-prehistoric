--
-- Units.lua
--
-- Utiliy functions and events for Units
-- 
-- @author: Carlos F Hernandez [apshai; carloscodex]
-- @date: 2014-05-25
-- @thanks: Machiavelli



logger.PREFIX = "units"

logger:info( "" )
logger:info( "__FILE__ Units_Pre" )



--[[
                                           


                  ██╗   ██╗███╗   ██╗██╗████████╗███████╗
                  ██║   ██║████╗  ██║██║╚══██╔══╝██╔════╝
                  ██║   ██║██╔██╗ ██║██║   ██║   ███████╗
                  ██║   ██║██║╚██╗██║██║   ██║   ╚════██║
                  ╚██████╔╝██║ ╚████║██║   ██║   ███████║
                   ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝   ╚══════╝


        
                                  ,dM
                                 dMMP
                                dMMM'
                                \MM/
                                dMMm.
                               dMMP'_\---.
                              _| _  p ;88;`.
                            ,db; p >  ;8P|  `.
                           (``T8b,__,'dP |   |
                           |   `Y8b..dP  ;_  |
                           |    |`T88P_ /  `\;
                           :_.-~|d8P'`Y/    /
                            \_   TP    ;   7`\
                 ,,__        >   `._  /'  /   `\_
                 `._ """"~~~~------|`\;' ;     ,'
                    """~~~-----~~~'\__[|;' _.-'  `\
                            ;--..._     .-'-._     ;
                           /      /`~~"'   ,'`\_ ,/
                          ;_    /'        /    ,/
                          | `~-l         ;    /
                          `\    ;       /\.._|
                            \    \      \     \
                            /`---';      `----'
                           (     /            fsc
                            `---'
    
    
--]]




-- ----------------------------------------------------------------------------
--
-- Events
--
-- ----------------------------------------------------------------------------



--
-- SerialEvenUnitCreated_Pre
--
-- @params [[ params from SerialEvenUnitCreated ]]
--
-- Attaches event to *SerialEventUnitCreated* to add additional checks for a 
-- newly created unit. This is used to detected the creation of a NEW UNIT.
--
-- This is typically used as a trigger for a newly created building. Since it
-- seems that there is no trigger detection for a newly created building
-- I worked around it by giving a free dummy unit and using the unit creation
-- trigger. The dummy unit references the building and any other actions.
--
function SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)

  logger:debug( "[SerialEvenUnitCreated_Pre] " )
  logger:debug( "[SerialEvenUnitCreated_Pre] " )

  -- check to make sure we have a proper unit and not a dead one or one with 
  -- the "newly created flag/promotion" already assigned
  local player = Players[playerID];
  
  if (player == nil) then return end;
  
  local unit = player:GetUnitByID(unitID);
  
  if (unit == nil or unit:IsDead() or unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CREATED"].ID)) then
    return;
  end


  local unitclass = unit:GetUnitClassType()
  local unittype = GameInfo.Units[ unit:GetUnitType() ].Type
  local plot = unit:GetPlot()
  local city = FindCity(plot, 2)





  --
  -- Dummy Units reflect a newly built building (trigger) and perform actions
  -- accordingly. 
  --
  -- All other units will check for things such as if a certain building is
  -- already built in the city and should give them bonuses.
  --
  if unitclass == "UNITCLASS_BUILDING_TRIGGER" then

    logger:debug( "[SerialEvenUnitCreated_Pre] Unit dummy class" )

    -- Determine link to building and other actions
    --


    -- TODO: Add a build table or add to building table: promotion to give, 
    --       unit_class affecteced, and any other action. For now, we keep the 
    --       logic and definitions in here
    --
    -- To easily determine the ID of building the unit came from:
    --    local buildingID = unit.AdvanceStartCost 
    --    HACK: building id is placed in here  



    -- Either :
    -- (1) flag the unit as newly created and do something later or 
    -- (2) just do something now and delete unit


    -- (1)
    -- Flag the unit as NEW (for another path in game mechanics)
    -- Players[playerID]:GetUnitByID(unitID):SetHasPromotion(GameInfo
    --    .UnitPromotions["PROMOTION_CREATED"].ID, true);


    -- (2)
    -- Find city unit came from and its related building, then delete unit
    

    if unittype ==     "UNIT_BUILDING_LOOKOUT_ROCK"     then
      
      pPromotion = GameInfo.UnitPromotions["PROMOTION_CLIMB_AND_LOOK"].ID;
      

      -- TODO: find all units already created by this city
      -- Loop through units meeting criteria
      -- for u in player:Units() do
      --   if not u:IsHasPromotion(pPromotion) and {UNIT_WAS_BUILT_FROM_THIS_CITY_OR_COMES_TO_THIS_CITY} then
      --     u:SetHasPromotion(pPromotion, true);
      --   end
      -- end
    

    elseif unittype == "UNIT_BUILDING_TREE"             then



      
    elseif unittype == "UNIT_BUILDING_SPRING_SOURCE"    then




    elseif unittype == "UNIT_BUILDING_GOLDEN_PATH"      then




    elseif unittype == "UNIT_BUILDING_STONE_PILE"       then




    end



    -- because I hate dummy units
    unit:Kill();




  -- 
  -- NOT UNITCLASS_BUILDING_TRIGGER
  --
  else 
  
    logger:debug( "[SerialEvenUnitCreated_Pre] *NOT* a unit dummy class" )

    if city == nil then
      logger:debug( "[SerialEvenUnitCreated_Pre] exiting since city was not found within radius" )
      return nil
    end

    logger:debug( "[SerialEvenUnitCreated_Pre] set unit (" .. unittype .. " " .. unitID .. ") home city (" .. city:GetName() .. ")" )
    SetUnitHomeCity(unit, city)



    -- check to see if early founding unit does not take away population
    UnitFoundingException(unit, city)



    -- check for possible promotions
    UnitBuildingPromotion(unit, unittype, city)



  end -- unitclass check for dummy




  -- lazy load and create new event
  LuaEvents.SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, false)
end
Events.SerialEventUnitCreated.Add(SerialEvenUnitCreated_Pre)

--
-- UnitSetXY_Pre
--
--
--
--
-- 
function UnitSetXY_Pre(playerID, unitID, x ,y)

  print( "Player " .. playerID .. " has moved to (" .. x .. ", " .. y .. ")" ) 


  local player = Players[playerID];
  local playerTeamID = player:GetTeam();

  if (player == nil) then return end;
  
  local unit = player:GetUnitByID(unitID);
  
  if (unit == nil or unit:IsDead()) then return end

  local unitclass = unit:GetUnitClassType()
  local unittype = GameInfo.Units[ unit:GetUnitType() ].Type
  local plot = unit:GetPlot()



  if (unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_PREHISTORIC_MAPPING"].ID)) then

    for neighbor in Neighbors(plot) do
      -- set plot visible
      neighbor:SetRevealed(playerTeamID, true)
      neighbor:UpdateFog()
    end

  end



  -- check early founding units not too far away or start losing health
  -- building portable grass shelter will help with this
    -- TODO: AI ... arg ...



end
GameEvents.UnitSetXY.Add(UnitSetXY_Pre)



-- ----------------------------------------------------------------------------
--
-- Utility Functions
--
-- ----------------------------------------------------------------------------






--
-- UnitFoundingException
--
-- TODO: move this logic to table
--
function UnitFoundingException( unit, unitclass, city )

  -- early founding units
  if unitclass=="UNITCLASS_TRIBE_SPLIT" or unitclass=="UNITCLASS_SETTLER" then

    if not city:IsHasBuilding( "BUILDING_OPEN_SHELTER" ) then -- TODO: or ERA past a certain point
      city:SetPopulation( city:GetPopulation() - 1, true )
    end

  end

end


--
-- UnitBuildingPromotion
--
-- @param {Unit} unit - the unit object instance
-- @param {UnitType} unittype - this is the type name (e.g. "UNIT_WARRIOR")
-- @param {City} city - the city object instance
--
-- Checks the custom table, Building_UnitPromotions to see if the unit is 
-- elligible for a promotion based on the existence of a building and the 
-- unit type.
--
function UnitBuildingPromotion(unit, unittype, city)

  logger:debug( "[ubp] f:UnitBuildingPromotion" )

  logger:debug( "[ubp] unitType:" .. unittype )

  for row in GameInfo.Building_UnitPromotions{UnitType=unittype} do
    logger:debug( "[ubp] row building:" .. row.BuildingType .. "   row promo:" .. row.UnitPromotionType )
    local promo = GameInfo.UnitPromotions[row.UnitPromotionType].ID
    logger:debug( "[ubp] promo id: " .. promo )
    if not unit:IsHasPromotion(promo) and city:IsHasBuilding(GameInfo.Buildings[row.BuildingType].ID) then
      logger:debug( "[ubp] setting promotion " .. row.UnitPromotionType .. " for unit " .. unittype .. " with id " .. unit:GetID() )
      unit:SetHasPromotion(promo, true);
    end
  end

end

--
-- SetUnitHomeCity
--
-- @param {Unit} unit
-- @param {City} city
--
-- Remember and save the speciic unit's home city. I am currently finding the
-- closes city upon creation and passing to this function.
--
-- I believe there ia another way to do this and I could not find it. 
--
-- * PLEASE LET ME KNOW IF YOU HAPPEN KNOW ANOTHER AND BETTER WAY TO DO THIS. *
--
function SetUnitHomeCity(unit, city)

  save( unit, "homecity", city ) 




end

-- FindCity
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
function FindCity(plotStart, radius)

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


  -- debug -- lots of debug, some of it to find out what certain function do
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


  return city;

end


































--[[



==============================================================================
Unit: Lua Game Object
==============================================================================

AirSweepCombatMod                     GetLevel
At                                    GetMaxAttackStrength
AtPlot                                GetMaxDefenseStrength
AttackFortifiedModifier               GetMaxHitPoints
AttackWoundedModifier                 GetMaxRangedCombatStrength
AttackXPValue                         GetMoves
CanAcquirePromotion                   GetName
CanAcquirePromotionAny                GetNameKey
CanAirAttack                          GetNumEnemyUnitsAdjacent
CanAirDefend                          GetNumResourceNeededToUpgrade
CanAirlift                            GetOutsideFriendlyLandsModifier
CanAirliftAt                          GetOwner
CanAirPatrol                          GetPathEndTurnPlot
CanAutomate                           GetPillageChange
CanBuild                              GetPlot
CanBuildRoute                         GetRangeCombatDamage
CanBuildSpaceship                     GetRangedCombatLimit
CanCargoAllMove                       GetReconPlot
CanCoexistWithEnemyUnit               GetRiverCrossingNoPenaltyCount
CanConstruct                          GetSameTileHeal
CanDiscover                           GetScrapGold
CanDisembark                          GetScriptData
CanDisembarkOnto                      GetSeeInvisibleType
CanDistanceGift                       GetSpecialUnitType
CanDoCommand                          GetStrategicResourceCombatPenalty
CanEmbark                             GetTeam
CanEmbarkOnto                         GetTradeGold
CanEnterTerritory                     GetTransportUnit
CanFortify                            GetUnitAICargo
CanFound                              GetUnitAIType
CanGift                               GetUnitClassModifier
CanGiveExperience                     GetUnitClassType
CanGoldenAge                          GetUnitCombatType
CanHeal                               GetUnitFlagIconOffset
CanHold                               GetUnitPortraitOffset
CanJoin                               GetUnitType
CanLead                               GetUpgradeDiscount
CanLoad                               GetUpgradeUnitType
CanLoadUnit                           GetVisualOwner
CanMove                               GetX
CanMoveAllTerrain                     GetY
CanMoveImpassable                     GiveExperience
CanMoveOrAttackInto                   HasCargo
CanMoveThrough                        HasMoved
CanNuke                               HillsAttackModifier
CanNukeAt                             HillsDefenseModifier
CanParadrop                           IgnoreBuildingDefense
CanParadropAt                         IgnoreTerrainCost
CanPillage                            ImmuneToFirstStrikes
CanPromote                            IsActionRecommended
CanRangeStrike                        IsAlwaysHeal
CanRangeStrikeAt                      IsAmphib
CanRebaseAt                           IsAttacking
CanScrap                              IsAutomated
CanSentry                             IsBarbarian
CanSetUpForRangedAttack               IsBetterDefenderThan
CanSiege                              IsBlitz
CanSleep                              IsCanAttack
CanStartMission                       IsCanAttackRanged
CanTrade                              IsCanAttackWithMove
CanUnload                             IsCanAttackWithMoveNow
CanUnloadAll                          IsCanDefend
CanUpgradeRightNow                    IsCargo
CargoSpace                            IsCombatUnit
CargoSpaceAvailable                   IsDead
ChanceFirstStrikes                    IsDefending
ChangeCargoSpace                      IsEmbarked
ChangeDamage                          IsEnemyCityAdjacent
ChangeExperience                      IsEnemyInMovementRange
ChangeLevel                           IsEnemyRoute
ChangeMoves                           IsEverFortifyable
CityAttackModifier                    IsFeatureDoubleMove
CityDefenseModifier                   IsFighting
Convert                               IsFortifyable
CurrInterceptionProbability           IsFound
DefenseXPValue                        IsFriendlyUnitAdjacent
DoCommand                             IsFull
DomainCargo                           IsGarrisoned
DomainModifier                        IsGoldenAge
Embark                                IsHasPromotion
EvasionProbability                    IsHealOutsideFriendly
ExperienceNeeded                      IsHillsDoubleMove
FeatureAttackModifier                 IsHuman
FeatureDefenseModifier                IsHurt
FinishMoves                           IsImmobile
FirstStrikes                          IsInCombat
FlatMovementCost                      IsInvisible
FlavorValue                           IsMustSetUpToRangedAttack
FortifyModifier                       IsNearGreatGeneral
GeneratePath                          IsNeverInvisible
GetAdjacentModifier                   IsNoBadGoodies
GetAdjacentTileHeal                   IsNoCapture
GetAirCombatDamage                    IsNone
GetAmphibCount                        IsNukeImmune
GetArea                               IsNukeVictim
GetAttackModifier                     IsOnlyDefensive
GetBaseCombatStrength                 IsOutOfAttacks
GetBaseRangedCombatStrength           isOutOfInterceptions
GetBestInterceptor                    IsPromotionReady
GetBestSeaPillageInterceptor          IsPromotionValid
GetBlitzCount                         IsRangeAttackIgnoreLOS
GetBuildType                          IsRangeAttackOnlyInDomain
GetCaptureUnitType                    IsRanged
GetCargo                              IsRivalTerritory
GetCivilizationType                   IsRiverCrossingNoPenalty
GetCombatDamage                       IsSelected
GetCombatLimit                        IsSetUpForRangedAttack
GetCombatOwner                        IsTerrainDoubleMove
GetCurrHitPoints                      IsWaiting
GetDamage                             IsWork
GetDeclareWarRangeStrike              JumpToNearestValidPlot
GetDefenseModifier                    Kill
GetDomainType                         LastMissionPlot
GetDropRange                          Lead
GetExperience                         MaxFirstStrikes
GetExperiencePercent                  MaxInterceptionProbability
GetExtraAttackFortifiedMod            MaxMoves
GetExtraAttackWoundedMod              MaxXPValue
GetExtraChanceFirstStrikes            MovesLeft
GetExtraCityAttackPercent             NoDefensiveBonus
GetExtraCityDefensePercent            NukeDamageLevel
GetExtraCombatPercent                 OpenAttackModifier
GetExtraDomainModifier                OpenDefenseModifier
GetExtraEnemyHeal                     OpenRangedAttackModifier
GetExtraEvasion                       PopMission
GetExtraFeatureAttackPercent          Promote
GetExtraFeatureDefensePercent         PushMission
GetExtraFirstStrikes                  Range
GetExtraFriendlyHeal                  RangeStrike
GetExtraHillsAttackPercent            RotateFacingDirectionClockwise
GetExtraHillsDefensePercent           RotateFacingDirectionCounterClockwise
GetExtraIntercept                     RoughAttackModifier
GetExtraMoveDiscount                  RoughDefenseModifier
GetExtraMoves                         RoughRangedAttackModifier
GetExtraNeutralHeal                   SetBaseCombatStrength
GetExtraOpenAttackPercent             SetDamage
GetExtraOpenDefensePercent            SetEmbarked
GetExtraOpenRangedAttackMod           SetExperience
GetExtraRange                         SetHasPromotion
GetExtraRoughAttackPercent            SetHotKeyNumber
GetExtraRoughRangedAttackMod          SetLeaderUnitType
GetExtraTerrainAttackPercent          SetLevel
GetExtraTerrainDefensePercent         SetMadeAttack
GetExtraUnitCombatModifier            SetMadeInterception
GetExtraVisibilityRange               SetMoves
GetExtraWithdrawal                    SetName
GetFacingDirection                    SetPromotionReady
GetFireSupportUnit                    SetReconPlot
GetFortifyTurns                       SetScriptData
GetFriendlyLandsAttackModifier        SetXY
GetFriendlyLandsModifier              SpecialCargo
GetGameTurnCreated                    TerrainAttackModifier
GetGarrisonedCity                     TerrainDefenseModifier
GetGoldenAgeTurns                     UnitClassAttackModifier
GetHandicapType                       UnitClassDefenseModifier
GetHotKeyNumber                       UnitCombatModifier
GetID                                 UpgradePrice
GetInvisibleType                      VisibilityRange
GetKamikazePercent                    WithdrawalProbability
GetLastMoveTurn                       WorkRate
GetLeaderUnitType                     









==============================================================================
Units API
==============================================================================

Area.GetNumUnits
Area.GetUnitsPerPlayer

City.CanPlaceUnitHere
City.CanWork
City.ChangeGreatPeopleUnitProgress
City.ChangeUnitProduction
City.GetConscriptUnit
City.GetFaithPurchaseUnitTooltip
City.GetFirstUnitOrder
City.GetGarrisonedUnit
City.GetGreatPeopleUnitProgress
City.GetGreatPeopleUnitRate
City.GetNumTrainUnitAI
City.GetProductionUnit
City.GetProductionUnitAI
City.GetPurchaseUnitTooltip
City.GetSpecialistUpgradeThreshold
City.GetUnitCombatFreeExperience
City.GetUnitFaithPurchaseCost
City.GetUnitProduction
City.GetUnitProductionModifier
City.GetUnitProductionNeeded
City.GetUnitProductionTurnsLeft
City.GetUnitPurchaseCost
City.IsProductionAutomated
City.IsProductionUnit
City.IsUnitFoodProduction
City.RangeCombatUnitDefense
City.SetGreatPeopleUnitProgress
City.SetProductionAutomated
City.SetUnitProduction

Deal.AddUnitTrade
Deal.RemoveUnitTrade

Events.AddUnitMoveHexRangeHex
Events.ClearUnitMoveHexRange
Events.LocalMachineUnitPositionChanged
Events.SerialEventUnitCreated
Events.SerialEventUnitDestroyed
Events.SerialEventUnitFlagSelected
Events.SerialEventUnitInfoDirty
Events.SerialEventUnitMove
Events.SerialEventUnitMoveToHexes
Events.SerialEventUnitSetDamage
Events.SerialEventUnitTeleportedToHex
Events.StartUnitMoveHexRange
Events.UnitActionChanged
Events.UnitDataEdited
Events.UnitDataRequested
Events.UnitDebugFSM
Events.UnitEmbark
Events.UnitFlagUpdated
Events.UnitGarrison
Events.UnitHexHighlight
Events.UnitLibrarySwap
Events.UnitMarkThreatening
Events.UnitMemberCombatStateChanged
Events.UnitMemberCombatTargetChanged
Events.UnitMemberOverlayAdd
Events.UnitMemberOverlayRemove
Events.UnitMemberOverlayShowHide
Events.UnitMemberPositionChanged
Events.UnitMoveQueueChanged
Events.UnitSelectionChanged
Events.UnitSelectionCleared
Events.UnitShouldDimFlag
Events.UnitStateChangeDetected
Events.UnitTypeChanged
Events.UnitVisibilityChanged

Game.CityPurchaseUnit
Game.CountTotalNukeUnits
Game.CyclePlotUnits
Game.CycleUnits
Game.DoMinorBullyUnit
Game.GetBestLandUnit
Game.GetBestLandUnitCombat
Game.GetImprovementUpgradeTime
Game.GetNumResourceRequiredForUnit
Game.GetUnitClassCreatedCount
Game.GetUnitCreatedCount
Game.GetUnitUpgradesTo
Game.IsSpecialUnitValid
Game.IsUnitClassMaxedOut
Game.IsUnitEverActive
Game.IsUnitRecommended
Game.MakeSpecialUnitValid

GameEvents.PlayerPreAIUnitUpdate
GameEvents.UnitGetSpecialExploreTarget
GameEvents.UnitSetXY

GetHelpTextForUnit

GetUnitsString

LuaEvents.ScenarioUnitTiersChanged

Network.SendGiftUnit
Network.SendMinorNoUnitSpawning
Network.SendRenameUnit

OptionsManager.GetAutoUnitCycle Cached
OptionsManager.SetAutoUnitCycle Cached

Player.AddFreeUnit
Player.CalculateUnitCost
Player.CalculateUnitSupply
Player.CanMajorBullyUnit
Player.ChangeGarrisonedCityRangeStrikeModifier
Player.ChangeGoldPerUnitTimes100
Player.ChangeHappinessPerGarrisonedUnit
Player.ChangeNumUnitGoldenAges
Player.ChangeUnhappinessFromUnits
Player.DisbandUnit
Player.GetAdvancedStartUnitCost
Player.GetAnyUnitHasOrderToGoody
Player.GetCapitalSettlerProductionModifier
Player.GetExtraUnitCost
Player.GetFirstReadyUnit
Player.GetFirstReadyUnitPlot
Player.GetGarrisonedCityRangeStrikeModifier
Player.GetGoldPerMilitaryUnit
Player.GetGoldPerUnit
Player.GetHappinessFromGarrisonedUnits
Player.GetHappinessPerGarrisonedUnit
Player.GetHappyPerMilitaryUnit
Player.GetHighestUnitLevel
Player.GetImprovementUpgradeRate
Player.GetImprovementUpgradeRateModifier
Player.GetMinorCivUniqueUnit
Player.GetNumMaintenanceFreeUnits
Player.GetNumMilitaryUnits
Player.GetNumNukeUnits
Player.GetNumOutsideUnits
Player.GetNumUnitGoldenAges
Player.GetNumUnits
Player.GetNumUnitsOutOfSupply
Player.GetNumUnitsSupplied
Player.GetNumUnitsSuppliedByCities
Player.GetNumUnitsSuppliedByHandicap
Player.GetNumUnitsSuppliedByPopulation
Player.GetRecommendedWorkerPlots
Player.GetSettlerProductionModifier
Player.GetUnhappinessFromUnits
Player.GetUnitBaktun
Player.GetUnitByID
Player.GetUnitClassCount
Player.GetUnitClassCountPlusMaking
Player.GetUnitClassMaking
Player.GetUnitProductionMaintenanceMod
Player.GetUnitProductionModifier
Player.GetUnitProductionNeeded
Player.GetWorkerSpeedModifier
Player.HasBusyMovingUnit
Player.HasBusyUnit
Player.HasReadyUnit
Player.InitUnit
Player.IsMinorCivHasUniqueUnit
Player.IsMinorCivUnitSpawningDisabled
Player.IsProductionMaxedUnitClass
Player.IsUnitClassMaxedOut
Player.KillUnits
Player.SetHappinessPerGarrisonedUnit
Player.Units
Player.UnitsGoldenAgeCapable
Player.UnitsGoldenAgeReady
Player.UnitsRequiredForGoldenAge

Plot.ChangeUpgradeProgress
Plot.CountNumAirUnits
Plot.GetNumFriendlyUnitsOfType
Plot.GetNumUnits
Plot.GetSelectedUnit
Plot.GetUnit
Plot.GetUnitPower
Plot.GetUpgradeProgress
Plot.GetUpgradeTimeLeft
Plot.IsPotentialCityWork
Plot.IsPotentialCityWorkForArea
Plot.IsUnit
Plot.IsVisibleEnemyUnit
Plot.IsVisibleOtherUnit
Plot.SetUpgradeProgress

Team.ChangeWaterWorkCount
Team.CountNumUnitsByArea
Team.GetNumNukeUnits
Team.GetUnitClassCount
Team.GetUnitClassCountPlusMaking
Team.GetUnitClassMaking
Team.GetWaterWorkCount
Team.IsUnitClassMaxedOut
Team.IsWaterWork

UI.CanPlaceUnitAt
UI.CanSelectionListWork
UI.ClearPlaceUnit
UI.GetHeadSelectedUnit
UI.GetPlaceUnit
UI.SelectUnit
UI.SetPlaceUnit

Unit.CanAirPatrol
Unit.CanCoexistWithEnemyUnit
Unit.CanHold
Unit.CanLoadUnit
Unit.CanUpgradeRightNow
Unit.ExecuteSpecialExploreMove
Unit.GetCaptureUnitType
Unit.GetEmbarkedUnitDefense
Unit.GetExtraUnitCombatModifier
Unit.GetFireSupportUnit
Unit.GetGarrisonedCity
Unit.GetLeaderUnitType
Unit.GetNumEnemyUnitsAdjacent
Unit.GetNumResourceNeededToUpgrade
Unit.GetSpecialUnitType
Unit.GetTransportUnit
Unit.GetUnitAICargo
Unit.GetUnitAIType
Unit.GetUnitClassModifier
Unit.GetUnitClassType
Unit.GetUnitCombatType
Unit.GetUnitFlagIconOffset
Unit.GetUnitPortraitOffset
Unit.GetUnitType
Unit.GetUpgradeDiscount
Unit.GetUpgradeUnitFromPlot
Unit.GetUpgradeUnitType
Unit.IsAutomated
Unit.IsCombatUnit
Unit.IsFriendlyUnitAdjacent
Unit.IsGarrisoned
Unit.IsWork
Unit.RotateFacingDirectionClockwise
Unit.RotateFacingDirectionCounterClockwise
Unit.SetLeaderUnitType
Unit.UnitClassAttackModifier
Unit.UnitClassDefenseModifier
Unit.UnitCombatModifier
Unit.UpgradePrice
Unit.WorkRate

UnitMoving















==============================================================================
Unit (Civ5 Type)
==============================================================================


------------------------------------------------------------------------------
Instance Methods
------------------------------------------------------------------------------
Methods are functions that belong to an object. Instance methods are invoked through a colon, as in caller:SomeMethod(<args>), where caller is an instance of Unit.
A colon implictly passes the caller object as the first argument. That is, the former call is equivalent to this one: caller.SomeMethod(caller, <args>)

int                       AirSweepCombatMod()
bool                      At(int x, int y)
int                       AtPlot(Plot plot)
int                       AttackFortifiedModifier()
int                       AttackWoundedModifier()
int                       AttackXPValue()
bool                      CanAcquirePromotion(PromotionType promotion)
bool                      CanAcquirePromotionAny()
bool                      CanAirAttack()
bool                      CanAirDefend(Plot plot)
bool                      CanAirlift(Plot plot)
bool                      CanAirliftAt(Plot plot, int x, int y)
bool                      CanAirPatrol(Plot plot)
bool                      CanAutomate(AutomateType automate)
bool                      CanBuild(Plot plot, BuildActionType build, bool testVisible = false, bool testGold = true)
bool                      CanBuildRoute()
bool                      CanBuildSpaceship(Plot plot, bool visible)
bool                      CanCargoAllMove()
bool                      CanCoexistWithEnemyUnit(TeamID team)
bool                      CanConstruct(Plot plot, BuildingType building)
bool                      CanDiscover(Plot plot)
bool                      CanDisembark(Plot plot)
bool                      CanDisembarkOnto(Plot plot)
bool                      CanDistanceGift(TaskType toPlayer)
bool                      CanDoCommand(CommandType command, int data1, int data2, bool testVisible = false, bool testBusy = true)
bool                      CanEmbark(Plot plot)
bool                      CanEmbarkOnto(Plot plot, Plot targetPlot)
bool                      CanEnterTerritory(TeamID team, bool ignoreRightOfPassage = false, bool isCity = false)
bool                      CanFortify(Plot plot)
bool                      CanFound(Plot plot, bool testVisible = false)
bool                      CanGift(bool testVisible = false, bool testTransport = false)
bool                      CanGiveExperience(Plot plot)
bool                      CanGoldenAge(Plot plot, bool testVisible)
int                       CanHeal(Plot plot)
bool                      CanHold(Plot plot)
bool                      CanJoin(Plot plot, SpecialistType specialist)
bool                      CanLead(Plot plot, int unitId)
bool                      CanLoad(Plot plot)
bool                      CanLoadUnit(Unit unit, Plot plot)
bool                      CanMove()
bool                      CanMoveAllTerrain()
bool                      CanMoveImpassable()
bool                      CanMoveOrAttackInto(Plot plot, bool declareWar = false, bool destination = false)
bool                      CanMoveThrough(Plot plot)
int                       CanNuke(Plot plot)
bool                      CanNukeAt(Plot plot, int x, int y)
bool                      CanParadrop(Plot plot, bool arg1)
bool                      CanParadropAt(Plot plot, int x, int y)
bool                      CanPillage(Plot plot)
bool                      CanPromote(PromotionType promotion, int leaderUnitId)
int                       CanRangeStrike()
int                       CanRangeStrikeAt(int x, int y, bool arg2 = nil, bool noncombatAllowed = nil)
bool                      CanRebaseAt(Plot sourcePlot, int targetX, int targetY)
                          CanRepairFleet
bool                      CanScrap()
bool                      CanSentry(Plot plot)
bool                      CanSetUpForRangedAttack()
bool                      CanSiege(TeamID team)
bool                      CanSleep(Plot plot)
bool                      CanStartMission(int mission, int data1, int data2, Plot plot = nil, bool testVisible = false)
bool                      CanTrade(Plot plot, bool testVisible)
bool                      CanUnload()
bool                      CanUnloadAll()
int                       CanUpgradeRightNow()
int                       CapitalDefenseFalloff()
int                       CapitalDefenseModifier()
int                       CargoSpace()
int                       CargoSpaceAvailable(SpecialUnitType specialCargo, DomainType domainCargo)
int                       ChanceFirstStrikes()
                          ChangeCargoSpace(int change)
                          ChangeDamage(int change, PlayerID player)
                          ChangeExperience(int change, int max = -1, bool fromCombat = false, bool inBorders = false, bool updateGlobal = false)
                          ChangeLevel(int change)
                          ChangeMoves(int change)
int                       CityAttackModifier()
int                       CityDefenseModifier()
                          Convert(Unit unit)
int                       CurrInterceptionProbability()
int                       DefenseXPValue()
                          DoCommand(CommandType command, int data1, int data2)
DomainType                DomainCargo()
int                       DomainModifier(DomainType domain)
                          Embark(Plot plot)
int                       EvasionProbability()
                          ExecuteSpecialExploreMove(Plot targetPlot)
int                       ExperienceNeeded()
int                       FeatureAttackModifier(FeatureType feature)
int                       FeatureDefenseModifier(FeatureType feature)
                          FinishMoves
int                       FirstStrikes()
int                       FlankAttackModifier()
bool                      FlatMovementCost()
int                       FlavorValue(FlavorType flavor)
int                       FortifyModifier()
bool                      GeneratePath(Plot toPlot, int flags = 0, bool reuse = false, unknown piPathTurns = nil)
ActivityType              GetActivityType()
int                       GetAdjacentModifier()
int                       GetAdjacentTileHeal()
int                       GetAirCombatDamage(Unit defender)
int                       GetAmphibCount()
Area                      GetArea()
int                       GetAttackModifier()
int                       GetBaseCombatStrength()
int                       GetBaseRangedCombatStrength()
unknown                   GetBestInterceptor(Plot plot)
unknown                   GetBestSeaPillageInterceptor(Plot plot)
int                       GetBlitzCount()
BuildActionType           GetBuildType()
UnitType                  GetCaptureUnitType(CivilizationType civilization)
int                       GetCargo()
CivilizationType          GetCivilizationType()
int                       GetCombatDamage(int strength, int opponentStrength, int currentDamage, bool includeRand = true, bool attackerIsCity = false, bool defenderIsCity = false)
int                       GetCombatLimit()
int                       GetCombatOwner(TeamID forTeam)
unknown                   GetConversionStrength()
int                       GetCurrHitPoints()
int                       GetDamage()
TeamID                    GetDeclareWarRangeStrike(Plot plot)
int                       GetDefenseModifier()
DomainType                GetDomainType()
int                       GetDropRange()
int                       GetEmbarkedUnitDefense()
int                       GetExperience()
int                       GetExperiencePercent()
int                       GetExtraAttackFortifiedMod()
int                       GetExtraAttackWoundedMod()
int                       GetExtraChanceFirstStrikes()
int                       GetExtraCityAttackPercent()
int                       GetExtraCityDefensePercent()
int                       GetExtraCombatPercent()
int                       GetExtraDomainModifier(DomainType index)
int                       GetExtraEnemyHeal()
int                       GetExtraEvasion()
int                       GetExtraFeatureAttackPercent(FeatureType index)
int                       GetExtraFeatureDefensePercent(FeatureType index)
int                       GetExtraFirstStrikes()
int                       GetExtraFriendlyHeal()
int                       GetExtraHillsAttackPercent()
int                       GetExtraHillsDefensePercent()
int                       GetExtraIntercept()
int                       GetExtraMoveDiscount()
int                       GetExtraMoves()
int                       GetExtraNeutralHeal()
int                       GetExtraOpenAttackPercent()
int                       GetExtraOpenDefensePercent()
int                       GetExtraOpenRangedAttackMod()
int                       GetExtraRange()
int                       GetExtraRoughAttackPercent()
int                       GetExtraRoughRangedAttackMod()
int                       GetExtraTerrainAttackPercent(TerrainType index)
int                       GetExtraTerrainDefensePercent(TerrainType index)
int                       GetExtraUnitCombatModifier(UnitCombatType index)
int                       GetExtraVisibilityRange()
int                       GetExtraWithdrawal()
int                       GetFacingDirection()
Unit                      GetFireSupportUnit(PlayerID defender, int x, int y)
int                       GetFortifyTurns()
int                       GetFriendlyLandsAttackModifier()
int                       GetFriendlyLandsModifier()
int                       GetGameTurnCreated()
int                       GetGarrisonedCity()
int                       GetGoldenAgeTurns()
int                       GetGreatGeneralCombatModifier()
HandicapType              GetHandicapType()
int                       GetHotKeyNumber()
UnitID                    GetID()
InvisibilityScopeType     GetInvisibleType()
int                       GetKamikazePercent()
int                       GetLastMoveTurn()
unknown                   GetLeaderUnitType()
int                       GetLevel()
ReligionType              GetMajorityReligionAfterSpread()
int                       GetMaxAttackStrength(Plot fromPlot, Plot toPlot, Unit defender)
int                       GetMaxDefenseStrength(Plot inPlot, Unit attacker, bool arg2 = nil)
int                       GetMaxHitPoints()
int                       GetMaxRangedCombatStrength(Unit other, int attacking, bool arg2, bool arg3)
int                       GetMoves()
string                    GetName()
string                    GetNameKey()
unknown                   GetNameNoDesc()
int                       GetNearbyImprovementModifier()
int                       GetNumEnemyUnitsAdjacent(Unit otherUnit)
int                       GetNumFollowersAfterSpread()
int                       GetNumResourceNeededToUpgrade(ResourceType resourceLoop)
int                       GetOriginalOwner()
int                       GetOutsideFriendlyLandsModifier()
PlayerID                  GetOwner()
unknown                   GetPathEndTurnPlot()
int                       GetPillageChange()
Plot                      GetPlot()
int                       GetRangeCombatDamage(Unit defender, City city, bool includeRand)
int                       GetRangedAttackModifier()
int                       GetRangedCombatLimit()
unknown                   GetReconPlot()
ReligionType              GetReligion()
int                       GetReverseGreatGeneralModifier()
int                       GetRiverCrossingNoPenaltyCount()
int                       GetSameTileHeal()
                          GetScenarioData
bool                      GetScrapGold()
string                    GetScriptData()
InvisibilityScopeType     GetSeeInvisibleType()
SpecialUnitType           GetSpecialUnitType()
int                       GetSpreadsLeft()
int                       GetStrategicResourceCombatPenalty()
TeamID                    GetTeam()
int                       GetTradeGold(Plot plot)
unknown                   GetTransportUnit()
int                       GetUnitAICargo(UnitAIType unitAI)
UnitAIType                GetUnitAIType()
int                       GetUnitClassModifier(UnitClassType index)
UnitClassType             GetUnitClassType()
UnitCombatType            GetUnitCombatType()
unknown                   GetUnitFlagIconOffset()
unknown                   GetUnitPortraitOffset()
UnitType                  GetUnitType()
int                       GetUpgradeDiscount()
Unit                      GetUpgradeUnitFromPlot(Plot adjacentPlot)
UnitType                  GetUpgradeUnitType()
int                       GetVisualOwner()
int                       GetX()
int                       GetY()
bool                      GiveExperience()
bool                      HasCargo()
bool                      HasMoved()
bool                      HasName()
int                       HillsAttackModifier()
int                       HillsDefenseModifier()
bool                      IgnoreBuildingDefense()
bool                      IgnoreTerrainCost()
bool                      ImmuneToFirstStrikes()
bool                      IsActionRecommended(ActionType action)
bool                      IsAlwaysHeal()
bool                      IsAmphib()
bool                      IsAttacking()
bool                      IsAutomated()
bool                      IsBarbarian()
bool                      IsBetterDefenderThan(Unit defender, Unit attacker)
bool                      IsBlitz()
bool                      IsBusy()
int                       IsCanAttack()
bool                      IsCanAttackRanged()
bool                      IsCanAttackWithMove()
bool                      IsCanAttackWithMoveNow()
bool                      IsCanDefend(Plot plot)
int                       IsCargo()
bool                      IsCityAttackOnly()
int                       IsCombatUnit()
int                       IsDead()
bool                      IsDefending()
int                       IsDelayedDeath()
int                       IsEmbarked()
int                       IsEnemyCityAdjacent()
bool                      IsEnemyInMovementRange(bool arg0, bool arg1)
bool                      IsEnemyRoute()
bool                      IsEverFortifyable()
bool                      IsFeatureDoubleMove(FeatureType index)
bool                      IsFighting()
bool                      IsFortifyable()
int                       IsFound()
bool                      IsFriendlyUnitAdjacent(bool combatUnit)
bool                      IsFull()
int                       IsGarrisoned()
bool                      IsGoldenAge()
                          IsGreatPerson
bool                      IsHasPromotion(PromotionType promotion)
bool                      IsHealOutsideFriendly()
int                       IsHigherTechThan(UnitType arg0)
bool                      IsHillsDoubleMove()
bool                      IsHuman()
int                       IsHurt()
bool                      IsImmobile()
bool                      IsInCombat()
bool                      IsInvisible(TeamID team, bool debug, bool checkCargo = false)
int                       IsLargerCivThan(Unit myUnit)
int                       IsMustSetUpToRangedAttack()
bool                      IsNearGreatGeneral()
bool                      IsNeverInvisible()
bool                      IsNoBadGoodies()
bool                      IsNoCapture()
bool                      IsNone()
bool                      IsNukeImmune()
bool                      IsNukeVictim(Plot plot, TeamID team)
bool                      IsOnlyDefensive()
bool                      IsOutOfAttacks()
bool                      isOutOfInterceptions()
bool                      IsPromotionReady()
bool                      IsPromotionValid(PromotionType promotion)
bool                      IsRangeAttackIgnoreLOS(Plot plot)
int                       IsRangeAttackOnlyInDomain()
int                       IsRanged()
int                       IsReadyToMove()
bool                      IsRivalTerritory()
bool                      IsRiverCrossingNoPenalty()
int                       IsSelected(unknown void)
bool                      IsSetUpForRangedAttack()
int                       IsStackedGreatGeneral()
bool                      IsTerrainDoubleMove(TerrainType index)
bool                      IsWaiting()
bool                      IsWork()
                          JumpToNearestValidPlot()
                          Kill(bool delay, PlayerID player = NO_PLAYER)
                          LastMissionPlot
bool                      Lead(int unitId)
int                       MaxFirstStrikes()
int                       MaxInterceptionProbability()
int                       MaxMoves()
int                       MaxXPValue()
int                       MovesLeft()
bool                      NoDefensiveBonus()
int                       NukeDamageLevel()
int                       OpenAttackModifier()
int                       OpenDefenseModifier()
int                       OpenRangedAttackModifier()
                          PopMission
                          Promote(PromotionType promotion, int leaderUnitId)
                          PushMission(MissionType mission, int data1 = -1, int data2 = -1, int flags = 0, bool append = false, bool manual = fa;se, MissionType missionAI = NO_MISSIONAI, Plot missionAIPlot = nil, Unit missionAIUnit = nil)
int                       Range()
                          RangeStrike(int x, int y)
                          RotateFacingDirectionClockwise
                          RotateFacingDirectionCounterClockwise
int                       RoughAttackModifier()
int                       RoughDefenseModifier()
int                       RoughRangedAttackModifier()
                          SetBaseCombatStrength(int combat)
                          SetDamage(int newValue, PlayerID player, bool notifyEntity = true)
                          SetDeployFromOperationTurn(int arg0)
                          SetEmbarked(bool newValue)
                          SetExperience(int newValue, int max = -1)
                          SetHasPromotion(PromotionType index, bool newValue)
                          SetHotKeyNumber(int newValue)
                          SetLeaderUnitType(UnitType leaderUnitType)
                          SetLevel(int newLevel)
                          SetMadeAttack(bool newValue)
                          SetMadeInterception(bool newValue)
                          SetMoves(int newValue)
                          SetName(string newValue)
                          SetOriginalOwner(PlayerID oldOwner)
                          SetPromotionReady(bool newValue)
                          SetReconPlot(Plot newValue)
                          SetScenarioData
                          SetScriptData(string newValue)
                          SetXY(int x, int y, bool group = false, bool update = true, bool show = false, bool checkPlotVisible = false)
                          SpecialCargo
int                       TerrainAttackModifier(TerrainType terrain)
int                       TerrainDefenseModifier(TerrainType terrain)
int                       UnitClassAttackModifier(UnitClassType unitClass)
int                       UnitClassDefenseModifier(UnitClassType unitClass)
int                       UnitCombatModifier(UnitCombatType unitCombat)
int                       UpgradePrice(UnitType unit)
int                       VisibilityRange()
int                       WithdrawalProbability()
int                       WorkRate(bool max, BuildActionType build = nil)


------------------------------------------------------------------------------
Used by
------------------------------------------------------------------------------

                          City:     AddProductionExperience(Unit unit, bool conscript = false)
Unit                      City:     GetGarrisonedUnit()
int                       City:     RangeCombatDamage(Unit theirUnit, unknown arg1)
int                       City:     RangeCombatUnitDefense(Unit theirUnit)
CombatPredictionType      Game.     GetCombatPrediction(Unit myUnit, Unit theirUnit)
bool                      Player:   CanReceiveGoody(Plot plot, GoodyType goody, Unit unit)
                          Player:   CreateGreatGeneral(Unit eGreatPersonUnit, bool incrementThreshold, bool incrementExperience, int x, int y)
                          Player:   DoGoody(Plot plot, Unit unit)
Unit                      Player:   GetFirstReadyUnit()
Unit                      Player:   GetUnitByID(UnitID unit)
Unit                      Player:   InitUnit(UnitType unit, ResourceType x, ResourceType y, UnitAIType unitAI = NO_UNITAI, DirectionType facingDirection = NO_DIRECTION)
                          Player:   ReceiveGoody(Plot plot, GoodyType goody, Unit unit)
iterator(Unit)            Player:   Units()
unknown                   Plot:     GetBestDefender(PlayerID owner, PlayerID attackingPlayer, Unit attacker, bool testAtWar, bool testPotentialEnemy, bool testCanMove)
int                       Plot:     GetNumFriendlyUnitsOfType(Unit unit)
int                       Plot:     GetNumVisibleEnemyDefenders(Unit unit)
int                       Plot:     GetNumVisiblePotentialEnemyDefenders(Unit unit)
Unit                      Plot:     GetUnit(UnitID id)
int                       Plot:     IsEnemyCity(Unit unit)
bool                      Plot:     IsFriendlyCity(Unit unit, bool checkImprovement)
bool                      Plot:     IsValidDomainForAction(Unit unit)
bool                      Plot:     IsValidDomainForLocation(Unit unit)
int                       Plot:     IsVisibleEnemyDefender(Unit unit)
int                       Plot:     MovementCost(Unit unit, Plot fromPlot)
                          Plot:     NukeExplosion(int range, Unit nukeUnit)
Unit                      UI.       GetHeadSelectedUnit()
                          UI.       HighlightCanPlacePlots(Unit unit, Plot arg1)
                          UI.       SelectUnit(Unit v)
                          UI.       SetPlaceUnit(Unit unit)
bool                      Unit:     CanLoadUnit(Unit unit, Plot plot)
                          Unit:     Convert(Unit unit)
int                       Unit:     GetAirCombatDamage(Unit defender)
Unit                      Unit:     GetFireSupportUnit(PlayerID defender, int x, int y)
int                       Unit:     GetMaxAttackStrength(Plot fromPlot, Plot toPlot, Unit defender)
int                       Unit:     GetMaxDefenseStrength(Plot inPlot, Unit attacker, bool arg2 = nil)
int                       Unit:     GetMaxRangedCombatStrength(Unit other, int attacking, bool arg2, bool arg3)
int                       Unit:     GetNumEnemyUnitsAdjacent(Unit otherUnit)
int                       Unit:     GetRangeCombatDamage(Unit defender, City city, bool includeRand)
Unit                      Unit:     GetUpgradeUnitFromPlot(Plot adjacentPlot)
bool                      Unit:     IsBetterDefenderThan(Unit defender, Unit attacker)
int                       Unit:     IsLargerCivThan(Unit myUnit)
                          Unit:     PushMission(MissionType mission, int data1 = -1, int data2 = -1, int flags = 0, bool append = false, bool manual = fa;se, MissionType missionAI = NO_MISSIONAI, Plot missionAIPlot = nil, Unit missionAIUnit = nil)


--]]