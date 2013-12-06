-- NEW_Main
-- Author: FramedArchitecture
-- DateCreated: 4/21/2013	Edited by: Horem on 29/04/13
--------------------------------------------------------------
include( "AddNewResources.lua" );

local g_SaveData = Modding.OpenSaveData();
function Initialize()
	local bInit = g_SaveData.GetValue("NEW_ResourcesPlaced");
	if not bInit then
		PlaceModResources();
		g_SaveData.SetValue("NEW_ResourcesPlaced", true);
	end
end
Initialize();