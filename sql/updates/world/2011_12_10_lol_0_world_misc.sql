DELETE FROM `creature_addon` WHERE `guid` IN (101924,101933,101922,101974,102064,101967);
INSERT INTO `creature_addon` (`guid`,`auras`) VALUES
(101924,'50088'),
(101933,'50088'),
(101922,'50088'),
(101974,'50088'),
(102064,'50088'),
(101967,'50088');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=50087;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,50087,0,18,1,27641,0,0,'','Energy Link target only Centrifuge Construct');

-- SAI part moved to 2011_12_16_lol_0_world_sai.sql

UPDATE `creature_template` SET `skinloot`=70210 WHERE `entry` IN (27636,27633,27635,27638,28276, 30902,30901,30904,30903,30991);  
UPDATE `creature_template` SET `skinloot`=29730,`type_flags`=`type_flags`|32768 WHERE `entry` IN (27641, 30905);        
UPDATE `creature_template` SET `skinloot`=70211 WHERE `entry` IN (27642,27644,27645, 30909,30914,30907);
