-- Add PrereqTechs for Warrior UnitClasses (other units are in xml):

UPDATE Units
SET PrereqTech='TECH_COOPERATION'
WHERE Class='UNITCLASS_WARRIOR';


