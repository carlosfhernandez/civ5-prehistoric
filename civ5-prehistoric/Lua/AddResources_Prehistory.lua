-- Resource Generator V4.0
-- Author: Deep_Blue
--------------------------------------------------------------

include( "SaveUtils" ); MY_MOD_NAME = "6c685d119c86_PREHISTORY_CARLOSCODEX";

include( "ResourceGen_Prehistory.lua" );

if load(Players[Game.GetActivePlayer()],"Resources_Generation_Completed") ~= nil then
	if load(Players[Game.GetActivePlayer()],"Resources_Generation_Completed") == 1 then
		return;
	end
end


--======================================================================================

--[[ 
OnMapResourceGenerator("RESOURCE_RUBBER");
OnMapResourceGenerator("RESOURCE_COCONUT");
OnMapResourceGenerator("RESOURCE_TEA", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
OnMapResourceGenerator("RESOURCE_FLAX", {"FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS"});
OnMapResourceGenerator("RESOURCE_BERRIES", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_FOREST", "FEATURE_MARSH"} );
OnMapResourceGenerator("RESOURCE_CACAO");
OnMapResourceGenerator("RESOURCE_TIN", {"FEATURE_OASIS"});
OnMapResourceGenerator("RESOURCE_AMBER");
OnMapResourceGenerator("RESOURCE_MANGANESE", {"FEATURE_OASIS"});
OnMapResourceGenerator("RESOURCE_ALOE_VERA", {"TERRAIN_TUNDRA", "TERRAIN_SNOW", "FEATURE_OASIS"} );
OnMapResourceGenerator("RESOURCE_TITANIUM", {"FEATURE_OASIS"});
OnMapResourceGenerator("RESOURCE_POPPY", {"FEATURE_OASIS"});
OnMapResourceGenerator("RESOURCE_COFFEE", {"TERRAIN_DESERT", "TERRAIN_TUNDRA", "TERRAIN_SNOW"} );
OnMapResourceGenerator("RESOURCE_WOOD");
OnMapResourceGenerator("RESOURCE_OAK", {"TERRAIN_DESERT"} );
OnMapResourceGenerator("RESOURCE_BARLEY", {"FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS", "FEATURE_MARSH"});
OnMapResourceGenerator("RESOURCE_MANGO");
OnMapResourceGenerator("RESOURCE_CORN", {"FEATURE_FOREST", "FEATURE_JUNGLE", "FEATURE_OASIS", "FEATURE_MARSH"});
OnMapResourceGenerator("RESOURCE_TOBACCO", {"FEATURE_FOREST"});
OnMapResourceGenerator("RESOURCE_JADE", {"FEATURE_OASIS"});
--]]



-- OnMapResourceGenerator("RESOURCE_WOOD");
OnMapResourceGenerator("RESOURCE_BERRIES");
OnMapResourceGenerator("RESOURCE_OBSIDIAN");
OnMapResourceGenerator("RESOURCE_FLINT");


--[[  

this function will automatically spread the resource on the map according to:
1) map size
2) number of civilizations in the game
3) Pre-game resource options (sparse,standard,..)
4) defined terrain&feature Booleans in resource xml file.
You can add as many resources as you want, example:
OnMapResourceGenerator("RESOURCE_MyResource1");
OnMapResourceGenerator("RESOURCE_MyResource2");

Advanced Options: 
----------------
you can use additional option with the function:

OnMapResourceGenerator("RESOURCE_MyResource" , Excludes )

Excludes is a table containing any Terrain or feature you do not want, put them in any order but 
they must have exact Type string in Civ5Terrains.xml and Civ5Features.xml otherwise they will be igonred.

Example:

OnMapResourceGenerator("RESOURCE_COPPER" , {"TERRAIN_DESERT", "TERRAIN_PLAINS"} )

--]]

--====================================================================================

save(Players[Game.GetActivePlayer()],"Resources_Generation_Completed",1);
