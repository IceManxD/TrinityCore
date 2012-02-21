DELETE FROM `creature_template_addon` WHERE `entry` IN (28153,30917);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(28153,'44604'),
(30917,'44604');

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=28153;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27640 AND `id`=2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28153;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27640,0,2,0,0,0,100,0,4000,6000,13000,15000,11,50719,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ring-Lord Conjurer - IC - cast Conjure Snowflake'),

(28153,0,0,0,0,0,100,2,0,0,0,0,11,50721,0,0,0,0,0,5,0,0,0,0,0,0,0,'Snowflake - IC - cast Frostbolt'),
(28153,0,1,0,0,0,100,4,0,0,0,0,11,59280,0,0,0,0,0,5,0,0,0,0,0,0,0,'Snowflake - IC - cast Frostbolt H');

UPDATE `smart_scripts` SET `event_param3`=20000,`event_param4`=25000 WHERE `entryorguid`=27639 AND `id` IN (0,1);