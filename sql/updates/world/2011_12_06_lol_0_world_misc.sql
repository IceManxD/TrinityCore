DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (50232,50328,50341,49840,49592);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
-- Searing Wrath
(17,50232,1,19,27638),
(17,50232,2,19,27656),
(17,50232,3,19,28276),
-- Leeching Poison
(17,50328,1,19,27638),
(17,50328,2,19,27656),
(17,50328,3,19,28276),
-- Touch the Nightmare
(17,50341,1,19,27638),
(17,50341,2,19,27656),
(17,50341,3,19,28276),
-- Shock Lance
(17,49840,1,19,27638),
(17,49840,2,19,27656),
(17,49840,3,19,28276),
-- Temporal Rift
(17,49592,1,19,27638),
(17,49592,2,19,27656),
(17,49592,3,19,28276);

UPDATE `spell_script_names` SET `ScriptName`='spell_amber_drake_stop_time' WHERE `ScriptName`='spell_amber_drake_time_stop';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_emerald_drake_touch_the_nightmare';

UPDATE `creature_template_addon` SET `auras`='50325' WHERE `entry` IN (27692,27755);
UPDATE `creature_template_addon` SET `auras`='50248 50325' WHERE `entry`=27756;
UPDATE `creature_template` SET `spell2`=50240, `spell3`=50253, `spell4`=0 WHERE `entry`=27756;
