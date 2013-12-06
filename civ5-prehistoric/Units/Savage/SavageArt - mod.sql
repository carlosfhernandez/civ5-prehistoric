INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES ('ART_DEF_UNIT_SAVAGE', 'Unit', 'sv_savage.dds');

INSERT INTO ArtDefine_UnitInfos ('Type','DamageStates','Formation')
	SELECT ("ART_DEF_UNIT_SAVAGE"), "DamageStates", "Formation"
	FROM ArtDefine_UnitInfos
  WHERE (Type = "ART_DEF_UNIT__WARRIOR");

INSERT INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	VALUES ("ART_DEF_UNIT_SAVAGE", "ART_DEF_UNIT_MEMBER_SAVAGE", "6");

INSERT INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 
    'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 
    'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 
    'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 
    'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 
    'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 
    'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 
    'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_SAVAGE"), "EnableActions", "DisableActions", "MoveRadius", 
    "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", "MoveRate", 
    "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", 
    "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", 
    "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", 
    "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", 
    "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", 
    "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" 
  WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_WARRIOR");

INSERT INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 
    'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 
    'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 
    'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 
    'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_SAVAGE"), "Index", "SubIndex", "ID", "VisKillStrengthMin", 
    "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", 
    "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", 
    "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", 
    "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" 
  WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_WARRIOR");

INSERT INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", 
    "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_SAVAGE"), (0.17), "ZOffset", "Domain", ("civ5_celwa1.fxsxml"), 
    "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" 
  WHERE (Type = "ART_DEF_UNIT_MEMBER_WARRIOR");
