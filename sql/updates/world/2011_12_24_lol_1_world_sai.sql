-- Tyrande Whisperwind
DELETE FROM `creature_text` WHERE `entry`=7999;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(7999,1,0,'Anu''dora!',14,0,0,5,0,5885,'Tyrande Whisperwind - Aggro'),
(7999,1,1,'For Kalimdor!',14,0,0,5,0,5885,'Tyrande Whisperwind - Aggro'),
(7999,1,2,'Endu''di Rifa!',14,0,0,5,0,5885,'Tyrande Whisperwind - Aggro');

UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=7999;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=7999;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(7999,0,0,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tyrande Whisperwind - On Aggro - Say Text'),
(7999,0,1,0,0,0,100,0,5000,7000,8000,10000,11,20691,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tyrande Whisperwind - IC - cast Cleave'),
(7999,0,2,0,0,0,100,0,6000,8000,7000,9000,11,20690,0,0,0,0,0,5,0,0,0,0,0,0,0,'Tyrande Whisperwind - IC - cast Moonfire'),
(7999,0,3,0,0,0,100,0,4000,6000,6000,8000,11,20688,0,0,0,0,0,5,0,0,0,0,0,0,0,'Tyrande Whisperwind - IC - cast Searing Arrow'),
(7999,0,4,0,0,0,100,0,15000,20000,30000,35000,11,20687,0,0,0,0,0,5,0,0,0,0,0,0,0,'Tyrande Whisperwind - IC - cast Starfall');

-- Varian Wrynn
DELETE FROM `creature_template_addon` WHERE `entry`=29611;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(29611,'30798'); -- Dual Wield

UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=29611;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=29611;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29611,0,0,0,0,0,100,0,4000,6000,6000,8000,11,59688,0,0,0,0,0,17,8,25,0,0,0,0,0,'King Varian Wrynn - IC - cast Heroic Leap'),
(29611,0,1,0,0,0,100,0,5000,7000,10000,12000,11,41056,0,0,0,0,0,2,0,0,0,0,0,0,0,'King Varian Wrynn - IC - cast Whirlwind');

-- High Tinker Mekkatorque
DELETE FROM `creature_text` WHERE `entry`=7937;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(7937,1,0,'I won''t stand for that!',14,0,100,5,0,5897,'High Tinker Mekkatorque - Aggro');

UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=7937;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=7937;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(7937,0,0,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'High Tinker Mekkatorque - On Aggro - Say Text'),
(7937,0,1,0,0,0,100,0,6000,8000,6000,8000,11,9143,0,0,0,0,0,17,5,30,0,0,0,0,0,'High Tinker Mekkatorque - IC - cast Bomb'),
(7937,0,2,0,0,0,100,0,4000,6000,8000,10000,11,22739,0,0,0,0,0,2,0,0,0,0,0,0,0,'High Tinker Mekkatorque - IC - cast Goblin Dragon Gun'),
(7937,0,3,0,0,0,100,0,10000,10000,40000,40000,11,22742,0,0,0,0,0,24,0,0,0,0,0,0,0,'High Tinker Mekkatorque - IC - cast Super Shrink Ray');
