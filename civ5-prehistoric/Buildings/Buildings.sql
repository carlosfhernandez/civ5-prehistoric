-- Buildings Table Modifications
--

ALTER TABLE Buildings     ADD IsVisible           boolean DEFAULT 1;
ALTER TABLE Buildings     ADD PediaVisible        boolean DEFAULT 1;
ALTER TABLE Buildings     ADD PolicyRequired      text    DEFAULT null;
ALTER TABLE Buildings     ADD ReligionRequired    text    DEFAULT null;




-- Change free BuildingClass from Palace to Chieftain's Hut

UPDATE Civilization_FreeBuildingClasses 
SET BuildingClassType='BUILDINGCLASS_TREE_LIFE'
WHERE BuildingClassType='BUILDINGCLASS_PALACE';


-- Change PrereqTechs for Palace, Shrine and Monument BuildingClasses:

UPDATE Buildings
SET PrereqTech='TECH_LEADERSHIP', Cost='40'
WHERE BuildingClass='BUILDINGCLASS_PALACE';

UPDATE Buildings
SET PrereqTech='TECH_IDOLS'
WHERE BuildingClass='BUILDINGCLASS_SHRINE';

UPDATE Buildings
SET PrereqTech='TECH_MASONRY'
WHERE BuildingClass='BUILDINGCLASS_MONUMENT';


-- Raise/add Flavors for the Palace to force AI to build it:

UPDATE Building_Flavors
SET Flavor='150'
WHERE BuildingType='BUILDING_PALACE';

INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_PRODUCTION", "150");
INSERT INTO "Building_Flavors" ('BuildingType', 'FlavorType',  'Flavor')
	VALUES	("BUILDING_PALACE", "FLAVOR_EXPANSION", "150");




