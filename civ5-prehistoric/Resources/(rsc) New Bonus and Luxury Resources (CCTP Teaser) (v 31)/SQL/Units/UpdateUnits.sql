--
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_TITANIUM' WHERE UnitType ='UNIT_MECHANIZED_INFANTRY';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_OAK' WHERE UnitType ='UNIT_FRIGATE';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_OAK' WHERE UnitType ='UNIT_PRIVATEER';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_OAK' WHERE UnitType ='UNIT_CATAPULT';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_OAK' WHERE UnitType ='UNIT_TREBUCHET';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_OAK' WHERE UnitType ='UNIT_ROMAN_BALLISTA';
--
INSERT INTO Unit_ResourceQuantityRequirements	(UnitType,						ResourceType,			Cost) VALUES
												('UNIT_PRIVATEER',				'RESOURCE_OAK',			1),
												('UNIT_CATAPULT',				'RESOURCE_OAK',			1),
												('UNIT_CARAVEL',				'RESOURCE_OAK',			1),
												('UNIT_ROMAN_BALLISTA',			'RESOURCE_OAK',			1),
												('UNIT_TREBUCHET',				'RESOURCE_OAK',			1),
												('UNIT_MECHANIZED_INFANTRY',	'RESOURCE_TITANIUM',	1);