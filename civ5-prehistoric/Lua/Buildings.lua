-- Buildings
-- Author: carlos
-- DateCreated: 1/9/2014 4:57:20 PM
--------------------------------------------------------------


function GetNumResourcesInRange( player, types )
  local n = 0;
  for i, id in pairs(types) do
		return player:GetNumResourceAvailable(id, true) > 0 then
			n = n + 1;
		end
  end
  return n > 0
end

