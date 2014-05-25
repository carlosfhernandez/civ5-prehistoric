
Game (Civ5 Type)






Static Methods


A


  AddPlayer(PlayerID newPlayer, LeaderType leader, CivilizationType civ)
C


int CalculateOptionsChecksum()
int CalculateSyncChecksum()
int CanDoControl(ControlType arg0)
bool  CanHandleAction(ActionType action, Plot plot = nil, bool testVisible = false)
bool  CanHaveSecretaryGeneral(VoteSourceType voteSource)
bool  CanTrainNukes()
  ChangeDiploVote(VoteSourceType voteSource, int change)
  ChangeMaxTurns(int change)
  ChangeNoNukesCount(int change)
  ChangeNukesExploded(int change)
  ChangeNumVotesForTeam(TeamID team, int kiVaticanExtraVotes)
  ChangePlotExtraCost(int x, int y, int extraCost)
  CityPurchaseBuilding(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
  CityPurchaseProject(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
  CityPurchaseUnit(City city, UnitType unitType, int buildingType, ProjectType projectTypes)
  CityPushOrder(City city, OrderType order, UnitType data, bool alt, bool shift, bool ctrl)
int CountCivPlayersAlive()
int CountCivPlayersEverAlive()
int CountCivTeamsAlive()
int CountCivTeamsEverAlive()
int CountHumanPlayersAlive()
int CountHumanPlayersEverAlive()
int CountKnownTechNumTeams(TechType tech)
int CountNumHumanGameTurnActive()
int CountPossibleVote(VoteType vote, VoteSourceType voteSource)
int CountTotalCivPower()
int CountTotalNukeUnits()
  CycleCities(bool forward, bool add)
bool  CyclePlotUnits(Plot plot, bool forward, bool auto, int count)
  CycleUnits(bool clear, bool forward, bool workers)
D


  DoControl(ControlType control)
  DoFromUIDiploEvent(DiploUIEventType event, PlayerID aIPlayer, SpecialistType button, int againstPlayer, int arg3)
  DoMinorBullyGold(PlayerID activePlayer, PlayerID minorCiv)
  DoMinorBullyUnit(PlayerID activePlayer, PlayerID minorCiv)
  DoMinorBuyout(PlayerID activePlayer, PlayerID minorCiv)
  DoMinorGiftGold
  DoMinorGiftTileImprovement(PlayerID fromPlayer, TaskType toPlayer, int plotX, int plotY)
  DoMinorGoldGift(TeamID gold, int goldGiftSmall)
  DoMinorPledgeProtection(PlayerID activePlayer, PlayerID minorCiv, bool arg2)
E


  EnhanceReligion(PlayerID vaticanPlayer, ReligionType religion, BeliefType belief4, BeliefType belief5)
F


  FoundPantheon(int vaticanPlayer, BeliefType belief1)
  FoundReligion(PlayerID vaticanPlayer, ReligionType religion, unknown arg2, BeliefType belief2, BeliefType belief3, BeliefType belief3, int arg6, City vaticanCity)
G


  GameplayDiplomacyAILeaderMessage
CivilizationType  GetActiveCivilizationType()
PlayerID  GetActivePlayer()
TeamID  GetActiveTeam()
int GetAdjustedLandPercent(VictoryType victory)
int GetAdjustedPopulationPercent(VictoryType victory)
unknown GetAdvisorCounsel()
int GetAIAutoPlay()
bool  GetAllowRClickMovementWhileScrolling()
iterator(int, BeliefType) GetAvailableBonusBeliefs()
iterator(int, BeliefType) GetAvailableEnhancerBeliefs()
iterator(int, BeliefType) GetAvailableFollowerBeliefs()
iterator(int, BeliefType) GetAvailableFounderBeliefs()
iterator(int, BeliefType) GetAvailablePantheonBeliefs()
iterator(int, BeliefType) GetBeliefsInReligion()
  GetBestGreatPeoplePlayer
UnitType  GetBestLandUnit()
UnitType  GetBestLandUnitCombat()
  GetBestPoliciesPlayer
  GetBestWondersPlayer
int GetBuildingClassCreatedCount(BuildingClassType index)
int GetBuildingYieldChange(BuildingType building, YieldType arg1)
int GetBuildingYieldModifier(BuildingType building, YieldType arg1)
CalendarType  GetCalendar()
CombatPredictionType  GetCombatPrediction(Unit myUnit, Unit theirUnit)
EraType GetCurrentEra()
bool  GetCustomOption(string optionName)
ResourceType  GetDealDuration()
string  GetDiploResponse(unknown leaderType, DiploResponseType responseType)
int GetElapsedGameTurns()
int GetEstimateEndTurn()
int GetFaithCost(UnitType unit)
PlayerID  GetFounder(ReligionType arg0, int arg1)
ReligionType  GetFounderBenefitsReligion(PlayerID player)
GameSpeedType GetGameSpeedType()
GameplayStateType GetGameState()
PlayerID  GetGameTurn()
int GetGameTurnYear()
HandicapType  GetHandicapType()
City  GetHolyCityForReligion(ReligionType religion, PlayerID player)
int GetImprovementUpgradeTime(ImprovementType improvement, Plot plot)
int GetInitLand()
int GetInitPopulation()
int GetInitTech()
int GetInitWonders()
int GetMaxCityElimination()
int GetMaxLand()
int GetMaxPopulation()
int GetMaxTech()
int GetMaxTurns()
int GetMaxWonders()
int GetMinimumFaithNextPantheon()
int GetMinutesPlayed()
string  GetName()
PlayerID  GetNoNukesCount()
int GetNukesExploded()
int GetNumAdvancedStartPoints()
int GetNumCities()
int GetNumCitiesFollowing(ReligionType religion)
int GetNumCitiesPolicyCostMod()
int GetNumCivCities()
  GetNumFollowers
int GetNumGameTurnActive()
int GetNumHumanPlayers()
int GetNumReligionsFounded()
int GetNumReligionsStillToFound()
int GetNumReplayMessages()
int GetNumResourceRequiredForBuilding()
int GetNumResourceRequiredForUnit(UnitType unit, ResourceType resource)
int GetNumVictoryVotesTallied()
int GetNumVotesForTeam(TeamID teamLoop)
int GetNumWorldWonders()
int GetPausePlayer()
int GetPitbossTurnTime()
int GetPlayerRank(PlayerID index)
int GetPlayerScore(PlayerID index)
int GetPlayerVote(PlayerID ownerIndex, int voteId)
int GetPreviousVoteCast(TeamID teamLoop)
int GetProductionPerPopulation(HurryType hurry)
int GetProjectCreatedCount(ProjectType index)
PlayerID  GetRankPlayer(int rank)
TeamID  GetRankTeam(int rank)
string  GetReligionName(ReligionType religion)
unknown GetReplayInfo()
  GetReplayMessage
table(int => IntrigueInfo)  GetReplayMessages()
int GetResearchAgreementCost(PlayerID us, PlayerID them)
ResourceUsageType GetResourceUsageType(ResourceType resourceLoop)
int GetSecretaryGeneral(VoteSourceType voteSource)
int GetSecretaryGeneralTimer(int voteSource)
EraType GetStartEra()
PlayerID  GetStartTurn()
int GetStartYear()
int GetTargetScore()
int GetTeamRank(TeamID index)
int GetTeamScore(TeamID index)
string  GetTimeString()
int GetTotalPopulation()
unknown GetTurnsBetweenMinorCivElections()
int GetTurnSlice()
unknown GetTurnsUntilMinorCivElection()
int GetTurnYear(int gameTurn)
int GetTutorialLevel()
int GetUnitClassCreatedCount(UnitClassType index)
int GetUnitCreatedCount(UnitType index)
int GetUnitedNationsCountdown()
UnitType  GetUnitUpgradesTo(UnitType unit)
int GetVariableCitySizeFromPopulation(int population)
VictoryType GetVictory()
TeamID  GetVoteCast(TeamID team)
int GetVoteOutcome(VoteType index)
int GetVoteRequired(VoteType vote, VoteSourceType voteSource)
int GetVotesNeededForDiploVictory()
int GetVoteTimer(int voteSource)
TeamID  GetWinner()
int GetWinningTurn()
int GetWorldNumCitiesUnhappinessPercent()
int GoldenAgeLength()
H


  HandleAction(PolicyType action)
int HasAdvisorMessageBeenSeen(string tutorialID)
I


bool  IsBuildingClassMaxedOut(BuildingClassType index, int extra)
bool  IsBuildingEverActive(BuildingType building)
bool  IsBuildingRecommended(int building, AdvisorType advisorLoop)
bool  IsChooseElection(VoteType vote)
bool  IsCircumnavigated()
bool  IsCivEverActive(CivilizationType civilization)
bool  IsCombatWarned()
bool  IsDebugMode()
bool  IsDiploVote(VoteSourceType voteSource)
bool  IsEverAttackedTutorial()
bool  IsEverRightClickMoved()
bool  IsFinalInitialized()
int IsGameMultiPlayer()
int IsHotSeat()
bool  IsInAdvancedStart()
bool  IsLeaderEverActive(LeaderType leader)
bool  IsMPOption(MultiOptionType index)
int IsNetworkMultiPlayer()
bool  IsNoNukes()
bool  IsNukesValid()
int IsOption(string index)
bool  IsPaused()
bool  IsPbem()
bool  IsPitboss()
int IsProcessingMessages()
bool  IsProjectMaxedOut(ProjectType index, int extra)
bool  IsProjectRecommended(int project, AdvisorType advisorLoop)
bool  IsScoreDirty()
bool  IsSimultaneousTeamTurns()
bool  IsSpecialUnitValid(SpecialUnitType specialUnitType)
int IsStaticTutorialActive()
bool  IsTeamGame()
bool  IsTeamVote(VoteType vote)
bool  IsTeamVoteEligible(TeamID team, VoteSourceType voteSource)
bool  IsTechRecommended(TechType arg0, AdvisorType advisorLoop)
bool  IsTutorialDebugging()
bool  IsTutorialLogging()
bool  IsUnitClassMaxedOut(UnitClassType index, int extra)
bool  IsUnitEverActive(UnitType unit)
bool  IsUnitRecommended(int unit, AdvisorType advisorLoop)
bool  IsVictoryValid(VictoryType index)
bool  IsVotePassed(VoteType index)
M


  MakeCircumnavigated
  MakeNukesValid(bool valid)
  MakeSpecialUnitValid(SpecialUnitType specialUnitType)
R


int Rand(int max_num, string log)
  ReviveActivePlayer
S


  SaveReplay(PlayerID player)
  SelectedCitiesGameNetMessage(GameMessageType message, TaskType data2, int data3, BuildingType data4, bool option, bool alt, bool shift, bool ctrl)
  SelectionListGameNetMessage(GameMessageType message, int data2 = -1, BuildActionType data3 = -1, UnitID data4 = -1, int flags = 0, bool alt = false, bool shift = false)
  SelectionListMove(Plot plot, int alt, bool shift, int ctrl)
  SetActivePlayer(PlayerID newValue, bool forceHotSeat)
  SetAdvisorBadAttackInterrupt(bool arg0)
  SetAdvisorCityAttackInterrupt(bool arg0)
  SetAdvisorMessageHasBeenSeen(unknown arg0, bool arg1)
  SetAdvisorRecommenderCity(City city)
  SetAdvisorRecommenderTech(PlayerID player)
  SetAIAutoPlay(int newValue)
  SetCombatWarned(bool arg0)
bool  SetDebugMode()
  SetEstimateEndTurn(int newValue)
  SetEverRightClickMoved(bool arg0)
  SetFounder(ReligionType arg0, PlayerID newOwner)
  SetGameState(GameplayStateType arg0)
  SetGameTurn(int newValue)
  SetHolyCity(ReligionType arg0, City newHolyCity)
  SetMaxCityElimination(int newValue)
  SetMaxTurns(int newValue)
  SetMinimumFaithNextPantheon
  SetName(string name)
  SetNumAdvancedStartPoints(int newValue)
  SetNumVotesForTeam
  SetOption(GameOptionType index, bool enabled)
  SetPausePlayer(PlayerID arg0)
  SetPitbossTurnTime(int hours)
  SetPlotExtraYield(int x, int y, YieldType yield, int extraYield)
  SetScoreDirty(bool newValue)
  SetStartYear(int newValue)
  SetStaticTutorialActive(bool arg0)
  SetTargetScore(int newValue)
  SetUnitedNationsCountdown(int arg0)
  SetVictoryValid(VictoryType arg0, bool arg1)
  SetWinner(TeamID newWinner, VictoryType newVictory)
T


  ToggleDebugMode()
U


  UpdateFOW(bool arg0)
  UpdateScore(bool force)
V


int VictoryDelay(VictoryType victory)

