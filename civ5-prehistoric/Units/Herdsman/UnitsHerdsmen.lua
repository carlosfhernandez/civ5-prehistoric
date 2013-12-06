print("This is the 'Units - Herdsmen' mod script.")

local iResourceHorses = GameInfoTypes.RESOURCE_HORSE

local iHerdsman = GameInfoTypes.UNIT_HERDSMAN
local iHerdsmanHorses = GameInfoTypes.UNIT_HERDSMAN_HORSE
local iHerdsmanCows = GameInfoTypes.UNIT_HERDSMAN_COW
local iHerdsmanSheep = GameInfoTypes.UNIT_HERDSMAN_SHEEP

local iImprovementPasture = GameInfoTypes.IMPROVEMENT_PASTURE
local iImprovementRustle = GameInfoTypes.IMPROVEMENT_RUSTLE
local iImprovementUnrustle = GameInfoTypes.IMPROVEMENT_UNRUSTLE

function onImprovementDestroyed(iHexX, iHexY)
  -- print(string.format("onImprovementDestroyed(%d, %d)", iHexX, iHexY))
  local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))
  local pUnit = pPlot:GetUnit(0)

  -- If the improvement was destroyed by a Herdsman and it was on Horses, we need to reduce the resource count of the plot owner
  -- This should only ever be true for a Herdsman rustling from an existing pasture
  if (pUnit ~= nil and pUnit:GetUnitType() == iHerdsman and pPlot:GetResourceType() == iResourceHorses) then
    print("onImprovementDestroyed(herdsmen on horses)")
    local iOwner = pPlot:GetOwner()
    if (iOwner ~= -1) then
      local pOwner = Players[iOwner]
      print(string.format("onImprovementDestroyed(plot owned by %s)", pOwner:GetName()))
      pOwner:ChangeNumResourceTotal(iResourceHorses, -(pPlot:GetNumResource()))
      print(string.format("Reduced horses by %d for %s", pPlot:GetNumResource(), pOwner:GetName()))
    end
  end

  -- print("onImprovementDestroyed(exit)")
end
Events.SerialEventImprovementDestroyed.Add(onImprovementDestroyed)

function onImprovementCreated(iHexX, iHexY, iContinent1, iContinent2)
  -- print(string.format("onImprovementCreated(%d, %d, %d, %d)", iHexX, iHexY, iContinent1, iContinent2))
  local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))

  if (pPlot:GetImprovementType() == iImprovementRustle) then
    local pUnit = nil
    for i = 0, pPlot:GetNumUnits()-1, 1 do
      pUnit = pPlot:GetUnit(i)
      if (pUnit:GetUnitType() == iHerdsman) then
        break
      end
    end

    -- Need to change UNIT_HERDSMAN to UNIT_HERDSMAN_XYZ
    if (pPlot:GetResourceType() == iResourceHorses) then
      local pNewUnit = convertUnit(pUnit, "UNIT_HERDSMAN_HORSE")
      -- Special handling for horses, need to work out how many there were
      local iPlotHorses = pPlot:GetNumResource()
      local sUnitKey = string.format("HERDSMAN_%d", pNewUnit:GetID())
      Modding.OpenSaveData().SetValue(sUnitKey, string.format("%d", iPlotHorses))
      print(string.format("horses on plot %d, horses with unit %s", iPlotHorses, Modding.OpenSaveData().GetValue(sUnitKey)))
    elseif (pPlot:GetResourceType() == GameInfoTypes.RESOURCE_COW) then
      convertUnit(pUnit, "UNIT_HERDSMAN_COW")
    else
      convertUnit(pUnit, "UNIT_HERDSMAN_SHEEP")
    end

    ChangeResource(pPlot, -1, 0, -1)
    LuaEvents.SerialEventRawResourceIconDestroyed(iHexX, iHexY)
  elseif (pPlot:GetImprovementType() == iImprovementUnrustle) then
    local pUnit = nil
    for i = 0, pPlot:GetNumUnits()-1, 1 do
      pUnit = pPlot:GetUnit(i)
      if (pUnit:GetUnitType() == iHerdsmanHorses or pUnit:GetUnitType() == iHerdsmanCows or pUnit:GetUnitType() == iHerdsmanSheep) then
        break
      end
    end

    -- Need to create resource XYZ
    if (pUnit:GetUnitType() == iHerdsmanHorses) then
      -- Special handling for horses, need to work out how many there were
      local sUnitKey = string.format("HERDSMAN_%d", pUnit:GetID())
      local sUnitHorses = Modding.OpenSaveData().GetValue(sUnitKey)
      local iUnitHorses = tonumber(sUnitHorses) or 4

      ChangeResource(pPlot, iResourceHorses, iUnitHorses, iImprovementPasture)
      print(string.format("horses with unit %s, horses on plot %d", sUnitHorses, pPlot:GetNumResource()))

      -- Due to a change in event sequencing the onImprovementDestroyed event will execute after this one completes
      -- so we need to increse the number of horses, so it can subsequently decrease them
      local iOwner = pPlot:GetOwner()
      if (iOwner ~= -1) then
        local pOwner = Players[iOwner]
        print(string.format("onImprovementCreated(plot owned by %s)", pOwner:GetName()))
        pOwner:ChangeNumResourceTotal(iResourceHorses, pPlot:GetNumResource())
        print(string.format("Increased horses by %d for %s", pPlot:GetNumResource(), pOwner:GetName()))
      end
    else
      if (pUnit:GetUnitType() == iHerdsmanCows) then
        ChangeResource(pPlot, GameInfoTypes.RESOURCE_COW, 1, iImprovementPasture)
      else
        ChangeResource(pPlot, GameInfoTypes.RESOURCE_SHEEP, 1, iImprovementPasture)
      end
    end

    -- Need to change UNIT_HERDSMAN_XYZ to UNIT_HERDSMAN
    convertUnit(pUnit, "UNIT_HERDSMAN")
  end

  -- print("onImprovementCreated(exit)")
end
Events.SerialEventImprovementCreated.Add(onImprovementCreated)

function convertUnit(pUnit, sNewUnitType)
  print(string.format("convertUnit(%s, %s)", pUnit:GetName(), sNewUnitType))
  local pPlayer = Players[pUnit:GetOwner()]

  local x = pUnit:GetX()
  local y = pUnit:GetY()
  local d = pUnit:GetDamage()

  pUnit:Kill(true);
  local pNewUnit = pPlayer:InitUnit(GameInfoTypes[sNewUnitType], x, y)

  pNewUnit:SetDamage(d)
  pNewUnit:SetMoves(0)

  return pNewUnit
end


--
-- Helper function to change the resource/improvement on a given plot
-- allows for the plot being free, owned, owned by a city, and worked by a city
--
function ChangeResource(pPlot, iResource, iCount, iImprovement)
  local iOwner = pPlot:GetOwner()
  if (iOwner ~= -1) then
    local pCity = pPlot:GetWorkingCity()
    local bWorking = false
    local bForced = false
  
    if (pCity ~= nil) then
      bWorking = pCity:IsWorkingPlot(pPlot)
	  if (bWorking) then
	    bForced = pCity:IsForcedWorkingPlot(pPlot)
	    pCity:AlterWorkingPlot(pCity:GetCityPlotIndex(pPlot))
	  end
    end

    pPlot:SetOwner(-1)
    pPlot:SetResourceType(iResource, iCount)
    pPlot:SetOwner(iOwner)
    pPlot:SetImprovementType(iImprovement)
  
    if (bWorking) then
      if (bForced) then
	    pCity:AlterWorkingPlot(pCity:GetCityPlotIndex(pPlot))
	  else
        Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, 0)
	  end
    end
  else
    pPlot:SetResourceType(iResource, iCount)
    pPlot:SetImprovementType(iImprovement)
  end
end
