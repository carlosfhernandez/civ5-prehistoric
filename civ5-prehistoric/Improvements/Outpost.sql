
-- OUTPOST
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName) VALUES	
  ('ART_DEF_IMPROVEMENT_OUTPOST','Improvement','Outpost');

-- OUTPOST: OBSIDIAN
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour) VALUES	
	('Any','Any',0.6,'ART_DEF_IMPROVEMENT_OUTPOST','SNAPSHOT','ART_DEF_RESOURCE_OBISIDIAN','barbarian_village1.fxsxml',1);

-- OUTPOST: FLINT
INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour) VALUES	
	('Any','Any',0.6,'ART_DEF_IMPROVEMENT_OUTPOST','SNAPSHOT','ART_DEF_RESOURCE_FLINT','barbarian_village3.fxsxml',1);
-- TODO: FLINT to have later game improvement for building construction
