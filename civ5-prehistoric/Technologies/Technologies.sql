

-- Delete Embassies from Writing (changed to Social Structure in xml)
UPDATE Technologies
SET AllowEmbassyTradingAllowed='false'
WHERE Type='TECH_WRITING';





-- Change Free Tech at start of game for EVERYONE
UPDATE Civilization_FreeTechs
SET TechType='TECH_GREAT_DIVERGENCE';


-- Add other free techs base on original list of civilizations in the table
-- INSERT INTO Civilization_FreeTechs
-- SELECT DISTINCT(CivilizationType), 'TECH_GREAT_DIVERGENCE' FROM Civilization_FreeTechs;

INSERT INTO Civilization_FreeTechs
SELECT DISTINCT(CivilizationType), 'TECH_PRIMATE_COGNITION' FROM Civilization_FreeTechs;

INSERT INTO Civilization_FreeTechs
SELECT DISTINCT(CivilizationType), 'TECH_ADAPTIVE_RADIATION' FROM Civilization_FreeTechs;

INSERT INTO Civilization_FreeTechs
SELECT DISTINCT(CivilizationType), 'TECH_EXTINCTION_EVENT' FROM Civilization_FreeTechs;





-- Moves the whole Tech Tree to the right according to number technology 
--    columns being added. 
-- !!Only works if this sql is above the Technologies.xml in the actions list!!

UPDATE Technologies
SET GridX = GridX + 14;
--SET GridX = GridX + 8;
