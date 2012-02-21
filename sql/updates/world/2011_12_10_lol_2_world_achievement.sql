DELETE FROM `achievement_criteria_data` WHERE `type` IN (5,11) AND `criteria_id` IN (7177,7178,7179);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7177,11,0,0,'achievement_experienced_drake_rider_amber'),
(7178,11,0,0,'achievement_experienced_drake_rider_emerald'),
(7179,11,0,0,'achievement_experienced_drake_rider_ruby');
