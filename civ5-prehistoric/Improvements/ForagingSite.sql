
-- FORAGING SITE
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName) VALUES	
  ('ART_DEF_IMPROVEMENT_FORAGING_SITE','Improvement','Foraging Site');



-- FORAGING SITE BERRIES
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour) VALUES	
	('Any','Any',0.4,'ART_DEF_IMPROVEMENT_FORAGING_SITE','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','foraging_berries.fxsxml',1),
  ('Ancient','UnderConstruction',0.5,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/HB_Plantation_MID_Berries.fxsxml',1),
	('Ancient','Constructed',0.5,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/Plantation_MID_Berries.fxsxml',1),
	('Ancient','Pillaged',0.5,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/PL_Plantation_MID_Berries.fxsxml',1),
	('Industrial','UnderConstruction',1,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/HB_Plantation_IND_Berries.fxsxml',1),
	('Industrial','Constructed',1,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/Plantation_IND_Berries.fxsxml',1),
	('Industrial','Pillaged',1,'ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_BERRIES','Additions/Art/Resources/Berries/PL_Plantation_IND_Berries.fxsxml',1);
  -- Assets/Buildings/Barbarians and Goody Huts/Goody_Huts/Ruins1.fxsxml

-- FORAGING SITE BANANA
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour) VALUES	
  ('Any','Any',0.33,'ART_DEF_IMPROVEMENT_FORAGING_SITE','SNAPSHOT','ART_DEF_RESOURCE_BANANA','Assets/Buildings/Barbarians and Goody Huts/Goody_Huts/Ruins2.fxsxml',1);



