-- Delete Embassies from Writing (changed to Social Structure, included in xml)

UPDATE Technologies
SET AllowEmbassyTradingAllowed='false'
WHERE Type='TECH_WRITING';



-- Change free tech at game start from Agriculture to Language

UPDATE Civilization_FreeTechs
SET TechType='TECH_SIMPLE_TOOLS'
WHERE TechType='TECH_AGRICULTURE';



-- Moves the whole Tech Tree _ spaces to the right, except for Prehistorical Techs
-- (only works if this sql is above the Technologies.xml in the actions list!)

UPDATE Technologies
SET GridX = GridX + 6;
