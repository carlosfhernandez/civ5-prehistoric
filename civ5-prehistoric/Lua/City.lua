


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


