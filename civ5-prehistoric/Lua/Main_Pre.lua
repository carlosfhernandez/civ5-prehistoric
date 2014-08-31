--[[
-- 
-- Main_Pre
-- @files: Main_Pre.lua
-- @author: carlos f hernandez [ apshai | carloscodex ]
-- @date: 2014-01-13 
-- @modified: 2014-05-28
-- @src: https://github.com/carlosfhernandez/civ5-prehistoric
--
-- @desc: 
-- main lua file for Civiliztion V Prehistory Mod
-- 
--
-- @usage
--
--
-- @example:

Some ways to use includes in this file:

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


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

We are all nothing but gum on the bottom of the great shoe


******************************************************************************
end]]--





-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--
-- INITIAL LOG WRITING
--
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
-- Initial logging will always print. Can't use logger at this point until it
-- has been loaded.
print( "\n\n" );
print( "main      | --------------------------------------------------" );
print( "main      | __FILE__ Main_Pre" );
print( "main      | --------------------------------------------------" );





-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--
-- INCLUDES AND LOGGING
--
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


-- SaveUtils included *before* logger in case we need to load data, first. 
include( "SaveUtils" ); MY_MOD_NAME = "PrehistoricEra";

-- logger is an essential util library to be used in subsequent lua files
include( "logger" );

-- assign your logging level here:
logger = Logger:new(Logger.LEVEL.DEBUG)

-- in each file (or file part) you prefix your logging by using the following. 
-- this can be redefined in other files to override the setting below (as 
-- as the file is included after this point).
logger.PREFIX = "main"

-- a variety of utlities that are used through the Prehistoric Mod. these are
-- all placed within one lirary and are typicall small in nature. 
include( "utils" );

-- larger utils and functionality can be included here. these functions are 
-- self-contained and _should_ be able to be used in other mods 
include( "HasWithinCityBorders" );

-- prehistoric-mod-specific files. at some point I would like to create these
-- in a way that makes them reusable and modular for use by others. 
include( "Player_Pre.lua" );
include( "Units_Pre.lua" );
include( "City_Pre.lua" );
include( "Era_Pre.lua" );

-- to be included at some point:
-- include("Barbarians/CreateAnimals.lua")





-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--
-- CONFIGURATION AND OPTIONS
--
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


-- lost game only when all units are lost
-- TODO: change this for later game -- give player option
Game.SetOption(9, true)











-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--
-- FINALIZATION
--
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

print( "\n\n" );
print( "--------------------------------------------------" );
print( "COMPLETE! Main_Pre" );
print( "--------------------------------------------------" );

