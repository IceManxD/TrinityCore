UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='',`dmg_multiplier`=70,`ScriptName`='boss_lady_sylvanas_windrunner' WHERE `entry`=10181;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|2,`dmg_multiplier`=70 WHERE `entry`=6412;

DELETE FROM `creature_text` WHERE `entry`=10181;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(10181,1,0,'Let none survive!',14,0,0,5,0,5886,'Sylvanas Windrunner - Aggro'),
(10181,1,1,'May my aim be true.',14,0,0,5,0,5886,'Sylvanas Windrunner - Aggro'),
(10181,2,0,'Ah...ah...',14,0,0,5,0,16320,'Sylvanas Windrunner - Death');
