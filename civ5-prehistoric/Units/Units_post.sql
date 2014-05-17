-- 
--
-- Combat
--


-- Update combat limit since health (hit points) were doubled. This allows
-- healthy units to attack melee units that have been wounded below 100.
UPDATE Units    SET CombatLimit = CombatLimit * 2;




