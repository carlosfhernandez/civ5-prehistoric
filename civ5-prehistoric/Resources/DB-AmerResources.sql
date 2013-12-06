--------------------------------------------------------------------------------------------------
--Table Adds
--------------------------------------------------------------------------------------------------
ALTER TABLE Resources ADD COLUMN Rivers boolean default 0;

--------------------------------------------------------------------------------------------------
--Resources
--------------------------------------------------------------------------------------------------
INSERT INTO Resources (Type,	ResourceClassType,		Rivers,	Hills,	Flatlands,	MaxLatitude,	TechReveal,		TechCityTrade,			IconAtlas,				PortraitIndex,	ArtDefineTag,					IconString,					Description,					Civilopedia,								Help,									AITradeModifier,	ResourceUsage,	AIObjective,	PlacementOrder,	ConstAppearance,	MinAreaSize,	Player,		Normalize)
SELECT 'RESOURCE_FA_RICE',		'RESOURCECLASS_BONUS',	1,		0,		0,			50,				NULL,			'TECH_CALENDAR',		'AMER_RESOURCE_ATLAS',	2,				'ART_DEF_RESOURCE_FA_RICE',		'[ICON_RES_FA_RICE]',		'TXT_KEY_RESOURCE_FA_RICE',		'TXT_KEY_CIV5_RESOURCE_FA_RICE_TEXT',		'TXT_KEY_RESOURCE_FA_RICE_HELP',		0,					0,				0,				3,				50,					3,				0,			1 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',		'RESOURCECLASS_BONUS',	0,		0,		1,			60,				NULL,			'TECH_CALENDAR',		'AMER_RESOURCE_ATLAS',	0,				'ART_DEF_RESOURCE_FA_MAIZE',	'[ICON_RES_FA_MAIZE]',		'TXT_KEY_RESOURCE_FA_MAIZE',	'TXT_KEY_CIV5_RESOURCE_FA_MAIZE_TEXT',		NULL,									0,					0,				0,				3,				50,					3,				0,			1;

INSERT INTO Resources (Type,	ResourceClassType,		Rivers,	Hills,	Flatlands,	MaxLatitude,	Happiness,		TechCityTrade,			IconAtlas,				PortraitIndex,	ArtDefineTag,					IconString,					Description,					Civilopedia,								Help,									AITradeModifier,	ResourceUsage,	AIObjective,	PlacementOrder,	ConstAppearance,	MinAreaSize,	Player,		Normalize)
SELECT 'RESOURCE_FA_TEA',		'RESOURCECLASS_LUXURY',	0,		1,		0,			40,				3,				'TECH_CALENDAR',		'AMER_RESOURCE_ATLAS',	3,				'ART_DEF_RESOURCE_FA_TEA',		'[ICON_RES_FA_TEA]',		'TXT_KEY_RESOURCE_FA_TEA',		'TXT_KEY_CIV5_RESOURCE_FA_TEA_TEXT',		NULL,									10,					2,				0,				3,				50,					3,				67,			0 UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',	'RESOURCECLASS_LUXURY',	0,		0,		0,			40,				5,				'TECH_CALENDAR',		'AMER_RESOURCE_ATLAS',	1,				'ART_DEF_RESOURCE_FA_TOBACCO',	'[ICON_RES_FA_TOBACCO]',	'TXT_KEY_RESOURCE_FA_TOBACCO',	'TXT_KEY_CIV5_RESOURCE_FA_TOBACCO_TEXT',	NULL,									10,					2,				0,				3,				50,					3,				67,			0;

--------------------------------------------------------------------------------------------------
--Resource Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges (ResourceType,	YieldType,			Yield)
SELECT 'RESOURCE_FA_TEA',							'YIELD_GOLD',		2 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',							'YIELD_FOOD',		2 UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',						'YIELD_PRODUCTION',	1 UNION ALL
SELECT 'RESOURCE_FA_RICE',							'YIELD_FOOD',		1;

--------------------------------------------------------------------------------------------------
--Resource Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors (ResourceType,	FlavorType,				Flavor)
SELECT 'RESOURCE_FA_TEA',					'FLAVOR_HAPPINESS',		30 UNION ALL
SELECT 'RESOURCE_FA_TEA',					'FLAVOR_GOLD',			10 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',					'FLAVOR_GROWTH',		20 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',					'FLAVOR_GOLD',			20 UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',				'FLAVOR_HAPPINESS',		60 UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',				'FLAVOR_PRODUCTION',	10 UNION ALL
SELECT 'RESOURCE_FA_RICE',					'FLAVOR_GROWTH',		40 UNION ALL
SELECT 'RESOURCE_FA_RICE',					'FLAVOR_GOLD',			10;

--------------------------------------------------------------------------------------------------
--Resource Terrains
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_TerrainBooleans (ResourceType,	TerrainType)
SELECT 'RESOURCE_FA_TEA',							'TERRAIN_GRASS' UNION ALL
SELECT 'RESOURCE_FA_TEA',							'TERRAIN_PLAINS' UNION ALL
SELECT 'RESOURCE_FA_MAIZE',							'TERRAIN_GRASS' UNION ALL
SELECT 'RESOURCE_FA_RICE',							'TERRAIN_PLAINS' UNION ALL
SELECT 'RESOURCE_FA_RICE',							'TERRAIN_GRASS';

--------------------------------------------------------------------------------------------------
--Resource Features
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureBooleans (ResourceType,	FeatureType)
SELECT 'RESOURCE_FA_TOBACCO',						'FEATURE_FOREST' UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',						'FEATURE_JUNGLE' UNION ALL
SELECT 'RESOURCE_FA_RICE',							'FEATURE_MARSH' UNION ALL
SELECT 'RESOURCE_FA_RICE',							'FEATURE_FLOOD_PLAINS';

--------------------------------------------------------------------------------------------------
--Resource Feature Terrains
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureTerrainBooleans (ResourceType,	TerrainType)
SELECT 'RESOURCE_FA_TOBACCO',								'TERRAIN_GRASS' UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',								'TERRAIN_PLAINS' UNION ALL
SELECT 'RESOURCE_FA_RICE',									'TERRAIN_DESERT';

--------------------------------------------------------------------------------------------------
--Resource Improvements
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes (ResourceType,	ImprovementType)
SELECT 'RESOURCE_FA_TEA',								'IMPROVEMENT_PLANTATION' UNION ALL
SELECT 'RESOURCE_FA_MAIZE',								'IMPROVEMENT_PLANTATION' UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',							'IMPROVEMENT_PLANTATION' UNION ALL
SELECT 'RESOURCE_FA_RICE',								'IMPROVEMENT_PLANTATION';

--------------------------------------------------------------------------------------------------
--Resource Improvement Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceType_Yields (ResourceType,	ImprovementType,			YieldType,			Yield)
SELECT 'RESOURCE_FA_TEA',									'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',		2 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',									'IMPROVEMENT_PLANTATION',	'YIELD_FOOD',		1 UNION ALL
SELECT 'RESOURCE_FA_MAIZE',									'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',		1 UNION ALL
SELECT 'RESOURCE_FA_TOBACCO',								'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',		1 UNION ALL
SELECT 'RESOURCE_FA_RICE',									'IMPROVEMENT_PLANTATION',	'YIELD_FOOD',		3;

--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'AMER_RESOURCE_ATLAS',			256,		4,				4,				'AmerResource256.dds' UNION ALL
SELECT 'AMER_RESOURCE_ATLAS',			80,			4,				4,				'AmerResource80.dds' UNION ALL
SELECT 'AMER_RESOURCE_ATLAS',			64,			4,				4,				'AmerResource64.dds' UNION ALL
SELECT 'AMER_RESOURCE_ATLAS',			45,			4,				4,				'AmerResource45.dds';

--------------------------------------------------------------------------------------------------
--Font Textures
-------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontTextures (IconFontTexture,	IconFontTextureFile) 
SELECT 'ICON_FONT_TEXTURE_FA_TEA',				'tea-fonticons' UNION ALL
SELECT 'ICON_FONT_TEXTURE_FA_MAIZE',			'maize-fonticons' UNION ALL
SELECT 'ICON_FONT_TEXTURE_FA_TOBACCO',			'tobacco-fonticons' UNION ALL
SELECT 'ICON_FONT_TEXTURE_FA_RICE',				'rice-fonticons';

--------------------------------------------------------------------------------------------------
--Font Mapping
-------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontMapping (IconName,	IconFontTexture,					IconMapping) 
SELECT 'ICON_RES_FA_TEA',				'ICON_FONT_TEXTURE_FA_TEA',			1 UNION ALL
SELECT 'ICON_RES_FA_MAIZE',				'ICON_FONT_TEXTURE_FA_MAIZE',		1 UNION ALL
SELECT 'ICON_RES_FA_TOBACCO',			'ICON_FONT_TEXTURE_FA_TOBACCO',		1 UNION ALL
SELECT 'ICON_RES_FA_RICE',				'ICON_FONT_TEXTURE_FA_RICE',		1;

--------------------------------------------------------------------------------------------------
--SV Icons
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,		Asset)
SELECT 'ART_DEF_RESOURCE_FA_TEA',						'Resource',		'SV_Tea.dds' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',						'Resource',		'SV_Maize.dds' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',					'Resource',		'SV_Tobacco.dds' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',						'Resource',		'SV_Rice.dds';

--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName)
SELECT 'ART_DEF_RESOURCE_FA_TEA',			'Resource',		'Tea' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',			'Resource',		'Maize' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',		'Resource',		'Tobacco' UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',			'Resource',		'Rice';

INSERT INTO ArtDefine_Landmarks (ResourceType,	ImprovementType,					Model,								Era,			State,					Scale,				LayoutHandler,	TerrainContour)
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_NONE',			'resource_tea.fxsxml',				'Any',			'Any',					0.9399999976158142,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'hb_plantation_mid_tea.fxsxml',		'Ancient',		'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_mid_tea .fxsxml',		'Ancient',		'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'pl_plantation_mid_tea.fxsxml',		'Ancient',		'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'hb_plantation_mid_tea.fxsxml',		'Industrial',	'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_mid_tea .fxsxml',		'Industrial',	'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TEA',				'ART_DEF_IMPROVEMENT_PLANTATION',	'pl_plantation_mid_tea.fxsxml',		'Industrial',	'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_NONE',			'resource_maize.fxsxml',			'Any',			'Any',					0.9399999976158142,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'HB_Plantation_IND_Banana.fxsxml',	'Ancient',		'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_ind_maize.fxsxml',		'Ancient',		'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'PL_Plantation_IND_Banana.fxsxml',	'Ancient',		'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'HB_Plantation_IND_Banana.fxsxml',	'Industrial',	'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_ind_maize.fxsxml',		'Industrial',	'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_MAIZE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'PL_Plantation_IND_Banana.fxsxml',	'Industrial',	'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_NONE',			'Resource_Spice.fxsxml',			'Any',			'Any',					0.9399999976158142,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'HB_Plantation_MID_Spice.fxsxml',	'Ancient',		'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'Plantation_MID_Spice.fxsxml',		'Ancient',		'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'PL_Plantation_MID_Spice.fxsxml',	'Ancient',		'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'HB_Plantation_IND_Spice.fxsxml',	'Industrial',	'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'Plantation_IND_Spice.fxsxml',		'Industrial',	'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_TOBACCO',			'ART_DEF_IMPROVEMENT_PLANTATION',	'PL_Plantation_IND_Spice.fxsxml',	'Industrial',	'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_NONE',			'resource_rice.fxsxml',				'Any',			'Any',					0.9399999976158142,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'hb_plantation_ind_rice.fxsxml',	'Ancient',		'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_ind_rice.fxsxml',		'Ancient',		'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'pl_plantation_ind_rice.fxsxml',	'Ancient',		'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'hb_plantation_ind_rice.fxsxml',	'Industrial',	'UnderConstruction',	0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'plantation_ind_rice.fxsxml',		'Industrial',	'Constructed',			0.9599999785423279,	'SNAPSHOT',		1 UNION ALL
SELECT 'ART_DEF_RESOURCE_FA_RICE',				'ART_DEF_IMPROVEMENT_PLANTATION',	'pl_plantation_ind_rice.fxsxml',	'Industrial',	'Pillaged',				0.9599999785423279,	'SNAPSHOT',		1;