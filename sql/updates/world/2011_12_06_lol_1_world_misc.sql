-- Experienced Drake Rider
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7177,7178,7179);
DELETE FROM `achievement_criteria_data` WHERE `type`=5 AND `criteria_id` IN (7177,7178,7179);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7177,5,49460,0,''),
(7178,5,49346,0,''),
(7179,5,49464,0,'');

-- Voids
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7323,7324,7325);
DELETE FROM `achievement_criteria_data` WHERE `type`=11 AND `criteria_id` IN (7323,7324,7325);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7323,11,0,0,'achievement_ruby_void'),
(7324,11,0,0,'achievement_emerald_void'),
(7325,11,0,0,'achievement_amber_void');
