/*  ╒══════════════════════════════════════════════════════════════════════════╕
 *  │
 *  │ BUILDINGS 
 *  │ - includes wonders, specials, and others
 *  │ 
 *  │
 *  │
 *  │
 *  │
 *  │
 *  ╘══════════════════════════════════════════════════════════════════════════╛
 */


--  ┌──────────────────────────────────────────────────────────────────────────┐
--  │
--  │ TABLE MODIFICATIONS 
--  │
--  └──────────────────────────────────────────────────────────────────────────┘







--
--    TABLE ADDITIONS
--
--    ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●


-- building, palace/capitol, palace_addition, wonder, national_wonder, 
-- special_wonder, prereq
ALTER TABLE Buildings     ADD Category            text    DEFAULT 'building';

-- is visible in the city list
ALTER TABLE Buildings     ADD IsVisible           boolean DEFAULT 1;

-- is visible in the pedia
ALTER TABLE Buildings     ADD PediaVisible        boolean DEFAULT 1;

-- name of policy required before displaying in city list
ALTER TABLE Buildings     ADD PrereqPolicy        text    DEFAULT null;

-- name of religion required before displaying in city list
ALTER TABLE Buildings     ADD PrereqReligion      text    DEFAULT null;
















--  ┌──────────────────────────────────────────────────────────────────────────┐
--  │
--  │ DATA MODIFICATIONS 
--  │
--  └──────────────────────────────────────────────────────────────────────────┘





--
--    UPDATES
--
--    ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●





--
--    BUILDING CLASSES
--


-- TODO
-- Change free BuildingClass from Palace to Tree of Life

UPDATE Civilization_FreeBuildingClasses 
SET BuildingClassType='BUILDINGCLASS_TREE_LIFE'
WHERE BuildingClassType='BUILDINGCLASS_PALACE';

-- 
-- Add base dummy building to provide bonuses (for now - TODO)
INSERT INTO Civilization_FreeBuildingClasses 
  SELECT CivilizationType, "BUILDINGCLASS_DUMMY_OPEN_SHELTER" 
  FROM Civilization_FreeBuildingClasses;

INSERT INTO Civilization_FreeBuildingClasses 
  SELECT CivilizationType, "BUILDINGCLASS_PREHISTORIC_TRIBE" 
  FROM Civilization_FreeBuildingClasses;






--
--    PREREQ TECHS
--


-- Change PrereqTechs for Palace, Shrine and Monument BuildingClasses:

UPDATE Buildings
SET PrereqTech='TECH_LEADERSHIP', Cost='40'
WHERE BuildingClass='BUILDINGCLASS_PALACE';

UPDATE Buildings
SET PrereqTech='TECH_IDOLS'
WHERE BuildingClass='BUILDINGCLASS_SHRINE';

UPDATE Buildings
SET PrereqTech='TECH_MASONRY'
WHERE BuildingClass='BUILDINGCLASS_MONUMENT';

-- ensure missing building or non prehistoric buildings (possible added by
-- other mods) are not able to be built until ancient
UPDATE Buildings 
SET PrereqTech='TECH_AGRICULTURE' 
WHERE PrereqTech IS NULL or PrereqTech = ''





--
--    FLAVORS
--


-- Raise/add Flavors for the Palace to force AI to build it:

UPDATE Building_Flavors
SET Flavor='150'
WHERE BuildingType='BUILDING_PALACE';





--
-- Cost Adjustment
-- 
-- ALTER table Buildings ADD COLUMN PrereqEra AFTER PrereqTech;
-- UPDATE Buildings SET PrereqEra = (SELECT Era FROM Technologies WHERE Buildings.PrereqTech = Technologies.Type);
--
--                         Modified
-- Original Costs Range    (1.25x + YYY) (1.5x + 100)
--
-- ANCIENT     040 - 075   150 - 192     160 - 212
-- CLASSICAL   075 - 100   217 - 250     212 - 250
-- MEDIEVAL    120 - 160   300 - 350     280 - 340
-- RENAISSANCE 200 - 300   425 - 550     400 - 550
-- INDUSTRIAL  300 - 300                 550 - 550
-- MODERN      300 - 360                 550 - 640
-- ATOMIC      400 - 500                 700 - 850
-- INFORMATION 625 -                    1037 - 
--
UPDATE Buildings Set Cost = Cost * 1.25 + 100;
--UPDATE Buildings Set Cost = Cost + 100 WHERE Buildings.PrereqTech IN 
  --( SELECT T.Type FROM Technologies AS T INNER JOIN Buildings AS B ON T.Type = B.PrereqTech WHERE T.Era = 'ERA_ANCIENT' );



--
--    INSERTS
--
--    ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●



--
--    FLAVORS
--


INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_PRODUCTION", "150");
INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_EXPANSION", "150");





/*

BRAVE NEW WORLD v. ??????

ID                                        integer                                                   primary key  autoincrement
Type                                      text                              not null    unique        
Description                               text                                                        
Civilopedia                               text                                                        
Strategy                                  text                                                        
Help                                      text                                                        
ThemingBonusHelp                          text                                                        
Quote                                     text                                                        
GoldMaintenance                           integer     default 0                                       
MutuallyExclusiveGroup                    integer     default '-1'                                    
TeamShare                                 boolean     default 0                                       
Water                                     boolean     default 0                                       
River                                     boolean     default 0                                       
FreshWater                                boolean     default 0                                       
Mountain                                  boolean     default 0                                       
NearbyMountainRequired                    boolean     default 0                                       
Hill                                      boolean     default 0                                       
Flat                                      boolean     default 0                                       
FoundsReligion                            boolean     default 0                                       
IsReligious                               boolean     default 0                                       
BorderObstacle                            boolean     default 0                                       
PlayerBorderObstacle                      boolean     default 0                                       
Capital                                   boolean     default 0                                       
GoldenAge                                 boolean     default 0                                       
MapCentering                              boolean     default 0                                       
NeverCapture                              boolean     default 0                                       
NukeImmune                                boolean     default 0                                       
AllowsWaterRoutes                         boolean     default 0                                       
ExtraLuxuries                             boolean     default 0                                       
DiplomaticVoting                          boolean     default 0                                       
AffectSpiesNow                            boolean     default 0                                       
NullifyInfluenceModifier                  boolean     default 0                                       
Cost                                      integer     default 0                                       
FaithCost                                 integer     default 0                                       
LeagueCost                                integer     default 0                                       
UnlockedByBelief                          boolean     default 0                                       
UnlockedByLeague                          boolean     default 0                                       
HolyCity                                  boolean     default 0                                       
NumCityCostMod                            integer     default 0                                       
HurryCostModifier                         integer     default 0                                       
MinAreaSize                               integer     default 0                                       
ConquestProb                              integer     default 0                                       
CitiesPrereq                              integer     default 0                                       
LevelPrereq                               integer     default 0                                       
CultureRateModifier                       integer     default 0                                       
GlobalCultureRateModifier                 integer     default 0                                       
GreatPeopleRateModifier                   integer     default 0                                       
GlobalGreatPeopleRateModifier             integer     default 0                                       
GreatGeneralRateModifier                  integer     default 0                                       
GreatPersonExpendGold                     integer     default 0                                       
GoldenAgeModifier                         integer     default 0                                       
UnitUpgradeCostMod                        integer     default 0                                       
Experience                                integer     default 0                                       
GlobalExperience                          integer     default 0                                       
FoodKept                                  integer     default 0                                       
Airlift                                   boolean     default 0                                       
AirModifier                               integer     default 0                                       
NukeModifier                              integer     default 0                                       
NukeExplosionRand                         integer     default 0                                       
HealRateChange                            integer     default 0                                       
Happiness                                 integer     default 0                                       
UnmoddedHappiness                         integer     default 0                                       
UnhappinessModifier                       integer     default 0                                       
HappinessPerCity                          integer     default 0                                       
HappinessPerXPolicies                     integer     default 0                                       
CityCountUnhappinessMod                   integer     default 0                                       
NoOccupiedUnhappiness                     boolean     default 0                                       
WorkerSpeedModifier                       integer     default 0                                       
MilitaryProductionModifier                integer     default 0                                       
SpaceProductionModifier                   integer     default 0                                       
GlobalSpaceProductionModifier             integer     default 0                                       
BuildingProductionModifier                integer     default 0                                       
WonderProductionModifier                  integer     default 0                                       
CityConnectionTradeRouteModifier          integer     default 0                                       
CapturePlunderModifier                    integer     default 0                                       
PolicyCostModifier                        integer     default 0                                       
PlotCultureCostModifier                   integer     default 0                                       
GlobalPlotCultureCostModifier             integer     default 0                                       
PlotBuyCostModifier                       integer     default 0                                       
GlobalPlotBuyCostModifier                 integer     default 0                                       
GlobalPopulationChange                    integer     default 0                                       
TechShare                                 integer     default 0                                       
FreeTechs                                 integer     default 0                                       
FreePolicies                              integer     default 0                                       
FreeGreatPeople                           integer     default 0                                       
MedianTechPercentChange                   integer     default 0                                       
Gold                                      integer     default 0                                       
AllowsRangeStrike                         boolean     default 0                                       
Espionage                                 boolean     default 0                                       
AllowsFoodTradeRoutes                     boolean     default 0                                       
AllowsProductionTradeRoutes               boolean     default 0                                       
Defense                                   integer     default 0                                       
ExtraCityHitPoints                        integer     default 0                                       
GlobalDefenseMod                          integer     default 0                                       
MinorFriendshipChange                     integer     default 0                                       
VictoryPoints                             integer     default 0                                       
ExtraMissionarySpreads                    integer     default 0                                       
ReligiousPressureModifier                 integer     default 0                                       
EspionageModifier                         integer     default 0                                       
GlobalEspionageModifier                   integer     default 0                                       
ExtraSpies                                integer     default 0                                       
SpyRankChange                             integer     default 0                                       
InstantSpyRankChange                      integer     default 0                                       
TradeRouteRecipientBonus                  integer     default 0                                       
TradeRouteTargetBonus                     integer     default 0                                       
NumTradeRouteBonus                        integer     default 0                                       
LandmarksTourismPercent                   integer     default 0                                       
InstantMilitaryIncrease                   integer     default 0                                       
GreatWorksTourismModifier                 integer     default 0                                       
XBuiltTriggersIdeologyChoice              integer     default 0                                       
TradeRouteSeaDistanceModifier             integer     default 0                                       
TradeRouteSeaGoldBonus                    integer     default 0                                       
TradeRouteLandDistanceModifier            integer     default 0                                       
TradeRouteLandGoldBonus                   integer     default 0                                       
CityStateTradeRouteProductionModifier     integer     default 0                                       
GreatScientistBeakerModifier              integer     default 0                                       
BuildingClass                             text        default NULL                                    
ArtDefineTag                              text        default NULL                                    
NearbyTerrainRequired                     text        default NULL                                    
ProhibitedCityTerrain                     text        default NULL                                    
VictoryPrereq                             text        default NULL                                    
FreeStartEra                              text        default NULL                                    
MaxStartEra                               text        default NULL                                    
ObsoleteTech                              text        default NULL                                    
EnhancedYieldTech                         text        default NULL                                    
TechEnhancedTourism                       integer     default 0                                       
FreeBuilding                              text        default NULL                                    
FreeBuildingThisCity                      text        default NULL                                    
FreePromotion                             text        default NULL                                    
TrainedFreePromotion                      text        default NULL                                    
FreePromotionRemoved                      text        default NULL                                    
ReplacementBuildingClass                  text        default NULL                                    
PrereqTech                                text        default NULL                                    
PolicyBranchType                          text        default NULL                                    
SpecialistType                            text        default NULL                                    
SpecialistCount                           integer     default 0                                       
GreatWorkSlotType                         text        default NULL                                    
FreeGreatWork                             text        default NULL                                    
GreatWorkCount                            integer     default 0                                       
SpecialistExtraCulture                    integer     default 0                                       
GreatPeopleRateChange                     integer     default 0                                       
ExtraLeagueVotes                          integer     default 0                                       
CityWall                                  boolean     default 0                                       
DisplayPosition                           integer     default 0                                       
PortraitIndex                             integer     default '-1'                                    
WonderSplashImage                         text        default NULL                                    
WonderSplashAnchor                        text        default 'R,T'                                   
WonderSplashAudio                         text                                                        
IconAtlas                                 text        default NULL                                    
ArtInfoCulturalVariation                  boolean     default 0                                       
ArtInfoEraVariation                       boolean     default 0                                       
ArtInfoRandomVariation                    boolean     default 0                                       





Cost
FaithCost

Water
River
Freshwater
Mountain
NearbyMountainRequired
Hill
Flat
!!! NearbyTerrainRequired


NumCityCostMod

PrereqTech, CitiesPrereq, LevelPrereq, UnlockedByBelief, ObsoleteTech

CultureRateModifier
GoldenAgeModifier

Happiness, UnmoddedHappiness, UnhappinessModifier, HappinessPerCity, 
  CityCountUnhappinessMod, NoOccupiedUnhappiness

MilitaryProductionModifier
BuildingProductionModifier
WonderProductionModifier
CityConnectionTradeRouteModifier
CapturePlunderModifier
PolicyCostModifier
PlotCultureCostModifier
GlobalPlotBuyCostModifier
MedianTechPercentChange
GreatPeopleRateChange

GlobalPopulationChange

FreeTechs, FreePolicies, FreeGreatPeople, FreePromotion, TrainedFreePromotion
FreeBuilding, FreeBuildingThisCity
FreePromotionRemoved

SpecialistType, SpecialistCount

Gold
FoodKept
Defense, ExtraCityHitPoints, GlobalDefenseMod

AllowsRangeStrike

UnitUpgradeCostMod
Experience
GlobalExperience
HealRateChange
WorkerSpeedModifier

ArtInfoCulturalVariation, ArtInfoEraVariation, ArtInfoRandomVariation

XBuiltTriggersIdeologyChoice ?
InstantMilitaryIncrease ?
BorderObstacle ?
NumCityCostMod ?
ReplacementBuildingClass ?
PolicyBranchType ?
CityWall ?


*/




