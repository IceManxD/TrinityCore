DELETE FROM `creature` WHERE `id`=28183;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 100227 AND 100234;

UPDATE `creature_template` SET `scale`=1 WHERE `entry`=28183;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='' WHERE `entry`=28239;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_planar_anomaly' WHERE `entry`=30879;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (49346,49460,49464);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (61407,62136,54069,56251,51024);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61407,18,1,28183),
(13,62136,18,1,28183),
(13,54069,18,1,28183),
(13,56251,18,1,28183),
(13,51024,18,1,28239);
