DELETE FROM `spell_dbc` WHERE `Id` IN (68572,68573,68574,68575);
INSERT INTO `spell_dbc` (`Id`, `Attributes`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx6`, `CastingTimeIndex`, `ProcChance`, `RangeIndex`, `EquippedItemClass`, `Effect1`, `EffectImplicitTargetA1`, `EffectImplicitTargetB1`, `EffectRadiusIndex1`, `Comment`) VALUES
(68572,545259776,5,268697600,128,16777216,1,101,1,-1,3,22,7,28,'Grand Champions credit marker'),
(68573,545259776,5,268697600,128,16777216,1,101,1,-1,3,22,7,28,'Argent Champion credit marker'),
(68574,545259776,5,268697600,128,16777216,1,101,1,-1,3,22,7,28,'Paletress credit marker'),
(68575,545259776,5,268697600,128,16777216,1,101,1,-1,3,22,7,28,'Eadric credit marker');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (68206,68572,68573,68574,68575,68663);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,68206,18,1,0),
(13,68572,18,1,0),
(13,68573,18,1,0),
(13,68574,18,1,0),
(13,68575,18,1,0),
(13,68663,18,1,0);

UPDATE `instance_encounters` SET `creditEntry`=68573 WHERE `creditEntry`=68574;

DELETE FROM `achievement_criteria_data` WHERE `type`=18 AND (`criteria_id` BETWEEN 12298 AND 12306 OR `criteria_id`=11420);
DELETE FROM `achievement_criteria_data` WHERE `type`=18 AND (`criteria_id` BETWEEN 12310 AND 12324 OR `criteria_id`=12439);
DELETE FROM `achievement_criteria_data` WHERE `type`=18 AND (`criteria_id` BETWEEN 11904 AND 11927 OR `criteria_id`=11863);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
-- Champions (Normal)
(11420, 18, 0, 0, ''),
(12298, 18, 0, 0, ''),
(12299, 18, 0, 0, ''),
(12300, 18, 0, 0, ''),
(12301, 18, 0, 0, ''),
(12302, 18, 0, 0, ''),
(12303, 18, 0, 0, ''),
(12304, 18, 0, 0, ''),
(12305, 18, 0, 0, ''),
(12306, 18, 0, 0, ''),
-- Champions (Hero)
(12310, 18, 0, 0, ''),
(12311, 18, 0, 0, ''),
(12312, 18, 0, 0, ''),
(12313, 18, 0, 0, ''),
(12314, 18, 0, 0, ''),
(12318, 18, 0, 0, ''),
(12319, 18, 0, 0, ''),
(12320, 18, 0, 0, ''),
(12321, 18, 0, 0, ''),
(12322, 18, 0, 0, ''),
-- Memories
(11863, 18, 0, 0, ''),
(11904, 18, 0, 0, ''),
(11905, 18, 0, 0, ''),
(11906, 18, 0, 0, ''),
(11907, 18, 0, 0, ''),
(11908, 18, 0, 0, ''),
(11909, 18, 0, 0, ''),
(11910, 18, 0, 0, ''),
(11911, 18, 0, 0, ''),
(11912, 18, 0, 0, ''),
(11913, 18, 0, 0, ''),
(11914, 18, 0, 0, ''),
(11915, 18, 0, 0, ''),
(11916, 18, 0, 0, ''),
(11917, 18, 0, 0, ''),
(11918, 18, 0, 0, ''),
(11919, 18, 0, 0, ''),
(11920, 18, 0, 0, ''),
(11921, 18, 0, 0, ''),
(11922, 18, 0, 0, ''),
(11923, 18, 0, 0, ''),
(11924, 18, 0, 0, ''),
(11925, 18, 0, 0, ''),
(11926, 18, 0, 0, ''),
(11927, 18, 0, 0, '');
