--[[

Global Functions (Civ5)


1 Built-in functions
2 FLuaVector.lua
3 GameCalendarUtilities.lua
4 IconSupport.lua
5 InfoTooltipInclude.lua
6 MapGenerator.lua
7 MapmakerUtilities.lua
8 PlotMouseoverInclude.lua
9 SupportFunctions.lua




-------------------------------------------------------------------------------
Built-in functions


-------------------------------------------------------------------------------



bool  AddResourceType()
  ChangeBuildingSize(float arg0)
  FOW_SetAll(FogOfWarModeType fogOfWarType)
int getEndTurnTimerLength()
table(int => OverlayInfo) GetOverlayLegend()
table(InfoCornerID => string) GetStrategicViewIconSettings()
table(InfoCornerID => string) GetStrategicViewOverlays()
ActionType  GetVolumeKnobIDFromName(string arg0)
int GetVolumeKnobValue(ActionType musicVolumeKnob)
int, int, int GridToWorld(ResourceType gridX, int gridY)
Vector3 HexToWorld(Vector2 hexPos)
  Ice_Reload()
bool  InStrategicView()
Context LookUpControl(string arg0)
bool  MouseOverStrategicViewResource()
bool  ProcessStrategicViewMouseClick()
  ReloadTextures(int arg0, int arg1)
  ResetAchievements()
  SaveAudioOptions()
  SetSelectedCiv()
  SetStrategicViewIconSetting(int index)
  SetStrategicViewOverlay(int index)
  SetVolumeKnobValue(ActionType musicVolumeKnob, int cachedMusicVolumeKnob)
  StrategicViewShowFeatures(bool isChecked)
  StrategicViewShowFogOfWar(bool isChecked)
  TogglePauseGameplay(bool pauseGameplay)
  ToggleStrategicView()
ResourceType, PlayerID  ToGridFromHex(float i, float j)
Vector2 ToHexFromGrid(Vector2 gridPos)
bool  UnitMoving(PlayerID player, UnitID unit)
  Water_SetAmplitude(int waterAmplitude)
  Water_SetAutoReload(bool waterReload)
  Water_SetFlowParameters(int waterFlowStrength, int waterNoiseStrength, int waterNoiseScale)
  Water_SetGradientScale(int waterGradientScale)
  Water_SetScale(int waterScale)
  Water_SetSpec(int waterSunSpec, int waterSkySpec)
  Water_SetSpeed(int waterScrollSpeed)
  Waves_Reload()







-------------------------------------------------------------------------------
FLuaVector.lua

Those functions are declared in FLuaVector.lua. Use: include("FLuaVector")
-------------------------------------------------------------------------------

Vector4 Color(float r, float g, float b, float a)
unknown VecAdd(unknown v1, unknown v2)
unknown VecSubtract(unknown v1, unknown v2)
Vector2 Vector2(float i, float j)
Vector3 Vector3(float i, float j, float k)
Vector4 Vector4(float i, float j = nil, float k = nil, float l = nil)







-------------------------------------------------------------------------------
GameCalendarUtilities.lua

Those functions are declared in GameCalendarUtilities.lua. Use: include("GameCalendarUtilities")
-------------------------------------------------------------------------------


string  GetDateString(int gameTurn, unknown calendarType, unknown gameSpeedType, int startYear)
string  GetDefaultYearString(int year)
string  GetShortDateString(int gameTurn, unknown calendarType, unknown gameSpeedType, int startYear)







-------------------------------------------------------------------------------
IconSupport.lua

Those functions are declared in IconSupport.lua. Use: include("IconSupport")
-------------------------------------------------------------------------------

  CivIconHookup(PlayerID player, int iconSize, Image iconControl, Image teamColorControl, int shadowIconControl, int alwaysUseComposite, int shadowed)
bool  IconHookup(int offset, float iconSize, string atlas, Image imageControl, unknown debugPrint = nil)
Vector2, string IconLookup(int offset, int iconSize, string atlas)
  PopulateIconAtlases()
bool  SimpleCivIconHookup(PlayerID player, int iconSize, Image iconControl)






-------------------------------------------------------------------------------
InfoTooltipInclude.lua

Those functions are declared in InfoTooltipInclude.lua. Use: include("InfoTooltipInclude")
-------------------------------------------------------------------------------

string  GetCityStateStatus(Player player, PlayerID forPlayer, int war)
string  GetCultureTooltip(City city)
string  GetFaithTooltip(City city)
string  GetFoodTooltip(City city)
string  GetGoldTooltip(City city)
string  GetHelpTextForBuilding(BuildingType building, bool excludeName, bool excludeHeader, bool noMaintenance)
string  GetHelpTextForImprovement(ImprovementType improvement, bool excludeName, bool excludeHeader, bool noMaintenance)
string  GetHelpTextForProject(ProjectType project, bool includeRequirementsInfo)
string  GetHelpTextForUnit(UnitType unit, bool includeRequirementsInfo)
string  GetMoodInfo(PlayerID otherPlayer)
string  GetProductionTooltip(City city)
string  GetReligionTooltip(City city)
string  GetScienceTooltip(City city)
string  GetYieldTooltip(City city, YieldType yieldType, int base, int total, string iconString, string modifiersString)
string  GetYieldTooltipHelper(City city, YieldType yieldType, string icon)






-------------------------------------------------------------------------------
MapGenerator.lua

Those functions are declared in MapGenerator.lua. Use: include("MapGenerator")
-------------------------------------------------------------------------------

  AddFeatures()
bool  AddGoodies()
  AddLakes()
bool  AddRivers()
bool  CanPlaceGoodyAt(ImprovementType improvement, Plot plot)
  DetermineContinents()
  DoRiver(Plot startPlot, FlowDirectionType thisFlowDirection = nil, FlowDirectionType originalFlowDirection = nil, int riverID = nil)
  GenerateCoasts(int args = nil)
  GenerateMap()
  GeneratePlotTypes()
  GenerateTerrain()
... GetCoreMapOptions()
FlowDirectionType GetOppositeFlowDirection(FlowDirectionType dir)
int GetRiverValueAtPlot(Plot plot)
iterator()  Plots((void func(table(int => int) t)) sort = nil)
  SetPlotTypes(table(int => PlotType) plotTypes)
  SetTerrainTypes(table(int => TerrainType) terrainTypes)
  func(table(int => int) t)
  StartPlotSystem()






-------------------------------------------------------------------------------
MapmakerUtilities.lua

Those functions are declared in MapmakerUtilities.lua. Use: include("MapmakerUtilities")
-------------------------------------------------------------------------------

int AdjacentToSaltWater(int x, int y)
bool  CivNeedsCoastalStart(string civType)
bool  CivNeedsRiverStart(string civType)
table(int => bool)  GenerateCoastalLandDataTable()
table(int => bool), table(int => int) GenerateNextToCoastalLandDataTables()
int GetNumStartRegionAvoidForCiv(string civType)
int GetNumStartRegionPriorityForCiv(string civType)
int, int, table(int => PlayerID), bool, table(int => int), table  GetPlayerAndTeamInfo()
table(int => PlayerID)  GetShuffledCopyOfTable(table(int => int) incoming_table)
table(int => int) GetStartRegionAvoidListForCiv_GetIDs(string civType)
  GetStartRegionAvoidListForCiv_GetTypes(unknown civType)
table(int => int) GetStartRegionPriorityListForCiv_GetIDs(string civType)
  GetStartRegionPriorityListForCiv_GetTypes(unknown civType)
bool, int, table(int => int)  IdentifyTableIndex(table(int => PlayerID) incoming_table, PlayerID value)
table(int => int) ObtainLandmassBoundaries(AreaID areaID)
  PrintContentsOfTable(table(int => int) incoming_table)
int TestMembership(table(int => PlayerID) table, PlayerID value)







-------------------------------------------------------------------------------
PlotMouseoverInclude.lua

Those functions are declared in PlotMouseoverInclude.lua. Use: include("PlotMouseoverInclude")
-------------------------------------------------------------------------------

string  GetCivStateQuestString(Plot plot, bool shortVersion)
string  GetImprovementString(Plot plot)
string  GetNatureString(Plot plot)
string  GetOwnerString(Plot plot)
string  GetResourceString(Plot plot, bool longForm)
string  GetUnitsString(Plot plot)
string  GetYieldString(Plot plot)
bool  IsFeatureSpecial(FeatureType feature)








-------------------------------------------------------------------------------
SupportFunctions.lua

Those functions are declared in SupportFunctions.lua. Use: include("SupportFunctions")
-------------------------------------------------------------------------------
  TruncateString(Label control, int resultSize, string longStr, string trailingText = nil)


--]]




