UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='',`ScriptName`='boss_cairne_bloodhoof' WHERE `entry`=3057;

DELETE FROM `creature_text` WHERE `entry`=3057;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(3057,1,0,'For honor! ',14,0,0,5,0,5884,'Cairne Bloodhoof - Aggro 1'),
(3057,1,1,'Ish-ne-alo por-ah!',14,0,0,5,0,5884,'Cairne Bloodhoof - Aggro 2');
