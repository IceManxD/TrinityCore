UPDATE `gameobject_template` SET `data2`=10, `data5`=8 WHERE `entry`=193963;
UPDATE `creature_template` SET `ScriptName`='npc_train_wrecker' WHERE `entry`=33404;

DELETE FROM `spell_script_names` WHERE `spell_id`=61551;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61551, 'spell_gen_toy_train_set');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62943;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue2`,`Comment`) VALUES
(13,62943,18,193963, 'Wind-Up Train Wrecker - target Toy Train Set');
