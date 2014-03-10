INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_ROCK_SLINGER_ATLATLIST', 'Unit', 'RockSlingerAtlatlist_sv.dds');

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_ROCK_SLINGER_ATLATLIST', '1', 'UnFormed');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_ROCK_SLINGER_ATLATLIST', 'ART_DEF_UNIT_MEMBER_ROCK_SLINGER_ATLATLIST', '4');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
  SELECT  ('ART_DEF_UNIT_MEMBER_ROCK_SLINGER_ATLATLIST'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
  FROM ArtDefine_UnitMemberCombats
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CATAPULT');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  SELECT ('ART_DEF_UNIT_MEMBER_ROCK_SLINGER_ATLATLIST'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberCombatWeapons 
  WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CATAPULT');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  SELECT ('ART_DEF_UNIT_MEMBER_ROCK_SLINGER_ATLATLIST'), (0.135), ZOffset, Domain, ('RockSlingerAtlatlist.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberInfos
  WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_INCAN_SLINGER');
