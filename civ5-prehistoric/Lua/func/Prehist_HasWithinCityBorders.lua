-- Buildings
-- Author: carlos
-- DateCreated: 1/9/2014 4:57:20 PM
--------------------------------------------------------------------------------

--[[

--------------------------------------------------------------------------------
float error keeps giving me 41.99999999999999999
--------------------------------------------------------------------------------

HasXXXWithinCityBorders -- Explanation, Reasonings, Thoughts, Questions

Determines if certain _things_ are within the city borders. These things are
anything that the game currently does not have a check for. As an example,
worked resources are checked by adding an entry in the XML (Table), 
"Building_LocalResourceOrs" and "Building_LocalResourceAnds". These two
create a requirement for "worked" resources. 

There are other programmable prerequesites for buildings such as:
- other buildings
- technologues
- general empire resource amounts
- global instances
- per player instances

I did not find a few of the prerequestites checking that I needed, so I am 
starting to build it. 

This is where I need the community's help. Am I duplicating work? Do these 
checks already exist in the game? Is there already a somewhat-standard library
that everyone uses for some of these preqrequisite checks?  I would love to find
out and I will post at the forums. In the meantime, this is my aim:

For Cities:
- HasFeatureWithinCityBorders(feature)
- HasTerrainWithinCityBorders(terrain)
- HasFeatureInRadius(feature, radius)
- HasTerrainInRadius(terrain, radius)
- HasConnectedResource(resource)
- HasConnectedResourceArea(resource, area)


Ownership

For now, I am taking the liberty of just saying if the _thing_ is within 
the city radius (whether it is 3, less, or more -- 5) then it counts as being 
"accessible" and therefore returns true. 

It is therefore possible for two or more cities to share the benefit of this
unworked and unimproved _thing_.

The point is that these tests can be used to determine if a _thing_ is close 
enough to a city to have some small impact (without having to be worked).


Progression

As an example, I could test for FLINT as a requirement for building a 
FIREPIT in a city. But, improving FLINT (creating an OUTPOST at the plot), on 
the other hand, could provide additional bonsues, such as enhanced arrowheads 
for archers and a new PROMOTION.  

The idea is to progress the level of effect that terrain, resources, 
features, and other _things_ have on a city and/or civilization. 

The full FLINT example:

Plot + FLINT = no bonus to Plot
FLINT within City borders = allow building
Outpost created on FLINT = promotion for primitive archers
2nd level improvement (tech req.) = bonus production on plot


Balance

Since I am adding resources to the game, I want to limit their immediate gains. 
FLINT gave no default extras. I do this because I use the ResourceGen script
which I think adds new resources in _addition_ to the standard set. If I were
to add luxury-type resources I would proabably also lower the happiness gain
down to 3. 


Performance

To start, I could organize logic for esacpe tests, such as asking the City if
it has a resource (meaning it is improved). Then, there is no need to proceed 
with the plot checks. B

Since I am testing all plots within range of each city, I am bound to double or 
triple check the plots. If there are 200 cities in the game, each with 37 plots,
that would be 7400 plot checks. I could keep a lookup table to avoid overlap
but that wouldn't be much of a gain. 

For resource checking I may be able to get a gain by using the resource as the 
starting plot and checking for cities within their radius -- maybe -- especially
if there are more cities than resources.


Non-Resource Performance

For other checks, such as "HasFeatureWithinCity(__ForestID__)", I would stick
with the city-first strategy.



Finally

Since I am new to all this, I could be rewriting methods and actions that 
already exist or that others have already created. I am still disecting code
and reading APIs (a little sparse -- I hope I can contribute). 

Please let me know if something is already there or if you have suggestions
on better ways to do this. 


Thanks!


end]]--


logger.PREFIX = "borders"

logger:info( "" )
logger:info( "__FILE__ HasWithinCityBorders" )


local bDebug = true


local TYPE_TYPES = {}
TYPE_TYPES['resources']   = 1
TYPE_TYPES['buildings']   = 2
TYPE_TYPES['terrain']     = 3
TYPE_TYPES['features']    = 4

--[[
  
  TODO: set new column in RESOURCES table to specify resource groupings:
        - animal
        - animal-like
        - food
        - mineral
  
  _OR_

  In the meantime, separate out these CONSTANTS into their own module.

]]--

local ANIMAL_RESOURCES = {
  'RESOURCE_HORSE',
  'RESOURCE_COW',
  'RESOURCE_SHEEP',
  'RESOURCE_DEER',
  'RESOURCE_FISH',
  'RESOURCE_WHALE',
  'RESOURCE_PEARLS',
  'RESOURCE_FUR',
  'RESOURCE_IVORY',
  'RESOURCE_CRAB'
}

local FOOD_RESOURCES = {}
for k,v in pairs(ANIMAL_RESOURCES) do FOOD_RESOURCES[k] = v end
table.insert(FOOD_RESOURCES, 'RESOURCE_WHEAT')
table.insert(FOOD_RESOURCES, 'RESOURCE_BANANA')
table.insert(FOOD_RESOURCES, 'RESOURCE_BERRIES')





-- UTILITIES (to go in separatte util file)
function b2s( p_bool ) 
  return string.format("%s", tostring( p_bool ));
end

function tbl_reverse(t)
  local reversedTable = {}
  local itemCount = #t
  for k, v in ipairs(t) do
    reversedTable[itemCount + 1 - k] = v
  end
  return reversedTable
end

function debug( s )
  if bDebug then
    print( s )
  end
end
-- END UTILITIES




--
-- HasWithinCity
--
-- @param {Array} things - for now it's just a simple object instead of array
-- @param {Function} f_success - success function to be called if check ok
-- @param {Function} f_test - test function to be called whether to proceed 
--                   checking or not. should be generalized, but is not now.
--
function HasWithinCity( player, p_type_type, things, f_success, f_pretest )

  local playerHuman = player:IsHuman();
  local ttype = TYPE_TYPES[p_type_type]

  if playerHuman then
    logger:info( "[HasWithinCity] Scanning " .. p_type_type )
  end

  -- if playerHuman then -- temporary debug
  for city in player:Cities() do

    logger:debug("[HasWithinCity] "); 
    logger:debug("[HasWithinCity] ");
    logger:debug("[HasWithinCity] ----------------------------------");
    logger:debug("[HasWithinCity] HasWithinCity: " .. ttype);
    logger:debug("[HasWithinCity] ----------------------------------");
    logger:debug("[HasWithinCity] Player: " .. player:GetName() .. " " .. player:GetID() );
    logger:debug("[HasWithinCity] Player: IsHuman: " .. b2s( playerHuman ) );
    logger:debug("[HasWithinCity] Name: " .. city:GetName());
    logger:debug("[HasWithinCity] GetX: " .. city:GetX());
    logger:debug("[HasWithinCity] GetY: " .. city:GetY());

    logger:debug("[HasWithinCity] [Plot] Scanning Plots...");

    if f_pretest(city, nil) then

      local plot = city:Plot()
      local x = plot:GetX()
      local y = plot:GetY()
      local r = 3
      local t = null

      for dx = -r, r do
        for dy = -r, r do
          plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, r)
          if plot then

            local plot_location_debug = "[ " .. x .. " x " .. y .. "   " .. dx .. " x " .. dy .. "]"


            --[[
              Following section is some unweildy code. I'd like to have a more 
              general function with smaller cases within the function and not
              need to have (eventually) one giant switch. 

              Also ...

              There will be the possibilty of searching for multiple types as
              AND or OR and need to take that into consideration.
            ]]


            if ttype == TYPE_TYPES['resources'] then
              
              local resourceID = plot:GetResourceType()
              if resourceID and resourceID > -1 then

                local resource = GameInfo.Resources[ resourceID ]

                logger:debug ("[HasWithinCity] [Plot] Found Resource: " .. resource.Type .. " at " .. plot_location_debug)

                local animalResourceFound = false

                for _, res in pairs(things) do
                  if resource.Type == res then
                    logger:debug( "[HasWithinCity] [Plot]                Matching: " .. res)
                    -- TODO: check for currently discovered ressources only
                    animalResourceFound = true
                  end
                end

                -- do not check for city real borders, just nearby resources
                -- within the specified range, 'r'

                if animalResourceFound then
                  f_success( city, nil )
                  return true
                end

              end

            end



            if ttype == TYPE_TYPES['features'] then

              featureID = plot:GetFeatureType()
              logger:debug ("[HasWithinCity] [Plot] Found Feature: " .. featureID .. " at " .. plot_location_debug)
              if featureID and featureID > 0 and things == featureID then

                local plot_in_city = plot:IsPlayerCityRadius(player) and plot:IsOwned()
                logger:debug("[HasWithinCity] [Plot]                in Big Radius")

                if plot_in_city then
                  logger:debug( "[HasWithinCity] [Plot]                within city boundary" )
                  f_success( city, nil )
                  return true
                end

              end

            end



          end -- plot
        end -- for y
      end -- for x

    else

    end -- f_pretest

  end -- cities loop

  -- end -- player debug


  return false

end



-- Buildings.lua BELOW
-- -----------------------------------------------------------------------------

-- all of these functions should be put together and sent to be checked all
-- at once so we don't have to repeatedly keep checking plots 

--
-- CanBuild_Causeway
-- 
-- @param {iPlayer} iPlayer
--
function CanBuild_Causeway ( iPlayer )

  local player = Players[iPlayer]; -- we're all players in the end

  local f_succ = function ( city, plot )
    logger:debug( "[CanBuild_Causeway] TRUE" )
    city:SetNumRealBuilding( GameInfoTypes.BUILDING_CAUSEWAY_PREREQ, 1 );
  end

  local f_pretest = function ( city, plot )
    return not (city:IsHasBuilding( GameInfoTypes.BUILDING_CAUSEWAY_PREREQ ) or city:IsHasBuilding( GameInfoTypes.BUILDING_CAUSEWAY ))
  end

  HasWithinCity ( player, 'features', GameInfoTypes.FEATURE_MARSH, f_succ, f_pretest )

end

--
-- CanBuild_FirePit
-- 
-- @param {iPlayer} iPlayer
--
function CanBuild_FirePit ( iPlayer )

  local player = Players[iPlayer]; -- we're still players playing at the game

  local f_succ = function ( city, plot )
    logger:debug( "[CanBuild_FirePit] TRUE")
    city:SetNumRealBuilding( GameInfoTypes.BUILDING_FIRE_PIT_PREREQ, 1 );
  end

  local f_pretest = function ( city, plot )
    return not (city:IsHasBuilding( GameInfoTypes.BUILDING_FIRE_PIT_PREREQ ) or city:IsHasBuilding( GameInfoTypes.BUILDING_FIRE_PIT ))
  end

  HasWithinCity ( player, 'resources', ANIMAL_RESOURCES, f_succ, f_pretest )

end


--
-- CanBuild
--
function CanBuild ( iPlayer )

  CanBuild_FirePit( iPlayer )
  CanBuild_Causeway( iPlayer )
  
end


GameEvents.PlayerDoTurn.Add( CanBuild );
logger:info("PlayerDoTurn.Add( CanBuild ); Count:" .. "[TODO]");
