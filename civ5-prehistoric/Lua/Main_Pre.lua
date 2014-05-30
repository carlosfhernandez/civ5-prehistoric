-- ---------------------------------------------------------------------------
-- Main_Pre
-- @author: carlos f hernandez [ apshai | carloscodex ]
-- @date: 2014-01-13 3:33:37 PM
-- @modified: 2014-05-28
-- @desc: main lua file for Civiliztion V Prehistory Mod
-- 
-- https://github.com/carlosfhernandez/civ5-prehistoric
-- ---------------------------------------------------------------------------

--[[

We are all nothing but gum on the bottom of the great shoe


------------------------------------------------------------------------------
NOTES
------------------------------------------------------------------------------



include examples:
------------------------------------------------------------------------------
include("CityBannerManager")
include("CityBannerManager.lua")

-- loads Assets/UI/Ingame/CityBannerManager.lua
include("Ingame\\CityBannerManager.lua") 
  
-- loads all files starting with "CityBanner" and ending with ".lua".
include("CityBanner%w+.lua", true) 

-- Loads all "*Popup.lua" files in Assets/UI/Ingame/PopupsGeneric. 
-- Then we print a statement for each one of the included files.
local files = include("InGame\\PopupsGeneric\\%w+Popup.lua", true);
for i, v in ipairs(files) do
    print("Loaded Popup - "..v);
end
------------------------------------------------------------------------------




end]]--

 

print( "\n\n" );
print( "main      | --------------------------------------------------" );
print( "main      | __FILE__ Main_Pre" );
print( "main      | --------------------------------------------------" );

print( "main      | including other files..." );



print( "main      | including logger" );
include( "logger" );
logger = Logger:new(Logger.LEVEL.DEBUG)
logger.PREFIX = "main"


print( "main      | including utils" );
include( "utils" );

print( "main      | including HasWithinCityBorders" );
include( "HasWithinCityBorders" );

print( "main      | including Units_Pre" );
include( "Units_Pre.lua" );



-- include("Barbarians/CreateAnimals.lua")


print( "\n\n" );
print( "--------------------------------------------------" );
print( "COMPLETE! Main_Pre" );
print( "--------------------------------------------------" );

