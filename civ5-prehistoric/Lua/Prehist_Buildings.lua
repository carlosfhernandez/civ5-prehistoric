-- Buildings
-- Author: carlos
-- DateCreated: 1/16/2014
--------------------------------------------------------------


-- include( "HasWithinCityBorders" )


--
-- PlayerCanConstruct
--
-- Prereqs for building contructions
--
GameEvents.PlayerCanConstruct.Add(
function(iPlayer, buildingTypeID)
  local prereqPolicy = GameInfo.Buildings[buildingTypeID].PrereqPolicy
  local prereqReligion = GameInfo.Buildings[buildingTypeID].PrereqReligion
  if prereqPolicy then
    local player = Players[iPlayer]
    local policyID = GameInfo.Policies[prereqPolicy].ID
    if not player:HasPolicy(policyID) then
      return false
    end
  end
  if prereqReligion then
    local player = Players[iPlayer]
    local religionID = GameInfo.Religions[prereqReligion].ID
    local playerReligionID = player:GetReligionCreatedByPlayer(religionID)
    if playerReligionID < 0 or playerReligionID ~= religionID then
      return false
    end
  end
  return true
end);



--
-- Building Bonuses Check
--
-- TODO: need to transform function
--
GameEvents.PlayerDoTurn.Add(function(iPlayer) 
  

  local iTurn = Game.GetGameTurn();
  
  local pPlayer = Players[iPlayer];


  --[[

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

  end]]--

  return false;

end); -- DoTurnAdd - Building Bonuses Check

