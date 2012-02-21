DELETE FROM `gossip_menu` WHERE `entry`=60000;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=60000;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(60000,0,0,'Wollt ihr mich etwa st\ören\?',1,1,0,0,0,0,'');

UPDATE `creature_template` SET `gossip_menu_id`=60000,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=9543;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=10043;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (9543,10043);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(9543,0,0,1,62,0,100,0,60000,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ribbly Screwspigot - On Gossip Select - close Gossip'),
(9543,0,1,2,61,0,100,0,60000,0,0,0,45,0,1,0,0,0,0,9,10043,0,15,0,0,0,0,'Ribbly Screwspigot - On Gossip Select - set Data 0 1 to Ribblys Crony'),
(9543,0,2,3,61,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ribbly Screwspigot - On Gossip Select - set Faction 14'),
(9543,0,3,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ribbly Screwspigot - On Gossip Select - start attack'),
(9543,0,4,0,0,0,100,0,2000,4000,5000,7000,11,12540,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ribbly Screwspigot - IC - cast Gouge'),
(9543,0,5,0,0,0,100,0,5000,7000,7000,9000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ribbly Screwspigot - IC - cast Hamstering'),

(10043,0,0,1,38,0,100,0,0,1,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ribblys Crony - On Data 0 1 - set Faction 14'),
(10043,0,1,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,0,0,0,0,0,0,0,'Ribblys Crony - On Data 0 1 - start attack'),
(10043,0,2,0,0,0,100,0,2000,4000,4000,6000,11,15581,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ribblys Crony - IC - cast Sinister Strike'),
(10043,0,3,0,0,0,100,0,5000,7000,20000,25000,11,13298,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ribblys Crony - IC - cast Poison'),
(10043,0,4,0,0,0,100,0,6000,8000,6000,8000,11,15692,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ribblys Crony - IC - cast Eviscerate');
