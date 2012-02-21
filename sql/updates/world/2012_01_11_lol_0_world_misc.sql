-- Doors
DELETE FROM `gameobject` WHERE `guid` IN (150080,150081);
UPDATE `gameobject` SET `state`=1 WHERE `guid` IN (150073,150074);

-- Eadric Hammer Spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (66867,66905);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(66867, 'spell_eadric_hammer_missile'),
(66905, 'spell_eadric_hammer_throw_back');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (66905,68197);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,66905,18,1,35119),
(13,68197,18,1,0);
