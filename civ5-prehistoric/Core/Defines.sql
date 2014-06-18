/*
 * DEFINES
 *
 * @file:       defines.sql
 * @modifier:   Carlos F Hernandez (apshai; carloscodex; carlosfhernandez)
 * @author:     Firaxis; 2k Games (Thank you Sid Meier)
 * @date:       2014.06.15
 *
 * Global config options.
 *
 * IMPORTANT NOTE! Some of these are just representations of internal settings
 * and even though you may define them here they will NOT reflect the change
 * in the game. The values seem to be hard-coded within the DLL.
 *
 * Most options can be changed. Those that cannot will be suffixed with an 
 * underscore with the original option NOT having the underscor
 *
 * THIS_IS_A_NONCIGURABLE_OPTION_
 * THIS_IS_AN_UNKNOWN_CONFIUGRABLE_OPTION
 * 
 * Configurable options will most likely be "set" in SQL, although I will have
 * some test setting of values. Eventually, the configurable options will
 * be marked somehow (in comments)
 * 
 * 
 * 


Some standards used within this document:


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SQL LINE BELOW:
UPDATE Defines  SET Value = XXXXXX.XXX WHERE Name = 'DEFINE_NAME_XX_HERE';              -- (XXX) original value and extra notes
UPDATE Defines  SET Value = XXXXXX.XXX WHERE Name = 'DEFINE_NAME_XX_HERE';              -- (XXX)
UPDATE Defines  SET Value = XXXXXX     WHERE Name = 'DEFINE_NAME_XX_HERE';
UPDATE Defines  SET Value =XXXXXXX     WHERE Name = 'DEFINE_NAME_XX_HERE';              -- extra X posiiton if needed
UPDATE Defines  SET Value =      X     WHERE Name = 'DEFINE_NAME_XX_HERE';
UPDATE Defines  SET Value =XXXXXXXXXXX WHERE Name = 'DEFINE_NAME_XX_HERE';              -- very large value
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
COMMENTS LINE BELOW:
THIS_IS_A_DEFINE                      BNW [VAN] {G&K}
THIS_IS_A_DEFINE                        1 [ 20] {  2} These are some notes
THIS_IS_A_DEFINE                       50 [  5] Right justified values
THIS_IS_A_DEFINE                     1000 {500} VAN(illa) and G&K are optional
THIS_IS_A_DEFINE               1000000000 {500} A very large value can be used as long as it doesn't interfere with the NAME
THIS_IS_A_DEFINE                        1 [ 20] {  2} These are some notes
THIS_IS_A_DEFINE                        1 [12345] {123456789} large values in previous version don't have x position stops if overflowed
THIS_IS_A_DEFINE                        1 A current value without previous version values
THIS_IS_DEFINE_WITH_A_VERY_LARGE_NAME     1234 A large name with a value that won't fit in the x-position
THIS_IS_DEFINE_WITH_A_VERY_LARGE___NAME 1 A large name with a value that DOES fit
THIS_IS_DEFINE_WITH_A_VERY_LARGE_NAME          1234 A large name with a value that needs more space - notice the tab stop
THIS_IS_DEFINE_WITH_A_VERY_VERY_VERY_LARGE_NAME     1234 A very large name that puts the value in the next stop position
THIS_IS_DEFINE_WITH_A_VERY_VERY_VERY_LARGE_NAME     1234 [123] {  3} A very large name with values including previous version

                                    38   43
        10        20        30    36 | 41 |   48   53    ...
                                   | |  | |    |    |    |
12345678901234567890123456789012345678901234567890123456789012345678901234567890
VALUE STOPS:                     [X*]XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX where [X*] is optional digits as long as they don't overrun the NAME
(Yes, this is overkill documentation formatting but being bipolar sometimes I get very focused on this stuff)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

*/






-- Time
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/*
CAN_WORK_WATER_FROM_GAME_START 1 - Determines whether you can work water tiles within city borders from the begining of the game or if you need to unlock this ability
EVENT_MESSAGE_TIME
START_YEAR
WEEKS_PER_MONTHS
*/






-- Cities
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =     300     WHERE Name = 'MAX_CITY_HIT_POINTS';             -- (200)


UPDATE Defines  SET Value =       0     WHERE Name = 'INITIAL_CITY_POPULATION';         -- works
UPDATE Defines  SET Value =       0     WHERE Name = 'CITY_PLOTS_RADIUS';               -- 
UPDATE Defines  SET Value =       1     WHERE Name = 'CITY_PLOTS_DIAMETER';             -- 
UPDATE Defines  SET Value =       2     WHERE Name = 'NUM_CITY_PLOTS';                  -- 


-- TODO: 3 will penalize food, 2 will remove one population
UPDATE Defines  SET Value =       4     WHERE Name = 'CITY_MIN_SIZE_FOR_SETTLERS';


UPDATE Defines  SET Value =     200     WHERE Name = 'CITY_STRENGTH_DEFAULT';
UPDATE Defines  SET Value =     300     WHERE Name = 'CITY_STRENGTH_HILL_CHANGE';
UPDATE Defines  SET Value =     200     WHERE Name = 'CITY_STRENGTH_DEFAULT';
UPDATE Defines  SET Value =     200     WHERE Name = 'CITY_STRENGTH_DEFAULT';

/*

MAX_CITY_HIT_POINTS                   200 ( 20) 
CITY_HIT_POINTS_HEALED_PER_TURN        20 (  2) 

INITIAL_CITY_POPULATION *               1 The number of citizens in newly settled cities.
BASE_CITY_GROWTH_THRESHOLD             15 Base amount of food required for a city to grow.
MIN_CITY_RANGE                          2 The minimum number of spaces between cities placed on the same continent

CITY_MIN_SIZE_FOR_SETTLERS              2 

CITY_RING_1_MULTIPLIER                  6
CITY_RING_2_MULTIPLIER                  3
CITY_RING_3_MULTIPLIER                  2
CITY_RING_4_MULTIPLIER                  1
CITY_RING_5_MULTIPLIER                  1

CITY_STRENGTH_DEFAULT
CITY_STRENGTH_POPULATION_CHANGE
CITY_STRENGTH_UNIT_DIVISOR
CITY_STRENGTH_TECH_BASE
CITY_STRENGTH_TECH_EXPONENT
CITY_STRENGTH_TECH_MULTIPLIER
CITY_STRENGTH_HILL_CHANGE

CITY_ATTACKING_DAMAGE_MOD
ATTACKING_CITY_MELEE_DAMAGE_MOD
CITY_ATTACK_RANGE
CAN_CITY_USE_INDIRECT_FIRE
CITY_RANGED_ATTACK_STRENGTH_MULTIPLIER
MIN_CITY_STRIKE_DAMAGE

CRAMPED_RANGE_FROM_CITY
CRAMPED_USABLE_PLOT_PERCENT

CITY_CAPTURE_DAMAGE_PERCENT

NUM_CITY_PLOTS                         37
CITY_HOME_PLOT                          0
CITY_PLOTS_RADIUS                       3
CITY_PLOTS_DIAMETER                     7

CITY_MAX_NUM_BUILDINGS                  1

*/







-- Border Expansion
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =      80     WHERE Name = 'PLOT_BASE_COST';                  -- ( 50)
UPDATE Defines  SET Value =      25     WHERE Name = 'CULTURE_COST_FIRST_PLOT';         -- ( 15)
UPDATE Defines  SET Value =       4     WHERE Name = 'MAXIMUM_BUY_PLOT_DISTANCE';       -- (  3)
UPDATE Defines  SET Value =       5     WHERE Name = 'MAXIMUM_ACQUIRE_PLOT_DISTANCE';   -- (  5)

/*

PLOT_BASE_COST                         50 Cost of buying the first hex of land
PLOT_ADDITIONAL_COST_PER_PLOT           5 Additional cost of each further purchased hex of land
PLOT_COST_APPEARANCE_DIVISOR            5 Rounds cost to a multiple of 5 (but in which direction?)
CULTURE_COST_FIRST_PLOT                15 Amount of culture required to expand the borders of a city for the first time
CULTURE_COST_LATER_PLOT_MULTIPLIER     10
CULTURE_COST_LATER_PLOT_EXPONENT      1.1
CULTURE_COST_VISIBLE_DIVISOR            5
CULTURE_PLOT_COST_MOD_MINIMUM         -85 Minimum culture cost after any discounts (15%)
MINOR_CIV_PLOT_CULTURE_COST_MULTIPLIER    150
MAXIMUM_BUY_PLOT_DISTANCE               3 The maximum radius to purchase hexes around a city
MAXIMUM_ACQUIRE_PLOT_DISTANCE           5 The maximum radius to acquire hexes from a city (have not tested if this is less than MAXIMUM_BUY_PLOT_DISTANCE)
PLOT_INFLUENCE_DISTANCE_MULTIPLIER    100
PLOT_INFLUENCE_RING_COST              100
PLOT_INFLUENCE_WATER_COST              25
PLOT_INFLUENCE_IMPROVEMENT_COST        -5
PLOT_INFLUENCE_ROUTE_COST               0
PLOT_INFLUENCE_RESOURCE_COST         -105
PLOT_INFLUENCE_NW_COST               -105
PLOT_BUY_RESOURCE_COST               -100
PLOT_BUY_YIELD_COST                    10
PLOT_INFLUENCE_YIELD_POINT_COST        -1
PLOT_INFLUENCE_NO_ADJACENT_OWNED_COST     1000

*/






-- Visibility
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =       0     WHERE Name = 'PLOT_VISIBILITY_RANGE';           -- (  1)
UPDATE Defines  SET Value =       1     WHERE Name = 'UNIT_VISIBILITY_RANGE';           -- (  1)


/*

-- Changes to visibility when standing on a hill or mountain. So a unit that 
-- goes up on a hill can see 1 hex further than if it was standing on flat 
-- land, and a unit on a mountain (if it's a hovering one like a helicopter) 
-- can see 2 hexes further.

-- The SEE_THROUGH variables are the reverse. You can see a mountain from 2 
-- hexes further away than a grassland, or a hill from 1 hex further away. This 
-- is especially noticeable with early naval units, where you might see the 
-- mountains inshore before you even see the coast.

RECON_VISIBILITY_RANGE                  6 The visibility of air units with recon.
UNIT_VISIBILITY_RANGE                   1
PLOT_VISIBILITY_RANGE                   1 
MOUNTAIN_SEE_FROM_CHANGE                2
MOUNTAIN_SEE_THROUGH_CHANGE             2
HILLS_SEE_FROM_CHANGE                   1
HILLS_SEE_THROUGH_CHANGE                1
SEAWATER_SEE_FROM_CHANGE                1
SEAWATER_SEE_THROUGH_CHANGE             1



*/





-- Unit Combat & Healing
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =     200     WHERE Name = 'MAX_HIT_POINTS';                -- (100)

UPDATE Defines  SET Value =      15     WHERE Name = 'ENEMY_HEAL_RATE';               -- ( 10)
UPDATE Defines  SET Value =      15     WHERE Name = 'NEUTRAL_HEAL_RATE';             -- ( 10)
UPDATE Defines  SET Value =      20     WHERE Name = 'FRIENDLY_HEAL_RATE';            -- ( 20)

UPDATE Defines  SET Value =      15     WHERE Name = 'COMBAT_DAMAGE';                 -- ( 20)
UPDATE Defines  SET Value =      30     WHERE Name = 'NONCOMBAT_UNIT_RANGED_DAMAGE';  -- ( 40) - The damage dealt to noncombat units from ranged attacks.


/*

                                      BNW [VAN] {G&K}
MAX_CITY_HIT_POINTS                   200 [ 20]  
MAX_HIT_POINTS                        100 [ 10]  
ENEMY_HEAL_RATE                        10 [  1] The amount of hp a unit will heal per turn in enemy territory.
NEUTRAL_HEAL_RATE                      10 [  1] The amount of hp a unit will heal per turn in neutral territory.
FRIENDLY_HEAL_RATE                     20 [  2] The amount of hp a unit will heal per turn in friendly territory.
CITY_HEAL_RATE                         25 [  3] The amount of hp a unit will heal per turn in a city.
INSTA_HEAL_RATE                        50 

FLAT_LAND_EXTRA_DEFENSE                 0 [-10] bonus for units on flatland (10% penalty)
HILLS_EXTRA_DEFENSE                    25 bonus for units on hill terrain (25%)
RIVER_ATTACK_MODIFIER                 -20 bonus for attacking across a river (20% penalty)
AMPHIB_ATTACK_MODIFIER                -50 bonus for attacking from sea to land (50% penalty)

ATTACK_SAME_STRENGTH_MIN_DAMAGE (2400) = The minimum amount of damage melee units deal when evenly matched in hundreths (4 damage).
ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (400) (1200) = developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-3 typically)
WOUNDED_DAMAGE_MULTIPLIER (50) (33) =
TRAIT_WOUNDED_DAMAGE_MOD (-50) =

RANGE_ATTACK_RANGED_DEFENDER_MOD (100) = The defensive value for ranged units against ranged attacks (125%).
RANGE_ATTACK_SAME_STRENGTH_MIN_DAMAGE (200) = The minimum amount of damage ranged units deal when evenly matched in hundreths (2 damage).
RANGE_ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (400) = developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-2 typically)
AIR_STRIKE_SAME_STRENGTH_POSSIBLE_EXTRA_DEFENSE_DA MAGE (200) (2400) = developer note: this will actually produce between 0.00 and 1.99 damage (rounded down to 0-1 typically)
AIR_STRIKE_SAME_STRENGTH_MIN_DEFENSE_DAMAGE (200) (1200) = The minimum amount of damage air units take when evenly matched in hundreths (2 damage).
INTERCEPTION_SAME_STRENGTH_MIN_DAMAGE (400) (2400) = The minimum amount of damage air units deal in interception when evenly matched in hundreths (4 damage).
INTERCEPTION_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (300) (1200) = developer note: this will actually produce between 0.00 and 2.99 damage (rounded down to 0-2 typically)
AIR_SWEEP_INTERCEPTION_DAMAGE_MOD (75) = The amount of damage air units deal in interception (75%).

NAVAL_COMBAT_DEFENDER_STRENGTH_MULTIPLIER (40) = 

*/










-- Movement
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

-- MOVE_DENOMINATOR 60

/*

HILLS_EXTRA_MOVEMENT (1) = The number of extra moves required to cross hills.
RIVER_EXTRA_MOVEMENT (10) = The number of extra moves required to cross rivers.
FEATURE_GROWTH_MODIFIER (25) =
ROUTE_FEATURE_GROWTH_MODIFIER (-50) = 
EXTRA_YIELD (1) = 
FORTIFY_MODIFIER_PER_TURN (25) = The bonus to defending when fortified (+25% and stacks per turn).
MAX_FORTIFY_TURNS (2) = The max stacks of the fortification bonus.

*/









-- Buildings and Wonders
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/*

MAX_WORLD_WONDERS_PER_CITY             -1 The number of world wonders a city may construct (unlimited).
MAX_TEAM_WONDERS_PER_CITY              -1 The number of team wonders a city may construct (unlimited).
MAX_NATIONAL_WONDERS_PER_CITY          -1 The number of national wonders a city may construct (unlimited).
MAX_NATIONAL_WONDERS_PER_CITY_FOR_OCC  -1 The number of national wonders a city may construct using One City Challenge (unlimited).
MAX_BUILDINGS_PER_CITY                 -1 The number of buildings a city may construct (unlimited).

NUM_BUILDING_AND_TECH_PREREQS           3 The max number of "and" prerequisites the engine will read for buildings before ignoring them.
NUM_BUILDING_RESOURCE_PREREQS           5 The max number of resource prerequisites the engine will read for buildings before ignoring them.

BUILDING_PRODUCTION_DECAY_TIME         50 
BUILDING_PRODUCTION_DECAY_PERCENT      99 The amount of decay that is allowable for a building to reach, if started then dropped lower in the building que, if other City builds take preference, before it is dropped from the que altogether.


*/







-- Food & City Growth
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/*

CITY_CAPTURE_POPULATION_PERCENT        50 The percent of the population a captured city will retain (50%).
BASE_CITY_GROWTH_THRESHOLD             15 The amount of food required for city growth from size 1 to size 2.
CITY_GROWTH_MULTIPLIER                  8 The additional amount each pop adds to the growth bucket (8x).
CITY_GROWTH_EXPONENT                  1.5 The additional amount pop adds to the growth bucket ([x-1]^1.5).
FOOD_CONSUMPTION_PER_POPULATION         2 The amount of food each citizen consumes. 

*/







-- Happiness
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =       0.75  WHERE Name = 'UNHAPPINESS_PER_POPULATION';          -- [1]
UPDATE Defines  SET Value =       3     WHERE Name = 'UNHAPPINESS_PER_CITY';                -- [2]
UPDATE Defines  SET Value =       5     WHERE Name = 'UNHAPPINESS_PER_CAPTURED_CITY';       -- [5]
UPDATE Defines  SET Value =       1.34  WHERE Name = 'UNHAPPINESS_PER_OCCUPIED_POPULATION'; -- [1.34]


/*

HAPPINESS_PER_CITY_WITH_STATE_RELIGION (0) = Assumed to be obsolete.
HAPPINESS_PER_NATURAL_WONDER (1) = The global happiness that each natural wonder grants.
HAPPINESS_PER_EXTRA_LUXURY (0) = The global happiness excess luxuries grant.

UNHAPPINESS_PER_POPULATION (1) = The global unhappiness caused per population.
UNHAPPINESS_PER_OCCUPIED_POPULATION (1.34) = The global unhappiness caused per population in occupied cities.
UNHAPPINESS_PER_CITY (2) = The global unhappiness caused by each city.
UNHAPPINESS_PER_CAPTURED_CITY (5) = The unhappiness caused by annexed cities without a courthouse.
UNHAPPY_GROWTH_PENALTY (-75) = The bonus to excess food in every city when below 0 global happiness (75% penalty).

VERY_UNHAPPY_GROWTH_PENALTY (-100) = The bonus to excess food in every city when below the Very Unhappy treshold (see below).
VERY_UNHAPPY_CANT_TRAIN_SETTLERS (1) = Civilizations below the Very Unhappy cannot train settlers (when set to 1).
VERY_UNHAPPY_THRESHOLD (-10) = The treshold where a civilization becomes Very Unhappy (at -10).
VERY_UNHAPPY_COMBAT_PENALTY (-33) = Bonus to military units in a Very Unhappy civilization (-33%).
VERY_UNHAPPY_PRODUCTION_PENALTY (-50) = The bonus to production in Very Unhappy civilizations (-50%).

STRATEGIC_RESOURCE_EXHAUSTED_PENALTY (-50) = The bonus to military units which require a strategic resource the civilization currently does not have enough of (-50%).
SUPER_UNHAPPY_THRESHOLD (-20) = The treshold where a civilization becomse Super Unhappy.

REVOLT_COUNTER_MIN (4) = 
REVOLT_COUNTER_POSSIBLE (3) = 
REVOLT_NUM_BASE (100) =
REVOLT_NUM_CITY_COUNT (20) =

WLTKD_GROWTH_MULTIPLIER (25) = The increase in excess food under We Love The King Day (+25%).

*/











-- Minor Civs

-- TODO: 1) Alter contact gold
--          A) to bigger values in later eras
--          B) to different bonuses first, then gold later
-- TODO: 2) Postpone all Minor Civs from appears until later eras

UPDATE Defines  SET Value =      20     WHERE Name = 'MINOR_CIV_CONTACT_GOLD_FIRST';
UPDATE Defines  SET Value =      10     WHERE Name = 'MINOR_CIV_CONTACT_GOLD_OTHER';









-- Barbarian
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/*

BARBARIAN_CAMP_FIRST_TURN_PERCENT_OF_TARGET_TO_ADD (33) =
BARBARIAN_CAMP_ODDS_OF_NEW_CAMP_SPAWNING (2) =
BARBARIAN_CAMP_MINIMUM_DISTANCE_CAPITAL (4) = The minimum distance barbarian camps may spawn to a civilization's capital.
BARBARIAN_CAMP_MINIMUM_DISTANCE_ANOTHER_CAMP (7) = The minimum distance barbarian camps may spawn to another barbarian camp.
BARBARIAN_CAMP_COASTAL_SPAWN_ROLL (6) = 
BARBARIAN_EXTRA_RAGING_UNIT_SPAWN_CHANCE (10) =
BARBARIAN_NAVAL_UNIT_START_TURN_SPAWN (30) =
MAX_BARBARIANS_FROM_CAMP_NEARBY (2) =
MAX_BARBARIANS_FROM_CAMP_NEARBY_RANGE (4) =
GOLD_FROM_BARBARIAN_CONVERSION (25) = 
BARBARIAN_CITY_GOLD_RANSOM (200) =
BARBARIAN_UNIT_GOLD_RANSOM (100) = 

*/











-- Unit Combat
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

UPDATE Defines  SET Value =       1 WHERE Name = 'PLOT_UNIT_LIMIT'; -- [1] TODO

/*

PLOT_UNIT_LIMIT                         1 Number of stackable units on single plot
ZONE_OF_CONTROL_ENABLED                 1 Is zone of control enabled? (1 = yes.)
FIRE_SUPPORT_DISABLED                   1 
MAX_HIT_POINTS                         10 unit max hitpoints
MAX_CITY_HIT_POINTS                    25 city max hitpoints
CITY_HIT_POINTS_HEALED_PER_TURN         2 base hitpoints cities heal each turn
FLAT_LAND_EXTRA_DEFENSE               -10 bonus for units on flatland (10% penalty)
HILLS_EXTRA_DEFENSE                    25 bonus for units on hill terrain (25%)
RIVER_ATTACK_MODIFIER                 -20 bonus for attacking across a river (20% penalty)
AMPHIB_ATTACK_MODIFIER                -50 bonus for attacking from sea to land (50% penalty)
ENEMY_HEAL_RATE                         1 The amount of hp a unit will heal per turn in enemy territory.
NEUTRAL_HEAL_RATE                       1 The amount of hp a unit will heal per turn in neutral territory.
FRIENDLY_HEAL_RATE                      2 The amount of hp a unit will heal per turn in friendly territory.
CITY_HEAL_RATE                          3 The amount of hp a unit will heal per turn in a city.
ATTACK_SAME_STRENGTH_MIN_DAMAGE       400 The minimum amount of damage melee units deal when evenly matched in hundreths (4 damage).
RANGE_ATTACK_RANGED_DEFENDER_MOD      125 The defensive value for ranged units against ranged attacks (125%).
ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE        400 developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-3 typically)
RANGE_ATTACK_SAME_STRENGTH_MIN_DAMAGE 200 The minimum amount of damage ranged units deal when evenly matched in hundreths (2 damage).
RANGE_ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE  400 developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-2 typically)
AIR_STRIKE_SAME_STRENGTH_MIN_DEFENSE_DAMAGE       200 The minimum amount of damage air units take when evenly matched in hundreths (2 damage).
AIR_STRIKE_SAME_STRENGTH_POSSIBLE_EXTRA_DEFENSE_DA MAGE      200 developer note: this will actually produce between 0.00 and 1.99 damage (rounded down to 0-1 typically)
INTERCEPTION_SAME_STRENGTH_MIN_DAMAGE 400 The minimum amount of damage air units deal in interception when evenly matched in hundreths (4 damage).
INTERCEPTION_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE  300 developer note: this will actually produce between 0.00 and 2.99 damage (rounded down to 0-2 typically)
AIR_SWEEP_INTERCEPTION_DAMAGE_MOD      75 The amount of damage air units deal in interception (75%).
WOUNDED_DAMAGE_MULTIPLIER              50
TRAIT_WOUNDED_DAMAGE_MOD              -50

*/










-- Experience
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

-- TODO: configurable to allow for other mods
UPDATE Defines  SET Value =     150     WHERE Name = 'BARBARIAN_MAX_XP_VALUE';

/*

EXPERIENCE_PER_LEVEL                (10) = The amount of additional experience a unit must acquire to gain each level (10. then 20 more, then 30 more).
EXPERIENCE_ATTACKING_UNIT_MELEE     (5) = The amount of xp a unit gains when attacking in melee.
EXPERIENCE_DEFENDING_UNIT_MELEE     (4) = The amount of xp a unit gains when defending in melee.
EXPERIENCE_ATTACKING_UNIT_AIR       (4) = The amount of xp a unit gains when attacking in air.
EXPERIENCE_DEFENDING_UNIT_AIR       (2) = The amount of xp a unit gains when defending in air.
EXPERIENCE_ATTACKING_UNIT_RANGED    (2) = The amount of xp a unit gains when attacking a unit in range.
EXPERIENCE_DEFENDING_UNIT_RANGED    (2) = The amount of xp a unit gains when defending against a ranged attack.
EXPERIENCE_ATTACKING_AIR_SWEEP      (5) = The amount of xp a unit gains when performing an air sweep.
EXPERIENCE_DEFENDING_AIR_SWEEP_AIR  (5) = The amount of xp an air unit gains when defending an air sweep.
EXPERIENCE_DEFENDING_AIR_SWEEP_GROUND (2) = The amount of xp a ground unit gains when defending an air sweep.
EXPERIENCE_ATTACKING_CITY_MELEE     (5) = The amount of xp a unit gains when attacking a city in melee.
EXPERIENCE_ATTACKING_CITY_RANGED    (3) = The amount of xp a unit gains when attacking a city in range.
EXPERIENCE_ATTACKING_CITY_AIR       (4) = The amount of xp an air unit gains when attacking a city.
BARBARIAN_MAX_XP_VALUE              (30) = The maximum xp a unit may earn from fighting barbarians.
COMBAT_EXPERIENCE_IN_BORDERS_PERCENT (100) = 

*/











-- ? MISC
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

-- TODO: enable this later
UPDATE Defines  SET Value =       1     WHERE Name = 'CAN_WORK_WATER_FROM_GAME_START';

/*

CAN_WORK_WATER_FROM_GAME_START          1 Determines whether you can work water tiles within city borders from the begining of the game or if you need to unlock this ability
NAVAL_PLOT_BLOCKADE_RANGE               2 The number of hexes naval units blockade in radius. The distance from an enemy ship that tiles become unworkable.
EVENT_MESSAGE_TIME                     10
START_YEAR                          -4000 The starting date of the game (4000 BC). The Year the game starts at.
WEEKS_PER_MONTHS                        4


AIR_UNIT_REBASE_RANGE_MULTIPLIER      200 The max range that air units may rebase (200% of combat range).

MAX_YIELD_STACK (5) = 
MOVE_DENOMINATOR (60) =

STARTING_DISTANCE_PERCENT (12) = 
MIN_CIV_STARTING_DISTANCE (10) = Minimum number of plots between civs

OWNERSHIP_SCORE_DURATION_THRESHOLD (20) =
NUM_POLICY_BRANCHES_ALLOWED (2) =
VICTORY_POINTS_NEEDED_TO_WIN (20) =
NUM_VICTORY_POINT_AWARDS (5) =
NUM_OR_TECH_PREREQS (3) = The max number of "or" prerequisites the engine will read for techs before ignoring them.
NUM_AND_TECH_PREREQS (4) = The max number of "and" prerequisites the engine will read for techs before ignoring them.
NUM_UNIT_AND_TECH_PREREQS (3) =The max number of "and" tech prerequisites the engine will read for units before ignoring them.

BASE_RESEARCH_RATE (1) =









INDUSTRIAL_ROUTE_PRODUCTION_MOD (50) = The percentile production bonus granted to cities connected to the capital by rails (+50%).
RESOURCE_DEMAND_COUNTDOWN_BASE (15) = 
RESOURCE_DEMAND_COUNTDOWN_CAPITAL_ADD (25) =
RESOURCE_DEMAND_COUNTDOWN_RAND (10) =
NEW_HURRY_MODIFIER (50) =


GREAT_GENERAL_RANGE (2) = The number of hexes (in radius) effected by Great Generals.
GREAT_GENERAL_STRENGTH_MOD (20) = The bonus to surrounding units from Great Generals (+20%).
BONUS_PER_ADJACENT_FRIEND (10) = The bonus from each friendly unit flanking an enemy (+10%).
POLICY_ATTACK_BONUS_MOD (33) = The bonus from the autocracy social policy (+33%).
CONSCRIPT_MIN_CITY_POPULATION (5) = 
CONSCRIPT_POPULATION_PER_COST (60) =
MIN_TIMER_UNIT_DOUBLE_MOVES (32) =
COMBAT_DAMAGE (20) = 




TECH_COST_EXTRA_TEAM_MEMBER_MODIFIER (50) = 
TECH_COST_TOTAL_KNOWN_TEAM_MODIFIER (30) =
TECH_COST_KNOWN_PREREQ_MODIFIER (20) = 
PEACE_TREATY_LENGTH (10) = The number of turns you may not attack an opponent after signing a peace treaty with them.
COOP_WAR_LOCKED_LENGTH (15) = 


BASE_FEATURE_PRODUCTION_PERCENT (67) =
FEATURE_PRODUCTION_PERCENT_MULTIPLIER (0) =
DIFFERENT_TEAM_FEATURE_PRODUCTION_PERCENT (67) =
DEFAULT_WAR_VALUE_FOR_UNIT (100) =
UNIT_PRODUCTION_PERCENT (100) =
MAX_UNIT_SUPPLY_PRODMOD (70) =
BUILDING_PRODUCTION_PERCENT (100) =
PROJECT_PRODUCTION_PERCENT (100) =
MAXED_UNIT_GOLD_PERCENT (100) = 
MAXED_BUILDING_GOLD_PERCENT (100) =
MAXED_PROJECT_GOLD_PERCENT (300) =
MAX_CITY_DEFENSE_DAMAGE (100) =


CIRCUMNAVIGATE_FREE_MOVES (0) = The number of extra moves given to naval units of the first civ to circumnavigate the world.
BASE_CAPTURE_GOLD (20) = The base value of gold when capturing a city.
CAPTURE_GOLD_PER_POPULATION (10) = The amount of bonus gold granted per population of a captured city.
CAPTURE_GOLD_RAND1 (20) = 
CAPTURE_GOLD_RAND2 (20) =
CAPTURE_GOLD_MAX_TURNS (50) =
BARBARIAN_CITY_ATTACK_MODIFIER (-25) = The bonus barbarians receive when attacking cities (-25%).
UNIT_PRODUCTION_DECAY_PERCENT (98) = The amount of decay allowed for a unit to reach, if started then dropped lower in the building que, if other City Builds take preference, before it is dropped from the que altogether.BASE_UNIT_UPGRADE_COST (10) = 
UNIT_UPGRADE_COST_PER_PRODUCTION (2) = 
UNIT_UPGRADE_COST_MULTIPLIER_PER_ERA (0.0) =
UNIT_UPGRADE_COST_EXPONENT (1.0) =
UNIT_UPGRADE_COST_VISIBLE_DIVISOR (5) =
UNIT_UPGRADE_COST_DISCOUNT_MAX (-75) =
WAR_SUCCESS_UNIT_CAPTURING (1) =
WAR_SUCCESS_CITY_CAPTURING (10) = 
DIPLO_VOTE_SECRETARY_GENERAL_INTERVAL (4) =
TEAM_VOTE_MIN_CANDIDATES (2) = 
RESEARCH_AGREEMENT_TIMER (20) = The base number of turns a research agreement takes using standard settings.









QUICKSAVE (QuickSave) =
--------------------------------------------------------------------------------
LAKE_PLOT_RAND (160) = In Civ4 these were the same numbers. It meant that for every 160 tiles of the map there was a random roll, to include a lake.
PLOTS_PER_RIVER_EDGE (12) = That means that a river will usually be of 6 plots length, unless the map-script overrides this limit.
RIVER_SOURCE_MIN_RIVER_RANGE (4) = A river should flow at least 4 plots from it's source, unless the map-script overrides it.
RIVER_SOURCE_MIN_SEAWATER_RANGE (2) = 2 plots from the coast river start, governs forced rivers when a game is balancing areas to make them better for settling.
LAKE_MAX_AREA_SIZE (9) = A lake may only be as large as this many hexes.






Maintenance and trade routes:
--------------------------------------------------------------------------------
INITIAL_GOLD_PER_UNIT_TIMES_100 (50) =
INITIAL_FREE_OUTSIDE_UNITS (3) = 
INITIAL_OUTSIDE_UNIT_GOLD_PERCENT (0) =
UNIT_MAINTENANCE_GAME_MULTIPLIER (8) =
UNIT_MAINTENANCE_GAME_EXPONENT_DIVISOR (7) =
FREE_UNIT_HAPPINESS (0) = 
TRADE_ROUTE_BASE_GOLD (100) = The base yield of trade routes in hundreths (1 gold).
TRADE_ROUTE_CAPITAL_POP_GOLD_MULTIPLIER (0) = The gold per population of the capital yield for trade routes in hundreths (0 gold).
TRADE_ROUTE_CITY_POP_GOLD_MULTIPLIER (125) = The gold per population of connected cities yield of trade routes in hundreths (1.25 gold per pop).
DEFICIT_UNIT_DISBANDING_THRESHOLD (-5) =
BUILDING_SALE_DIVISOR (10) =
DISBAND_UNIT_REFUND_PERCENT (10) =







Golden age mechanics:
--------------------------------------------------------------------------------
GOLDEN_AGE_BASE_THRESHOLD_HAPPINESS (500) = The amount of excess happiness required to start first golden age.
GOLDEN_AGE_THRESHOLD_CITY_MULTIPLIER (0.01) =
GOLDEN_AGE_EACH_GA_ADDITIONAL_HAPPINESS (250) = The amount of excess happiness added to trigger each additional golden age.
GOLDEN_AGE_VISIBLE_THRESHOLD_DIVISOR (5) = 
BASE_GOLDEN_AGE_UNITS (1) = 
GOLDEN_AGE_UNITS_MULTIPLIER (1) = 
GOLDEN_AGE_LENGTH (10) = The number of turns a golden age from happiness wil last.
GOLDEN_AGE_GREAT_PEOPLE_MODIFIER (100) = 
MIN_UNIT_GOLDEN_AGE_TURNS (3) = The minimum length of golden ages sparked by great people.







Nuke mechanics:
--------------------------------------------------------------------------------
NUKE_FALLOUT_PROB (50) = The chance of hexes attacked by a nuke to receive the fallout feature (50%).
NUKE_UNIT_DAMAGE_BASE (3) = The base damage dealt to units by nukes.
NUKE_UNIT_DAMAGE_RAND_1 (4) = The possible bonus damage dealt by level 1 or 2 nukes.
NUKE_UNIT_DAMAGE_RAND_2 (4) = The possible additional bonus damage dealt to units by level 2 nukes.
NUKE_NON_COMBAT_DEATH_THRESHOLD (6) = The damage dealt to noncombat units by nukes.
NUKE_LEVEL1_POPULATION_DEATH_BASE (30) = The base percentile of population killed by atomic bombers (-30% pop).
NUKE_LEVEL1_POPULATION_DEATH_RAND_1 (20) = Random additional damage to pop from atomic bombers.
NUKE_LEVEL1_POPULATION_DEATH_RAND_2 (20) = Random additional damage to pop from atomic bombers.
NUKE_LEVEL2_POPULATION_DEATH_BASE (60) = The base percentile of population killed by a nuclear missle (-60% pop).
NUKE_LEVEL2_POPULATION_DEATH_RAND_1 (10) = Random additional damage to pop from a nuclear missle.
NUKE_LEVEL2_POPULATION_DEATH_RAND_2 (10) = Random additional damage to pop from a nuclear missle.
NUKE_LEVEL2_ELIM_POPULATION_THRESHOLD (5) = A city with this pop or lower is instantly destroyed by a nuclear missle.
NUKE_CITY_HIT_POINT_DAMAGE (50) = The percent of hp the city loses when nuked.
NUKE_BLAST_RADIUS (2) = The number of hexes (radius) surrounding targetted tile that are nuked.






Policy mechanics:
--------------------------------------------------------------------------------
BASE_POLICY_COST (25) = The base cost of a civilization's first social policy.
POLICY_COST_INCREASE_TO_BE_EXPONENTED (6) =
POLICY_COST_EXPONENT (1.70) = 
POLICY_COST_VISIBLE_DIVISOR (5) =
SWITCH_POLICY_BRANCHES_ANARCHY_TURNS (1) = The number of turns of anarchy when a civilzation switches between incompatible social policies.
POLICY_COST_DISCOUNT_MAX (-75) = The maximum percentile discount allowed for social policy cost.





Gold rush mechanics:
--------------------------------------------------------------------------------

# Cost =
# 
#  
# round((a • c)^b • (1 + m/100). -1)
#
# a: GameDefines.GOLD_PURCHASE_GOLD_PER_PRODUCTION
# b: GameDefines.HURRY_GOLD_PRODUCTION_EXPONENT
# c:  cost
# m: Building.HurryCostModifier
# 
# 
# Also... their rounding function rounds down instead of to the nearest multiple of ten. This is rather puzzling because not much processing power is saved:
# 
# Down:
# math.floor(num * 10^places) / 10^places
# 
# Nearest: 
# math.floor(num * 10^places + 0.5) / 10^places
GOLD_PURCHASE_GOLD_PER_PRODUCTION (30) = Coefficient for the production formula a*^b
HURRY_GOLD_PRODUCTION_EXPONENT (0.75) = Exponent for the production formula a*^b
GOLD_PURCHASE_VISIBLE_DIVISOR (10) =
PROJECT_PURCHASING_DISABLED (1) = Can a civilization purchase projects? (1 = disabled)
HURRY_GOLD_TECH_EXPONENT (1.10) =
HURRY_GOLD_CULTURE_EXPONENT (1.10) =







INFLUENCE_MOUNTAIN_COST (3) =
INFLUENCE_HILL_COST (2) =
INFLUENCE_RIVER_COST (1) =
USE_FIRST_RING_INFLUENCE_TERRAIN_COST (0) = The first ring Influence Cost around a city. When a city is founded, the first ring costs nothing in culture or gold.
NUM_RESOURCE_QUANTITY_TYPES (4) =
SPECIALISTS_DIVERT_POPULATION_ENABLED (0) =
SCIENCE_PER_POPULATION (1) = The number of beakers each population grants.
RESEARCH_AGREEMENT_MOD (0) =







Embarked mechanics:
--------------------------------------------------------------------------------
EMBARKED_UNIT_COMBAT_STRENGTH (0) = The combat strength of embarked units (is it flat or percentage?).
EMBARKED_NOT_CIVILIAN_COMBAT_STRENGTH (500) = Combat strength of non-civilian embarked units which can defend themselves.
EMBARKED_UNIT_MOVEMENT (2) = The movement rate of embarked units.
EMBARKED_VISIBILITY_RANGE (0) = The visibility range of embarked units.



DEFAULT_MAX_NUM_BUILDERS (-1) =
BARBARIAN_TECH_PERCENT (75) =
CITY_RESOURCE_WLTKD_TURNS (20) = The number of turns a city will stay in WLTKD.
MAX_SPECIALISTS_FROM_BUILDING (4) = The max number of specialists allowed per building.
GREAT_PERSON_THRESHOLD_BASE (100) = The amount of great person points needed to spawn the first great person in a city.
GREAT_PERSON_THRESHOLD_INCREASE (100) = The amount of additional great person points needed for consecutive great people.
GREAT_PERSON_VICTORY_POINTS (2) =
CULTURE_BOMB_COOLDOWN (10) = number of turns before a player may use another culture bomb
CULTURE_BOMB_MINOR_FRIENDSHIP_CHANGE (-50) = The amount of influence you gain with minor civs by taking their land with a Great Artist culture bomb (-50).
POST_COMBAT_TEXT_DELAY (1.0) =
UNIT_AUTO_EXPLORE_DISABLED (0) = Is auto-explore disabled? (0 = no.)
UNIT_WORKER_AUTOMATION_DISABLED (0) = Is worker automation disabled? (0 = no.)
UNIT_DELETE_DISABLED (0) = Is unit delete disabled? (0 = no.)
UNIT_PRODUCTION_DECAY_TIME (10) = 


MIN_START_AREA_TILES (4) = An area of less than 4 tiles will not be picked by the map script as a starting area for a CS or a Civilization.
MIN_DISTANCE_OTHER_AREA_PERCENT (75) = 75% of the basic 9 tiles distance defined by (Sirian) W. Thomas, in the basic map-script of Starting Assigns. 
MINOR_CIV_FOOD_REQUIREMENT (2) =
MAJOR_CIV_FOOD_REQUIREMENT (2) =
MIN_START_FOUND_VALUE_AS_PERCENT_OF_BEST (50) = 
START_AREA_FOOD_MULTIPLIER (6) =
START_AREA_HAPPINESS_MULTIPLIER (12) = 
START_AREA_PRODUCTION_MULTIPLIER (8) = 
START_AREA_GOLD_MULTIPLIER (2) =
START_AREA_SCIENCE_MULTIPLIER (1) = 
START_AREA_RESOURCE_MULTIPLIER (1) =
START_AREA_STRATEGIC_MULTIPLIER (1) = 
START_AREA_BUILD_ON_COAST_PERCENT (20) =



AI Settler mechanics:
--------------------------------------------------------------------------------
SETTLER_FOOD_MULTIPLIER (15) = The value AI settlers give to food when evaluating where to settle.
SETTLER_HAPPINESS_MULTIPLIER (8) = The value AI settlers give to happiness when evaluating where to settle.
SETTLER_PRODUCTION_MULTIPLIER (3) = The value AI settlers give to production when evaluating where to settle.
SETTLER_GOLD_MULTIPLIER (2) = The value AI settlers give to gold when evaluating where to settle.
SETTLER_SCIENCE_MULTIPLIER (1) = The value AI settlers give to science when evaluating where to settle.
SETTLER_RESOURCE_MULTIPLIER (3) = The value AI settlers give to bonus resources when evaluating where to settle.
SETTLER_STRATEGIC_MULTIPLIER (1) = The value AI settlers give to strategic resources when evaluating where to settle.
SETTLER_BUILD_ON_COAST_PERCENT (25) = The bonus value AI settlers give to building on the coast when evaluating where to settle (+25%).
CITY_RING_1_MULTIPLIER (12) = The weight AI settlers give to the first ring of hexes when evaluating where to settle.
CITY_RING_2_MULTIPLIER (6) = The weight AI settlers give to the second ring of hexes when evaluating where to settle.
CITY_RING_3_MULTIPLIER (2) = The weight AI settlers give to the third ring of hexes when evaluating where to settle.
SETTLER_EVALUATION_DISTANCE (20) = The maximum distance AI settlers will evaulate city construction.
SETTLER_DISTANCE_DROPOFF_MODIFIER (75) = 
BUILD_ON_RESOURCE_PERCENT (-50) = The bonus value AI settlers give to building on a resource when evaluating where to settle (-50%).
BUILD_ON_RIVER_PERCENT (50) = The bonus value AI settlers give to building on a river when evaluating where to settle (+50%).
CHOKEPOINT_STRATEGIC_VALUE (3) =
HILL_STRATEGIC_VALUE (2) =
ALREADY_OWNED_STRATEGIC_VALUE (-1000) =



Minor civ mechanics:
--------------------------------------------------------------------------------MINOR_CIV_CONTACT_GOLD_FIRST (30) = The gold bonus for finding a minor civ (city-state) first.
MINOR_CIV_CONTACT_GOLD_OTHER (15) = The gold bonus for finding a minor civ (city-state), but not the first to do so.
MINOR_CIV_GROWTH_PERCENT (150) = The percent at which minor civs grow (150% food produciton).
MINOR_CIV_PRODUCTION_PERCENT (150) = The percent at which minor civs produce (150% production).
MINOR_CIV_GOLD_PERCENT (200) = The percent at which minor civs gain gold (200% commerce).
MINOR_CIV_TECH_PERCENT (40) = The percent at which minor civs research (40% beakers).
MINOR_POLICY_RESOURCE_MULTIPLIER (200) = The amount of resources you receive from minor civs with the patronage policy modifier (200%).
MINOR_POLICY_RESOURCE_HAPPINESS_MULTIPLIER (150) = The amount of happiness you receive from minor civs with the patronage policy modifier (150%).
MINOR_GOLD_GIFT_LARGE (1000) = The gold value of a large gift to a minor civ (city-state).
MINOR_GOLD_GIFT_MEDIUM" (500) = The gold value of a medium gift to a minor civ (city-state).
MINOR_GOLD_GIFT_SMALL (250) = The gold value of a small gift to a minor civ (city-state).
MINOR_FRIENDSHIP_FROM_TRADE_MISSION (30) = The amount of influence gained by a Great Merchant trade mission.












City combat mechanics:
Spoiler:  

CITY_STRENGTH_DEFAULT (600) = The base defense for a newly settled city (6.00).
CITY_STRENGTH_POPULATION_CHANGE (25) = The amount of defense added for each population (0.25).
CITY_STRENGTH_UNIT_DIVISOR (500) =
CITY_STRENGTH_TECH_BASE (5) =
CITY_STRENGTH_TECH_EXPONENT (2.0) =
CITY_STRENGTH_TECH_MULTIPLIER (2) =
CITY_STRENGTH_HILL_MOD (15) =
CITY_ATTACKING_DAMAGE_MOD (50) =
ATTACKING_CITY_MELEE_DAMAGE_MOD (100) =
CITY_ATTACK_RANGE (2) = The max range a city may fire.
CAN_CITY_USE_INDIRECT_FIRE (1) = Does a city have indirect fire? (1 = yes.)
CITY_RANGED_ATTACK_STRENGTH_MULTIPLIER (50) =
MIN_CITY_STRIKE_DAMAGE (1) = The minimum damage a city can deal.
CITY_CAPTURE_DAMAGE_PERCENT (50) = A captured city retains this percentile of hp (50%).










Spoiler:  

GREAT_GENERALS_THRESHOLD_INCREASE (50) = The amount of additional xp required to spawn consecutive Great Generals.
GREAT_GENERALS_THRESHOLD_INCREASE_TEAM (50) =
GREAT_GENERALS_THRESHOLD (200) = The amount of xp required to spawn a Great General.
UNIT_DEATH_XP_GREAT_GENERAL_LOSS (50) =
MIN_EXPERIENCE_PER_COMBAT (1) = The minimum amount of experience a unit can gain through one combat.
MAX_EXPERIENCE_PER_COMBAT (10) = The maximum amount of experience a unit may gain through one combat.
CRAMPED_RANGE_FROM_CITY (5) =
CRAMPED_USABLE_PLOT_PERCENT (25) =
PROXIMITY_NEIGHBORS_CLOSEST_CITY_REQUIREMENT (7) =
PROXIMITY_CLOSE_CLOSEST_CITY_POSSIBILITY (11) =
PROXIMITY_CLOSE_DISTANCE_MAP_MULTIPLIER (25) =
PROXIMITY_CLOSE_DISTANCE_MAX (20) =
PROXIMITY_CLOSE_DISTANCE_MIN (10) =
PROXIMITY_FAR_DISTANCE_MAP_MULTIPLIER (45) =
PROXIMITY_FAR_DISTANCE_MAX (50) =
PROXIMITY_FAR_DISTANCE_MIN (20) =

Border expansion mechanics:
Spoiler:  

PLOT_BASE_COST (50) = cost of buying the first hex of land
PLOT_ADDITIONAL_COST_PER_PLOT (5) = additional cost of each further purchased hex of land
PLOT_COST_APPEARANCE_DIVISOR (5) = rounds cost to a multiple of 5 (but in which direction?)
CULTURE_COST_FIRST_PLOT (15) = amount of culture required to expand the borders of a city for the first time
CULTURE_COST_LATER_PLOT_MULTIPLIER (10) = 
CULTURE_COST_LATER_PLOT_EXPONENT (1.1) =
CULTURE_COST_VISIBLE_DIVISOR (5) =
CULTURE_PLOT_COST_MOD_MINIMUM (-85) = minimum culture cost after any discounts (15%)
MINOR_CIV_PLOT_CULTURE_COST_MULTIPLIER (150) =
MAXIMUM_BUY_PLOT_DISTANCE (3) = The maximum radius to purchase hexes aruond a city.
MAXIMUM_ACQUIRE_PLOT_DISTANCE (5) = The maximum radius to acquire hexes from a city (have not tested if this is less than MAXIMUM_BUY_PLOT_DISTANCE).
PLOT_INFLUENCE_DISTANCE_MULTIPLIER (100) =
PLOT_INFLUENCE_RING_COST (100) =
PLOT_INFLUENCE_WATER_COST (25) =
PLOT_INFLUENCE_IMPROVEMENT_COST (-5) =
PLOT_INFLUENCE_ROUTE_COST (0) =
PLOT_INFLUENCE_RESOURCE_COST (-105) =
PLOT_INFLUENCE_NW_COST (-105) =
PLOT_BUY_RESOURCE_COST (-100) =
PLOT_BUY_YIELD_COST (10) =
PLOT_INFLUENCE_YIELD_POINT_COST (-1) =
PLOT_INFLUENCE_NO_ADJACENT_OWNED_COST (1000) =


Spoiler:  

UNITED_NATIONS_COUNTDOWN_TURNS (10) = The number of turns after the United Nations world wonder is built before the first check for diplomatic victory.
OWN_UNITED_NATIONS_VOTE_BONUS (1) = The number of bonus votes you get for diplomatic victory if you own the United Nations world wonder.


# You need (67 - 1.1*N)% of the total votes to win (rounded down I believe), 
# where N is the number of civilizations in the game (counting both regular civs 
# and city-states, but NOT adding 1 for the U.N.). So on a default Small map 
# (6 civs + 12 city-states), you'd need 47.2% of the votes assuming no one was 
# liminated along the way. Note that as civilizations and/or city-states are 
# eliminated the percentage required goes up (N gets smaller), which can make 
# the game effectively unwinnable by diplomacy if enough city-states go away. 
# So, the Default Vote Percent is the 67 in that equation, and the 1.1 is the 
# Team Multiplier.
# 
# The remaining two variables form a cap: If there are more than 28 civs 
# (Algorithm Threshold) in the game, just set the victory threshold to 35% 
# (Beyond Algorithm Multiplier). 67 - 1.1*28 = 36.2, so 29 civs is where it'd 
# be hitting 35% anyway. 28 civs really only comes up on the largest map sizes, 
# and many civs will be eliminated before reaching the U.N, so this almost never 
# comes up in practice. But for modding purposes, this'd allow you to set a flat 
# percentage; if the Threshold was set to 0, then the Multiplier becomes a flat 
# victory threshold. So you could say that it's ALWAYS 50% to win, regardless of 
# map size, by setting these to 0 and 50.
# 
# The result of how these four are set up is that if you modify one of these 
# variables, you'll need to also modify at least two others. Otherwise, the 
# "cap" variables will be discontinuous with the normal scaling, unless you want 
# one of the two methods to go away entirely.
DIPLO_VICTORY_ALGORITHM_THRESHOLD (28) =
DIPLO_VICTORY_BEYOND_ALGORITHM_MULTIPLIER (35) =
DIPLO_VICTORY_TEAM_MULTIPLIER (1.1) =
DIPLO_VICTORY_DEFAULT_VOTE_PERCENT (67) =

SCORE_CITY_MULTIPLIER (8) = Each city placed grants this many victory points (unsure how puppets affect this).
SCORE_POPULATION_MULTIPLIER (4) = Each population acquired grants this many victory points (unsure of puppet effects).
SCORE_LAND_MULTIPLIER (1) = Each hex of land (not seas) controlled grants this many victory points.
SCORE_WONDER_MULTIPLIER (25) = Each world wonder built grants this many victory points.
SCORE_TECH_MULTIPLIER (4) = Each tech researched grants this many victory points.
SCORE_FUTURE_TECH_MULTIPLIER (10) = Each time Future Tech is researched this many points are granted to the player.
VICTORY_POINTS_PER_ERA (1) =
MIN_GAME_TURNS_ELAPSED_TO_TEST_VICTORY (10) =
ZERO_SUM_COMPETITION_WONDERS_VICTORY_POINTS (5) =
ZERO_SUM_COMPETITION_POLICIES_VICTORY_POINTS (5) =
ZERO_SUM_COMPETITION_GREAT_PEOPLE_VICTORY_POINTS (5) =
MAX_CITY_DIST_HIGHWATER_MARK (3) =
CITY_ZOOM_LEVEL_1 (500.0) =
CITY_ZOOM_LEVEL_2 (700.0) = 
CITY_ZOOM_LEVEL_3 (800.0) =
CITY_ZOOM_OFFSET (20.0) =
HEAVY_RESOURCE_THRESHOLD (3) =
PROGRESS_POPUP_TURN_FREQUENCY (25) =
SETTLER_PRODUCTION_SPEED (0) =
BUY_PLOTS_DISABLED (0) = Is purchasing of hexes by money disabled? (0 = no.)
MAX_SUPPORTED_MAP_X (152) =
MAX_SUPPORTED_MAP_Y (96) =
WARLORD_EXTRA_EXPERIENCE_PER_UNIT_PERCENT (0) =
MINOR_CIV_ROUTE_QUEST_WEIGHT (1000) =
WITHDRAW_MOD_ENEMY_MOVES (-20) =
WITHDRAW_MOD_BLOCKED_TILE (-20) =
ALLOW_EXTENDED_PLAY (1) = Is the player allowed to continue with the game once it is finished? (1 = yes.)





<Row Name="CAN_WORK_WATER_FROM_GAME_START"><Value>1</Value> = if turned to 0 you cannot assign citizens to water tiles.
<Row Name="NAVAL_PLOT_BLOCKADE_RANGE"><Value>2</Value> = Blockading range of ships, similar to ranged attack ranges.
<Row Name="EVENT_MESSAGE_TIME"><Value>10</Value>
<Row Name="START_YEAR"><Value>-4000</Value> = Game starts at 4000 BC
<Row Name="WEEKS_PER_MONTHS"><Value>4</Value>

<Row Name="RECON_VISIBILITY_RANGE"><Value>6</Value>
<Row Name="PLOT_VISIBILITY_RANGE"><Value>1</Value>
<Row Name="UNIT_VISIBILITY_RANGE"><Value>1</Value>
<Row Name="AIR_UNIT_REBASE_RANGE_MULTIPLIER"><Value>200 </Value>
<Row Name="MOUNTAIN_SEE_FROM_CHANGE"><Value>2</Value>
<Row Name="MOUNTAIN_SEE_THROUGH_CHANGE"><Value>2</Value>
<Row Name="HILLS_SEE_FROM_CHANGE"><Value>1</Value>
<Row Name="HILLS_SEE_THROUGH_CHANGE"><Value>1</Value>
<Row Name="SEAWATER_SEE_FROM_CHANGE"><Value>1</Value>
<Row Name="SEAWATER_SEE_THROUGH_CHANGE"><Value>1</Value>

<Row Name="MAX_YIELD_STACK"><Value>5</Value>
<Row Name="MOVE_DENOMINATOR"><Value>60</Value>
<Row Name="STARTING_DISTANCE_PERCENT"><Value>12</Value>
<Row Name="MIN_CIV_STARTING_DISTANCE"><Value>10</Value>
<Row Name="MIN_CITY_RANGE"><Value>2</Value> = number of spaces between same continent city placement
<Row Name="OWNERSHIP_SCORE_DURATION_THRESHOLD"><Value>2 0</Value>
<Row Name="NUM_POLICY_BRANCHES_ALLOWED"><Value>2</Value>
<Row Name="VICTORY_POINTS_NEEDED_TO_WIN"><Value>20</Value>
<Row Name="NUM_VICTORY_POINT_AWARDS"><Value>5</Value>
<Row Name="NUM_OR_TECH_PREREQS"><Value>3</Value>
<Row Name="NUM_AND_TECH_PREREQS"><Value>4</Value>
<Row Name="NUM_UNIT_AND_TECH_PREREQS"><Value>3</Value>
<Row Name="NUM_BUILDING_AND_TECH_PREREQS"><Value>3</Value>
<Row Name="NUM_BUILDING_RESOURCE_PREREQS"><Value>5</Value>
<Row Name="BASE_RESEARCH_RATE"><Value>1</Value> = Number of beakers given "for free"
<Row Name="MAX_WORLD_WONDERS_PER_CITY"><Value>-1</Value> = Number of world wonders city can construct, currently set to unlimited
<Row Name="MAX_TEAM_WONDERS_PER_CITY"><Value>-1</Value> = Similar to above
<Row Name="MAX_NATIONAL_WONDERS_PER_CITY"><Value>-1</Value> = Similar to above
<Row Name="MAX_NATIONAL_WONDERS_PER_CITY_FOR_OCC"><Valu e>-1</Value> = If I only could remember what OOC did stand for, I could perhaps understand this too.
<Row Name="MAX_BUILDINGS_PER_CITY"><Value>-1</Value> = Number of buildings one city can construct, currently set to unlimited.
<Row Name="INITIAL_CITY_POPULATION"><Value>1</Value> = citizens in settles cities
<Row Name="CITY_CAPTURE_POPULATION_PERCENT"><Value>50</Value> = Percent of population that remains in captured city after capture.
<Row Name="BASE_CITY_GROWTH_THRESHOLD"><Value>15</Value> = amount of food required for city growth from 1 to 2 pop
<Row Name="CITY_GROWTH_MULTIPLIER"><Value>8</Value>
<Row Name="CITY_GROWTH_EXPONENT"><Value>1.5</Value>
<Row Name="FOOD_CONSUMPTION_PER_POPULATION"><Value>2</Value> = amount of food citizens require
<Row Name="HAPPINESS_PER_CITY_WITH_STATE_RELIGION"><Val ue>0</Value> = This must be obsolete.
<Row Name="HAPPINESS_PER_NATURAL_WONDER"><Value>1</Value> = happiness NWs grant
<Row Name="HAPPINESS_PER_EXTRA_LUXURY"><Value>0</Value> = Number of happiness extra (you have more than one) luxuries give. 
<Row Name="UNHAPPINESS_PER_POPULATION"><Value>1</Value> = its name
<Row Name="UNHAPPINESS_PER_OCCUPIED_POPULATION"><Value> 1.34</Value> = its name
<Row Name="UNHAPPINESS_PER_CITY"><Value>2</Value> = its name
<Row Name="UNHAPPINESS_PER_CAPTURED_CITY"><Value>5</Value> = Unhappiness captured cities generate before court house has been built.
<Row Name="UNHAPPY_GROWTH_PENALTY"><Value>-75</Value> = penalty to excess food in every city when below 0 global happiness
<Row Name="VERY_UNHAPPY_GROWTH_PENALTY"><Value>-100</Value> = Similar to above except this is for civs whose happiness excess -10 
<Row Name="VERY_UNHAPPY_CANT_TRAIN_SETTLERS"><Value>1</Value> = If this field is set to '1', civs with -10 happiness cannot train settlers.
<Row Name="VERY_UNHAPPY_THRESHOLD"><Value>-10</Value> = Number of unhappiness needed for civ to be 'very unhappy'
<Row Name="VERY_UNHAPPY_COMBAT_PENALTY"><Value>-33</Value> = Combat penalty percent for civs which are very unhappy. Combat unit of unhappy civ get currently -33% combat strength. 
<Row Name="STRATEGIC_RESOURCE_EXHAUSTED_PENALTY"><Value >-50</Value>
<Row Name="VERY_UNHAPPY_PRODUCTION_PENALTY"><Value>-50</Value> = Production penalty percent for very unhappy civs. 
<Row Name="SUPER_UNHAPPY_THRESHOLD"><Value>-20</Value>
<Row Name="REVOLT_COUNTER_MIN"><Value>4</Value>
<Row Name="REVOLT_COUNTER_POSSIBLE"><Value>3</Value>
<Row Name="REVOLT_NUM_BASE"><Value>100</Value>
<Row Name="REVOLT_NUM_CITY_COUNT"><Value>20</Value>
<Row Name="WLTKD_GROWTH_MULTIPLIER"><Value>25</Value> = % increase in excess food under We Love The King Day
<Row Name="INDUSTRIAL_ROUTE_PRODUCTION_MOD"><Value>50</Value>
<Row Name="RESOURCE_DEMAND_COUNTDOWN_BASE"><Value>15</Value>
<Row Name="RESOURCE_DEMAND_COUNTDOWN_CAPITAL_ADD"><Valu e>25</Value>
<Row Name="RESOURCE_DEMAND_COUNTDOWN_RAND"><Value>10</Value>






















*/

