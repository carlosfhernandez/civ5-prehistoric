
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
  VALUES 
  ('ART_DEF_UNIT_WARRIOR_TEST001', 'Unit', 'SV_Warrior.dds'),
  ('ART_DEF_UNIT_WARRIOR_TEST002', 'Unit', 'SV_Warrior.dds'),
  ('ART_DEF_UNIT_WARRIOR_TEST003', 'Unit', 'SV_Warrior.dds');

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
  VALUES 
  ('ART_DEF_UNIT_WARRIOR_TEST001', '1', 'UnFormed'),
  ('ART_DEF_UNIT_WARRIOR_TEST002', '1', 'UnFormed'),
  ('ART_DEF_UNIT_WARRIOR_TEST003', '1', 'UnFormed');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES 
  ('ART_DEF_UNIT_WARRIOR_TEST001', 'ART_DEF_UNIT_MEMBER_WARRIOR_TEST001', '8'),
  ('ART_DEF_UNIT_WARRIOR_TEST002', 'ART_DEF_UNIT_MEMBER_WARRIOR_TEST002', '8'),
  ('ART_DEF_UNIT_WARRIOR_TEST003', 'ART_DEF_UNIT_MEMBER_WARRIOR_TEST003', '8');



INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST001'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
  FROM ArtDefine_UnitMemberCombats 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST001'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberCombatWeapons 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  SELECT  ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST001'), (0.11), ZOffset, Domain, ('WarriorTest001.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberInfos 
  WHERE (Type = 'ART_DEF_UNIT_MEMBER_WARRIOR');




INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST002'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
  FROM ArtDefine_UnitMemberCombats 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST002'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberCombatWeapons 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  SELECT  ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST002'), (0.11), ZOffset, Domain, ('WarriorTest002.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberInfos 
  WHERE (Type = 'ART_DEF_UNIT_MEMBER_WARRIOR');




INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST003'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
  FROM ArtDefine_UnitMemberCombats 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CATAPULT');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  SELECT ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST003'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberCombatWeapons 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CATAPULT');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  SELECT  ('ART_DEF_UNIT_MEMBER_WARRIOR_TEST003'), (0.11), ZOffset, Domain, ('WarriorTest003.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberInfos 
  WHERE (Type = 'ART_DEF_UNIT_MEMBER_WARRIOR');

