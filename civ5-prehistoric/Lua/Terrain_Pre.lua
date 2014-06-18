

--[[


Terrain







------------------------------------------------------------------------------
Lua: the TerrainTypes enumeration
------------------------------------------------------------------------------

Firaxis provides a Lua enumeration named TerrainTypes. This is just a regular global table. Its keys are the constants' names and the pairs the corresponding values.

This specific enumeration contains data from the Terrains data table.

They are stored as key/value pairs: the keys are the strings from the Type column and the values are the integers from the ID column.

Below are the values found in this enumeration.

Key                   Value
--------------------- -----
"NO_TERRAIN"             -1
"TERRAIN_GRASS"           0
"TERRAIN_PLAINS"          1
"TERRAIN_DESERT"          2
"TERRAIN_TUNDRA"          3
"TERRAIN_SNOW"            4
"TERRAIN_COAST"           5
"TERRAIN_OCEAN"           6
"TERRAIN_MOUNTAIN"        7
"TERRAIN_HILL"            8
"NUM_TERRAIN_TYPES"       9




------------------------------------------------------------------------------
Examples


Here is how to use the LUA enumeration to retrieve the ID from the type. Those examples will return and assign the integer value 0.

local id = TerrainTypes.TERRAIN_GRASS
local id = TerrainTypes["TERRAIN_GRASS"]



Here are different ways to query the database to retrieve the ID from the type. Those examples will return and assign the integer value 0. See also GameInfo.

local id = GameInfo.Terrains.TERRAIN_GRASS.ID
local id = GameInfo["Terrains"].["TERRAIN_GRASS"].ID
local id = GameInfo.Terrains{Type="TERRAIN_GRASS"}().ID



Alternatively you could use the ID or the type to retrieve the value of the Description column. Those examples will return and assign the value TXT_KEY_TERRAIN_GRASS.

local description = GameInfo.Terrains[0].Description
local description = GameInfo["Terrains"][0]["Description"]
local description = GameInfo.Terrains{ID=0}().Description






------------------------------------------------------------------------------
Used by

              SetTerrainTypes(table(int => TerrainType) terrainTypes)
TerrainType   Plot:GetTerrainType()
              Plot:SetTerrainType(TerrainType terrain, bool recalculateAreas, bool rebuildGraphics))
              ReplayMap:SetPlot(int x, int y, TerrainType terrain, int r, int g, int b, int a)
table(int => TerrainType)   TerrainGenerator:GenerateTerrain()
int           Unit:GetExtraTerrainAttackPercent(TerrainType index)
int           Unit:GetExtraTerrainDefensePercent(TerrainType index)
bool          Unit:IsTerrainDoubleMove(TerrainType index)
int           Unit:TerrainAttackModifier(TerrainType terrain)
int           Unit:TerrainDefenseModifier(TerrainType terrain)









------------------------------------------------------------------------------
XML: the Terrains table
------------------------------------------------------------------------------

Here are the ID and Type columns found in this table.

ID  Type
--- ---------------------
0   TERRAIN_GRASS
1   TERRAIN_PLAINS
2   TERRAIN_DESERT
3   TERRAIN_TUNDRA
4   TERRAIN_SNOW
5   TERRAIN_COAST
6   TERRAIN_OCEAN
7   TERRAIN_MOUNTAIN
8   TERRAIN_HILL








--]]

