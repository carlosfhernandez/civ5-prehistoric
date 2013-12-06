-- AMER_Main
-- Author: FramedArchitecture
-- DateCreated: 4/21/2013
--------------------------------------------------------------
include( "AddAmerResource.lua" );

local g_SaveData = Modding.OpenSaveData();
function Initialize()
	local bInit = g_SaveData.GetValue("AMER_ResourcesPlaced");
	if not bInit then
		PlaceModResources();
		g_SaveData.SetValue("AMER_ResourcesPlaced", true);
	end
end
Initialize();