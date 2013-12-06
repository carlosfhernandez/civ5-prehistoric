-- HA_Policy
--------------------------------------------------------------
GameEvents.PlayerCanConstruct.Add(
function(iPlayer, buildingTypeID)
	local prereqPolicy = GameInfo.Buildings[buildingTypeID].PrereqPolicy
	if prereqPolicy then
		local player = Players[iPlayer]
		local policyID = GameInfo.Policies[prereqPolicy].ID
		if not player:HasPolicy(policyID) then
			return false
		end
	end
	return true
end)