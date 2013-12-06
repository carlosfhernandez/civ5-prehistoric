function IsTerrainNative(UnitTypeID, TerrainTypeID)

	for row in GameInfo.Unit_TerrainNatives() do
		if (UnitTypeID == GameInfo["Units"][row.UnitType]["ID"] and TerrainTypeID == GameInfo["Terrains"][row.TerrainType]["ID"]) then
			return true;
		end
	end

	return false;
end

function IsFeatureNative(UnitTypeID, FeatureTypeID)

	for row in GameInfo.Unit_FeatureNatives() do
		if (UnitTypeID == GameInfo["Units"][row.UnitType]["ID"] and FeatureTypeID == GameInfo["Features"][row.FeatureType]["ID"]) then
			return true;
		end
	end

	return false;
end

function CreateAnimals( iPlayer )
	if (Players[iPlayer]:IsBarbarian() == false) then
		return;
	end

	if (Game:GetNumCivCities() < Game:CountCivPlayersAlive()) then
		return;
	end

	for id, area in Map.Areas() do
		if (area:IsWater() == false) then
			local iNeededAnimals = ((area:GetNumUnownedTiles() / GameDefines.UNOWNED_TILES_PER_GAME_ANIMAL) - area:GetUnitsPerPlayer(iPlayer));
			if (iNeededAnimals > 0) then
				iNeededAnimals = ((iNeededAnimals / 5) + 1);
				for iAnimal = 0, iNeededAnimals do
					local bestPlot = nil;
					local iValue = 0;
					local iBestValue = 0;
					local GridX, GridY = Map.GetGridSize();
					for iX = 0, GridX do
						for iY = 0, GridX do
							local plot = Map.GetPlot(iX, iY);
							if (plot ~= nil) then
								if (plot:GetArea() == area:GetID()) then
									if (plot:HasBarbarianCamp() == false and plot:IsCity() == false and plot:IsUnit() == false and plot:IsMountain() == false and plot:IsOwned() == false) then
										iValue = 1 + Map.Rand(1000, "Animal Plot Selection");
										if (iValue > iBestValue) then
											bestPlot = plot;
											iBestValue = iValue;
										end
									end
								end
							end
						end
					end
					if (bestPlot ~= nil) then
						local bestUnit = nil;
						iValue = 0;
						iBestValue = 0;
						for row in GameInfo.Units() do
							if (row.Animal == 1) then
								if ((IsTerrainNative(row.ID, GameInfo.Terrains[bestPlot:GetTerrainType()].ID) == true and bestPlot:GetFeatureType() == FeatureTypes.NO_FEATURE) or (IsFeatureNative(row.ID, GameInfo.Features[bestPlot:GetFeatureType()].ID) == true)) then
									iValue = 1 + Map.Rand(1000, "Animal Unit Selection");
									if (iValue > iBestValue) then
										bestUnit = row.ID;
										iBestValue = iValue;
									end
								end
							end
						end
						if (bestUnit ~= nil) then
							Players[iPlayer]:InitUnit(bestUnit, bestPlot:GetX(), bestPlot:GetY());							
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add( CreateAnimals )