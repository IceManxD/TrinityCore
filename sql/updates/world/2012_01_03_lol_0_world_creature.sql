DELETE FROM `creature` WHERE `id`=25453;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(568209,25453,571,1,1,23941,0,2704.636963,6030.293457,31.513306,4.410034,300,0,0,106000,0,0,0,0,0);
UPDATE `creature_template` SET `faction_A` = 188, `faction_H` = 188, `AIName`='SmartAI' WHERE `entry` = 25453;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25453;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=25453;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25453,0,0,0,6,0,100,0,0,0,0,0,11,45593,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ith''rix the Harvester - On Death - cast Ith''rix''s Carapace'),
(25453,0,1,0,2,0,100,0,0,30,12000,12000,11,34392,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ith''rix the Harvester - Below 30% HP - cast Stinger Rage'),
(25453,0,2,0,0,0,100,0,2000,3000,4000,6000,11,45592,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ith''rix the Harvester - IC - cast Venom Spit'),
(25453,0,3,0,0,0,100,0,4000,6000,6000,8000,11,25748,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ith''rix the Harvester - IC - cast Poison Stinger');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=4 AND `SourceGroup`=23089;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(4,23089,34777,0,6,67,0,0,0,'','Gameobject Loot only for Horde players');
