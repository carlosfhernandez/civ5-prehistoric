



-- Time

-- CAN_WORK_WATER_FROM_GAME_START 1 - Determines whether you can work water tiles within city borders from the begining of the game or if you need to unlock this ability
-- EVENT_MESSAGE_TIME
-- START_YEAR
-- WEEKS_PER_MONTHS







-- Cities

--UPDATE Defines  SET Value =    0 WHERE Name = 'INITIAL_CITY_POPULATION'; -- works
UPDATE Defines  SET Value =    0 WHERE Name = 'CITY_PLOTS_RADIUS';
UPDATE Defines  SET Value =    0 WHERE Name = 'CITY_PLOTS_DIAMETER';
UPDATE Defines  SET Value =    2 WHERE Name = 'NUM_CITY_PLOTS';



-- BASE_CITY_GROWTH_THRESHOLD = 15 (base amount of food required for a city to grow)
-- CITY_GROWTH_MULTIPLIER
-- CITY_GROWTH_EXPONENT
-- FOOD_CONSUMPTION_PER_POPULATION
-- INITIAL_CITY_POPULATION = 1 
-- CITY_MIN_SIZE_FOR_SETTLERS
-- CITY_RING_1_MULTIPLIER
-- CITY_RING_2_MULTIPLIER
-- CITY_RING_3_MULTIPLIER
-- CITY_RING_4_MULTIPLIER
-- CITY_RING_5_MULTIPLIER
-- CITY_STRENGTH_DEFAULT
-- CITY_STRENGTH_POPULATION_CHANGE
-- CITY_STRENGTH_UNIT_DIVISOR
-- CITY_STRENGTH_TECH_BASE
-- CITY_STRENGTH_TECH_EXPONENT
-- CITY_STRENGTH_TECH_MULTIPLIER
-- CITY_STRENGTH_HILL_CHANGE
-- CITY_ATTACKING_DAMAGE_MOD
-- ATTACKING_CITY_MELEE_DAMAGE_MOD
-- CITY_ATTACK_RANGE
-- CAN_CITY_USE_INDIRECT_FIRE
-- CITY_RANGED_ATTACK_STRENGTH_MULTIPLIER
-- MIN_CITY_STRIKE_DAMAGE
-- CITY_CAPTURE_DAMAGE_PERCENT
-- CRAMPED_RANGE_FROM_CITY
-- CRAMPED_USABLE_PLOT_PERCENT
-- NUM_CITY_PLOTS 37
-- CITY_HOME_PLOT = 0
-- CITY_PLOTS_RADIUS = 3
-- CITY_PLOTS_DIAMETER = 7






-- Border Expansion

-- PLOT_BASE_COST (50) = cost of buying the first hex of land
-- PLOT_ADDITIONAL_COST_PER_PLOT (5) = additional cost of each further purchased hex of land
-- PLOT_COST_APPEARANCE_DIVISOR (5) = rounds cost to a multiple of 5 (but in which direction?)
-- CULTURE_COST_FIRST_PLOT (15) = amount of culture required to expand the borders of a city for the first time
-- CULTURE_COST_LATER_PLOT_MULTIPLIER (10) = 
-- CULTURE_COST_LATER_PLOT_EXPONENT (1.1) =
-- CULTURE_COST_VISIBLE_DIVISOR (5) =
-- CULTURE_PLOT_COST_MOD_MINIMUM (-85) = minimum culture cost after any discounts (15%)
-- MINOR_CIV_PLOT_CULTURE_COST_MULTIPLIER (150) =
-- MAXIMUM_BUY_PLOT_DISTANCE (3) = The maximum radius to purchase hexes aruond a city.
-- MAXIMUM_ACQUIRE_PLOT_DISTANCE (5) = The maximum radius to acquire hexes from a city (have not tested if this is less than MAXIMUM_BUY_PLOT_DISTANCE).
-- PLOT_INFLUENCE_DISTANCE_MULTIPLIER (100) =
-- PLOT_INFLUENCE_RING_COST (100) =
-- PLOT_INFLUENCE_WATER_COST (25) =
-- PLOT_INFLUENCE_IMPROVEMENT_COST (-5) =
-- PLOT_INFLUENCE_ROUTE_COST (0) =
-- PLOT_INFLUENCE_RESOURCE_COST (-105) =
-- PLOT_INFLUENCE_NW_COST (-105) =
-- PLOT_BUY_RESOURCE_COST (-100) =
-- PLOT_BUY_YIELD_COST (10) =
-- PLOT_INFLUENCE_YIELD_POINT_COST (-1) =
-- PLOT_INFLUENCE_NO_ADJACENT_OWNED_COST (1000) =





-- Visibility

-- RECON_VISIBILITY_RANGE 6 - The visibility of air units with recon
-- PLOT_VISIBILITY_RANGE 1
-- UNIT_VISIBILITY_RANGE 1
-- MOUNTAIN_SEE_FROM_CHANGE 2
-- MOUNTAIN_SEE_THROUGH_CHANGE 2
-- HILLS_SEE_FROM_CHANGE 1
-- HILLS_SEE_THROUGH_CHANGE 1
-- SEAWATER_SEE_FROM_CHANGE 1
-- SEAWATER_SEE_THROUGH_CHANGE 1




-- Combat

UPDATE Defines  SET Value =   200 WHERE Name = 'MAX_HIT_POINTS'; -- 100
UPDATE Defines  SET Value =   300 WHERE Name = 'MAX_CITY_HIT_POINTS'; -- 200
UPDATE Defines  SET Value =    15 WHERE Name = 'COMBAT_DAMAGE'; -- 20
UPDATE Defines  SET Value =    30 WHERE Name = 'NONCOMBAT_UNIT_RANGED_DAMAGE'; -- 40 | The damage dealt to noncombat units from ranged attacks.

-- NAVAL_COMBAT_DEFENDER_STRENGTH_MULTIPLIER
-- FLAT_LAND_EXTRA_DEFENSE (-10) = bonus for units on flatland (10% penalty)
-- HILLS_EXTRA_DEFENSE (25) = bonus for units on hill terrain (25%)
-- RIVER_ATTACK_MODIFIER (-20) = bonus for attacking across a river (20% penalty)
-- AMPHIB_ATTACK_MODIFIER (-50) = bonus for attacking from sea to land (50% penalty)

-- ENEMY_HEAL_RATE (1) = The amount of hp a unit will heal per turn in enemy territory.
-- NEUTRAL_HEAL_RATE (1) = The amount of hp a unit will heal per turn in neutral territory.
-- FRIENDLY_HEAL_RATE (2) = The amount of hp a unit will heal per turn in friendly territory.
-- CITY_HEAL_RATE (3) = The amount of hp a unit will heal per turn in a city.

-- ATTACK_SAME_STRENGTH_MIN_DAMAGE (2400) = The minimum amount of damage melee units deal when evenly matched in hundreths (4 damage).
-- RANGE_ATTACK_RANGED_DEFENDER_MOD (100) = The defensive value for ranged units against ranged attacks (125%).
-- ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (400) = developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-3 typically)
-- WOUNDED_DAMAGE_MULTIPLIER (50) =
-- TRAIT_WOUNDED_DAMAGE_MOD (-50) =

-- RANGE_ATTACK_SAME_STRENGTH_MIN_DAMAGE (200) = The minimum amount of damage ranged units deal when evenly matched in hundreths (2 damage).
-- RANGE_ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (400) = developer note: this will actually produce between 0.00 and 3.99 damage (rounded down to 0-2 typically)
-- AIR_STRIKE_SAME_STRENGTH_MIN_DEFENSE_DAMAGE (200) = The minimum amount of damage air units take when evenly matched in hundreths (2 damage).
-- AIR_STRIKE_SAME_STRENGTH_POSSIBLE_EXTRA_DEFENSE_DA MAGE (200) = developer note: this will actually produce between 0.00 and 1.99 damage (rounded down to 0-1 typically)
-- INTERCEPTION_SAME_STRENGTH_MIN_DAMAGE (400) = The minimum amount of damage air units deal in interception when evenly matched in hundreths (4 damage).
-- INTERCEPTION_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE (300) = developer note: this will actually produce between 0.00 and 2.99 damage (rounded down to 0-2 typically)
-- AIR_SWEEP_INTERCEPTION_DAMAGE_MOD (75) = The amount of damage air units deal in interception (75%).




-- Movement

-- MOVE_DENOMINATOR 60










