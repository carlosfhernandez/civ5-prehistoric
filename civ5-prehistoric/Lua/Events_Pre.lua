--[[

==============================================================================
Events (Civ5 Type)
==============================================================================

This object exposes events designed to make the UI react to data changes. You 
may try to use them to implement gameplay changes but be aware that those 
events may not be fired in circumstances where the UI do not need it. For 
example the events used by the city screen may not be fired for cities 
controlled by the AI.



Static Events

Events can be subscribed by using Events.SomeEvent.Add(SomeFunction). Regular 
events can also be fired through a dot by using Events.SomeEvent(<args>). This 
will invoke all subscribers with the provided arguments.



A
ActivePlayerTurnEnd()
ActivePlayerTurnStart()
AddPopupTextEvent(Vector3 worldPosition, unknown text, int delay)
AddUnitMoveHexRangeHex(float i, float j, unknown k, bool attackMove, unknown unitID)
AdvisorDisplayHide()
AdvisorDisplayShow(AdvisorEventInfo info)
AfterModsActivate()
AfterModsDeactivate()
AILeaderMessage(PlayerID player, DiploUIStateType diploUIState, string leaderMessage, int animationAction, int data1)
AudioDebugChangeMusic(bool arg0, bool arg1, bool arg2)
AudioPlay2DSound(string audio)
B
BuildingLibrarySwap(int assetCulture, int assetEra)
C
CameraStartPitchingDown()
CameraStartPitchingUp()
CameraStartRotatingCCW()
CameraStartRotatingCW()
CameraStopPitchingDown()
CameraStopPitchingUp()
CameraStopRotatingCCW()
CameraStopRotatingCW()
CameraViewChanged()
ClearDiplomacyTradeTable()
ClearHexHighlights()
ClearHexHighlightStyle(string highlightStyle)
ClearUnitMoveHexRange()
ConnectedToNetworkHost(PlayerID player)
D
DisplayMovementIndicator(bool show)
E
EndCombatSim(PlayerID attackingPlayer, UnitID attackingUnit, int attackingUnitDamage, int attackingUnitFinalDamage, int attackingUnitMaxHitPoints, PlayerID defendingPlayer, UnitID defendingUnit, int defendingUnitDamage, int defendingUnitFinalDamage, int defendingUnitMaxHitPoints)
EndGameShow(EndGameType type, TeamID team)
EndTurnBlockingChanged(EndTurnBlockingType prevEndTurnBlockingType, EndTurnBlockingType newEndTurnBlockingType)
EndTurnTimerUpdate(int percentComplete)
EventOpenOptionsScreen()
EventPoliciesDirty()
ExitToMainMenu()
F
FrontEndPopup(string string)
G
GameMessageChat(PlayerID fromPlayer, PlayerID toPlayer, string text, ChatTargetType targetType)
GameOptionsChanged()
GameplayAlertMessage(unknown data)
GameplayFX(float arg0, float arg1, int arg2)
GameplaySetActivePlayer(PlayerID activePlayer, int prevActivePlayer)
GenericWorldAnchor(GenericWorldAnchorType type, bool show, int plotX, int plotY, FeatureType data1 = nil)
GoToPediaHomePage(ImprovementType homePage)
GraphicsOptionsChanged()
H
HexFOWStateChanged(Vector2 hexPos, int fowType, bool wholeMap)
HexYieldMightHaveChanged(int gridX, int gridY)
I
InitCityRangeStrike(PlayerID Player, CityID CityID)
InstalledModsUpdated()
InterfaceModeChanged(InterfaceMode oldInterfaceMode, InterfaceMode newInterfaceMode)
K
KeyUpEvent(KeyType wParam)
L
LandmarkLibrarySwap()
LeavingLeaderViewMode()
LoadScreenClose()
LocalMachineAppUpdate(unknown tickCount, int timeIncrement)
LocalMachineUnitPositionChanged(PlayerID player, UnitID unitID, Vector3 unitPosition)
M
MinimapClickedEvent(int x, int y)
MinimapTextureBroadcastEvent(unknown uiHandle, int width, int height, unknown paddingX)
MultiplayerConnectionFailed()
MultiplayerGameAbandoned(NetKicked reason)
MultiplayerGameInvite()
MultiplayerGameLaunched()
MultiplayerGameListClear()
MultiplayerGameListComplete()
MultiplayerGamePlayerDisconnected(PlayerID player)
MultiplayerGamePlayerUpdated()
MultiplayerJoinRoomComplete()
MultiplayerJoinRoomFailed(NetError extendedError, unknown aExtendedErrorText)
MultiplayerPingTimesChanged()
N
NaturalWonderRevealed(float i, int j)
NotificationAdded(CityAIFocusType notification, NotificationType notificationType, string toolTip, string summary, int gameValue, TechType extraGameData)
NotificationRemoved(CityAIFocusType )
O
OpenInfoCorner(InfoCornerID infoType)
OpenPlayerDealScreenEvent(PlayerID player, int target = nil)
P
ParticleEffectReloadRequested()
ParticleEffectStatsRequested()
ParticleEffectStatsResponse(unknown responseData)
PlayerChoseToLoadGame(string thisLoadFile, bool arg1 = nil)
PlayerVersionMismatchEvent(PlayerID player, unknown playerName, bool isHost)
PreGameDirty()
R
RemotePlayerTurnEnd()
RemoveAllArrowsEvent()
RequestYieldDisplay(YieldDisplayType type, ResourceType arg1 = nil, ResourceType gridX = nil, int gridY = nil)
RunCombatSim(PlayerID attackingPlayer, UnitID attackingUnit, int attackingUnitDamage, int attackingUnitFinalDamage, int attackingUnitMaxHitPoints, PlayerID defendingPlayer, UnitID defendingUnit, int defendingUnitDamage, int defendingUnitFinalDamage, int defendingUnitMaxHitPoints)
S
SearchForPediaEntry(string searchString)
SequenceGameInitComplete()
SerialEventBuildingSizeChanged(int arg0)
SerialEventCameraIn(Vector2 arg0)
SerialEventCameraOut(Vector2 arg0)
SerialEventCameraStartMovingBack()
SerialEventCameraStartMovingForward()
SerialEventCameraStartMovingLeft()
SerialEventCameraStartMovingRight()
SerialEventCameraStopMovingBack()
SerialEventCameraStopMovingForward()
SerialEventCameraStopMovingLeft()
SerialEventCameraStopMovingRight()
SerialEventCityCaptured(Vector2 hexPos, PlayerID player, int cityID, PlayerID newPlayer)
SerialEventCityContinentChanged(float hexX, int hexY, int arg2)
SerialEventCityCreated(Vector2 vHexPos, PlayerID player, CityID cityID, ArtStyleType artStyleType, EraType eraType, int continent, int populationSize, int size, int fogState)
SerialEventCityCultureChanged(float hexX, int hexY, int arg2)
SerialEventCityDestroyed(Vector2 hexPos, PlayerID player, int cityID, PlayerID newPlayer)
SerialEventCityHexHighlightDirty()
SerialEventCityInfoDirty()
SerialEventCityPopulationChanged(float hexX, int hexY, int newPop, int unknown)
SerialEventCityScreenDirty()
SerialEventCitySetDamage(PlayerID player, CityID cityID, int damage, int previousDamage)
SerialEventDawnOfManHide(int civID)
SerialEventDawnOfManShow(int civID)
SerialEventEndTurnDirty()
SerialEventEnterCityScreen()
SerialEventEraChanged(int arg0, PlayerID currPlayer)
SerialEventEspionageScreenDirty()
SerialEventExitCityScreen()
SerialEventGameDataDirty()
SerialEventGameMessagePopup(PopupInfo popupInfo)
SerialEventGameMessagePopupProcessed(ButtonPopupType mostRecentPopup, int arg1)
SerialEventGameMessagePopupShown(PopupInfo PopupInfo)
SerialEventHexCultureChanged(int hexX, int hexY, PlayerID player, bool unknown)
SerialEventHexDeSelected(float hexX, int hexY)
SerialEventHexGridOff()
SerialEventHexGridOn()
SerialEventHexHighlight(Vector2 hex, bool highlight, Vector4 highlightColor, string highlightStyle)
SerialEventHexSelected(float hexX, int hexY)
SerialEventImprovementCreated(float hexX, int hexY, ArtStyleType continent1, ArtStyleType continent2, PlayerID player, int createImprovementType, ImprovementType createImprovementRRType, int createImprovementEra, int createImprovementState, unknown ImprovementEra = nil)
SerialEventImprovementDestroyed(int hexX, int hexY, int continent1, int continent2)
SerialEventMouseOverHex(int hexX, int hexY)
SerialEventRawResourceCreated(float hexX, int hexY, ArtStyleType continent, ArtStyleType continent, PlayerID player, int arg5, int createResourceType, int arg7, int arg8)
SerialEventRawResourceIconCreated(float hexPosX, int hexPosY, unknown ImprovementType, ResourceType ResourceType)
SerialEventResearchDirty()
SerialEventRoadCreated(int hexX, int hexY, PlayerID player, int routeType)
SerialEventRoadDestroyed(int hexX, int hexY)
SerialEventScoreDirty()
SerialEventStartGame(int arg0 = nil)
SerialEventTurnTimerDirty()
SerialEventUnitCreated(PlayerID player, UnitID unitID, int hexVec, int unitType, int cultureType, int civID, int primaryColor, int secondaryColor, int unitFlagIndex, int fogState)
SerialEventUnitDestroyed(PlayerID player, UnitID unitID)
SerialEventUnitFlagSelected(PlayerID player, HandicapType unit)
SerialEventUnitInfoDirty()
SerialEventUnitMove()
SerialEventUnitMoveToHexes()
SerialEventUnitSetDamage(PlayerID player, UnitID unitID, int damage, int previousDamage)
SerialEventUnitTeleportedToHex(unknown i, unknown j, PlayerID player, UnitID unitID)
ShowAttackTargets(PlayerID player, UnitID arg1)
ShowHexYield(int x, int y, bool show)
ShowMovementRange(PlayerID player, UnitID arg1)
SpawnArrowEvent(ResourceType arg0, ResourceType arg1, int hexX, int hexY)
SpecificCityInfoDirty(PlayerID player, CityID cityID, CityUpdateType updateType)
StartUnitMoveHexRange()
StrategicViewStateChanged(int strategicView, int cityBanners)
SystemUpdateUI(SystemUpdateUIType type)
T
TaskListUpdate(PopupInfo TaskListInfo)
TechAcquired()
U
UIPathFinderUpdate(unknown data)
UnitActionChanged(PlayerID player, UnitID unitID)
UnitDataEdited(int floatVarList, int memberCount, int memberIndex, bool isDebugFSM, SpecialistType specRender, bool isFromLua = nil)
UnitDataRequested(int arg0)
UnitDebugFSM(int arg0)
UnitEmbark(PlayerID player, UnitID unitID)
UnitFlagUpdated(int unitCulture, int unitType, float unitHealth, bool unitFortified)
UnitGarrison(PlayerID player, UnitID unitID, int garrisoned)
UnitHexHighlight(float i, int j, unknown k, bool on, int unitId)
UnitLibrarySwap()
UnitMarkThreatening(PlayerID player, UnitID unitID, bool mark)
UnitMemberCombatStateChanged(PlayerID player, UnitID unitID, int memberID, unknown stateID)
UnitMemberCombatTargetChanged(PlayerID player, UnitID unitID, int memberID, unknown targetPlayerID, unknown targetUnitID, int targetMemberID)
UnitMemberOverlayAdd(PlayerID player, UnitID unitID, int memberID, unknown position)
UnitMemberOverlayRemove(PlayerID player, UnitID unitID, int memberID)
UnitMemberOverlayShowHide(PlayerID player, UnitID unitID, int memberID, bool show)
UnitMemberPositionChanged(PlayerID player, UnitID unitID, int memberID, unknown unitPosition)
UnitMoveQueueChanged(PlayerID player, UnitID unitID, bool remainingMoves)
UnitSelectionChanged(PlayerID player, UnitID u, float hexX, float hexY, int k, bool isSelected, bool arg6)
UnitSelectionCleared()
UnitShouldDimFlag(PlayerID player, UnitID unitID, int dim)
UnitStateChangeDetected(PlayerID player, UnitID unitID, int fogState)
UnitTypeChanged(string arg0)
UnitVisibilityChanged(PlayerID player, UnitID unitID, bool visible, bool checkFlag, unknown blendTime)
UserRequestClose()
W
WarStateChanged(TeamID team1, TeamID team2, bool war)
WorldMouseOver(int worldHasMouseOver)











==============================================================================
LUA EVENTS
==============================================================================

A
AdditionalInformationDropdownGatherEntries(table(int => table) additionalEntries)
AdditionalInformationDropdownSortEntries(table(int => table) entries)
AdvisorButtonEvent(MouseType button)
C
ChatShow(int chatOpen)
E
EnemyPanelHide(bool isHide)
M
ModBrowserSetDeleteButtonState(..., bool arg1, string arg2 = nil)
ModBrowserSetDownloadButtonState(bool arg0, bool arg1)
ModBrowserSetLikeButtonState(bool arg0, bool arg1)
ModBrowserSetReportButtonState(bool arg0, bool arg1)
O
OnModBrowserDeleteButtonClicked()
OnModBrowserDownloadButtonClicked()
OnModsBrowserNavigateBack(table args)
OnRecommendationCheckChanged(bool value)
P
PasswordChanged(PlayerID player)
ProductionPopup(bool isHide)
R
ReplayViewer_LoadReplay(unknown replayFile)
RequestRefreshAdditionalInformationDropdownEntries()
S
ScenarioPlayerStatusChanged(table(PlayerID => table(string => table)) tPlayerStatus, PlayerID turn, int year, PlayerID playerAboutToWin, int turnsControlHeld)
ScenarioUnitTiersChanged(table(string => PlayerID) tUnitTiers)
SetCivNameEditSlot(PlayerID slot)
T
TryDismissTutorial(string tutorialID)
TryQueueTutorial(string tutorialID, bool highPriority)



Static Methods
------------------------------------------------------------------------------
Methods are functions that belong to an object. Static methods are invoked through a dot, as in LuaEvents.SomeMethod(<args>). When a dot is used the caller object is not implicitly provided as the first argument.Add
Call
Count
Remove
RemoveAll













==============================================================================
GAME EVENTS [GameEvents]
==============================================================================

This object exposes events that you can use to modify the gameplay. As opposed 
to the events defined on Events and LuaEvents, most of those events are 
expected to return a value. This value may then be used by the game to prevent 
or trigger some game actions (such as a declaration of war), or to override 
some calculations (for example by adding a bonus or a malus to the diplomatic 
status between two civilizations). Please look at the events' pages to 
learn more.


Static Events
------------------------------------------------------------------------------

Events can be subscribed by using GameEvents.SomeEvent.Add(SomeFunction). 
Regular events can also be fired through a dot by using 
GameEvents.SomeEvent(<args>). This will invoke all subscribers with the 
provided arguments.


C
bool  CanDeclareWar(TeamID myTeam, TeamID theirTeam)
CityBuildingsIsBuildingSellable(PlayerID player, BuildingType building)
CityCanBuyAnyPlot(PlayerID player, CityID city)
CityCanBuyPlot(PlayerID player, CityID city, int x, int y)

CityCanConstruct(PlayerID player, CityID city, BuildingType buildingType)

CityCanCreate(PlayerID player, CityID city, ProjectType projectType)
CityCanMaintain(PlayerID player, CityID city, ProcessType processType)
CityCanPrepare(PlayerID player, CityID city, SpecialistType specialistType)
CityCanTrain(PlayerID player, CityID city, UnitType unitType)
CityCaptureComplete(PlayerID player, int capital, ResourceType x, ResourceType y, PlayerID newPlayer, int conquest, int conquest)
CityConvertsReligion(PlayerID owner, ReligionType religion, int x, int y)
D
DoResolveVictoryVote(bool preliminaryVote)
G
GameCoreTestVictory()
GameCoreUpdateBegin()
GameCoreUpdateEnd()
GetFounderBenefitsReligion(PlayerID player)
GetReligionToSpread(PlayerID player)
GetScenarioDiploModifier1(PlayerID player1, PlayerID player2)
GetScenarioDiploModifier2(PlayerID player1, PlayerID player2)
P
PlayerAdoptPolicy(PlayerID player, int policyID)
PlayerCanConstruct(PlayerID player, BuildingType buildingType)
PlayerCanCreate(PlayerID player, ProjectType projectType)
PlayerCanMaintain(PlayerID player, ProcessType processType)
PlayerCanPrepare(PlayerID player, SpecialistType specialistType)
PlayerCanResearch(PlayerID player, TechType techType)
PlayerCanEverResearch(PlayerID player, TechType techType)
PlayerCanTrain(PlayerID player, UnitType unitType)
PlayerCityFounded(PlayerID player, int cityX, int cityY)

PlayerDoTurn(PlayerID player)

PlayerPreAIUnitUpdate(PlayerID player)
PreGameStart
S
SetAlly(PlayerID cSPlayer, PlayerID oldAlly, PlayerID newAlly)
SetPopulation(int x, int y, unknown oldPopulation, int newPopulation)
T
TeamMeet(unknown playeractive, unknown playermet)
TeamSetHasTech(TeamID team, TechType tech, bool adopted)
TeamTechResearched(TeamID team, TechType tech, int change)
U
UnitGetSpecialExploreTarget(PlayerID player, UnitID unitID)
UnitKilledInCombat(PlayerID killer, PlayerID killee, UnitType killeeUnitType)
UnitSetXY(PlayerID player, UnitID unit, int x, int y)






Static Methods
------------------------------------------------------------------------------
Methods are functions that belong to an object. Static methods are invoked through a dot, as in GameEvents.SomeMethod(<args>). When a dot is used the caller object is not implicitly provided as the first argument.

Accumulate
AccumulateINT
Add
Call
Count
Remove
RemoveAll
TestAll
TestAny








--]]
