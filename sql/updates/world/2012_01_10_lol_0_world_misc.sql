-- Player Vehicles
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry` IN (35644,36558);
UPDATE `creature_template` SET `unit_flags`=256 WHERE `entry`=36558;
UPDATE `creature_template` SET `spell1`=68505, `spell2`=62575, `spell3`=68282, `spell4`=66482 WHERE `entry`=36558;
UPDATE `creature_template` SET `VehicleId`=486 WHERE `entry`=35644;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry` IN (36558, 35644);
UPDATE `creature_template` SET `baseattacktime`=0 WHERE `entry` IN (36558, 35644);
UPDATE `creature_template_addon` SET `auras`='67865' WHERE `entry` IN (35644,36558);

-- Equipment
UPDATE `creature_template` SET `equipment_id`=2049 WHERE `entry` IN (35314,35326,35327,35325,35323,35331,35330,35329,35328,35332);
UPDATE `creature_template` SET `equipment_id`=2025 WHERE `entry` IN (35571,36090);
UPDATE `creature_template` SET `equipment_id`=2021 WHERE `entry` IN (35569,36085);
UPDATE `creature_template` SET `equipment_id`=2018 WHERE `entry` IN (35572,36089);
UPDATE `creature_template` SET `equipment_id`=2020 WHERE `entry` IN (35617,36084);
UPDATE `creature_template` SET `equipment_id`=2019 WHERE `entry` IN (35570,36091);
UPDATE `creature_template` SET `equipment_id`=2096 WHERE `entry` IN (34701,36803);
UPDATE `creature_template` SET `equipment_id`=2093 WHERE `entry` IN (34703,36087);
UPDATE `creature_template` SET `equipment_id`=2095 WHERE `entry` IN (34657,36086);
UPDATE `creature_template` SET `equipment_id`=2092 WHERE `entry` IN (34705,36088);
UPDATE `creature_template` SET `equipment_id`=834 WHERE `entry` IN (35119,35518);
UPDATE `creature_template` SET `equipment_id`=235 WHERE `entry` IN (34928,35517);
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry` IN (35451,35490);

-- Spawn Black Knight
DELETE FROM `vehicle_template_accessory` WHERE `entry`=35491;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Trial of the Champion - Black Knight on his Gryphon');

-- Mounts
DELETE FROM `creature_template_addon` WHERE `entry` IN (35314,35323,35325,35326,35327,35328,35329,35330,35331,35332);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(35314,0,29260,0,1,0,NULL), -- Orgrimmar Champion
(35323,0,29261,0,1,0,NULL), -- Sen'jin Champion
(35325,0,29259,0,1,0,NULL), -- Thunder Bluff Champion
(35326,0,29262,0,1,0,NULL), -- Silvermoon Champion
(35327,0,29257,0,1,0,NULL), -- Undercity Champion
(35328,0,28912,0,1,0,NULL), -- Stormwind Champion
(35329,0,29258,0,1,0,NULL), -- Ironforge Champion
(35330,0,29255,0,1,0,NULL), -- Exodar Champion
(35331,0,28571,0,1,0,NULL), -- Gnomeregan Champion
(35332,0,29256,0,1,0,NULL); -- Darnassus Champion

DELETE FROM `creature_template_addon` WHERE `entry` IN (34657,34701,34702,34703,34705,35569,35570,35571,35572,35617);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(34657,0,9991,0,1,0,NULL), -- Jaelyne Evensong
(34701,0,29255,0,1,0,NULL), -- Colosos
(34702,0,28571,0,1,0,NULL), -- Ambrose Boltspark
(34703,0,2787,0,1,0,NULL), -- Lana Stouthammer
(34705,0,29284,0,1,0,NULL), -- Marshal Jacob Alerius
(35569,0,28607,0,1,0,NULL), -- Eressea Dawnsinger
(35570,0,29261,0,1,0,NULL), -- Zul'tore
(35571,0,29880,0,1,0,NULL), -- Runok Wildmane
(35572,0,29879,0,1,0,NULL), -- Mokra the Skullcrusher
(35617,0,10718,0,1,0,NULL); -- Deathstalker Visceri

-- Memories
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `rank`=1, `minlevel`=82, `maxlevel`=82, `exp`=2 WHERE `name` LIKE 'Memory of %';
UPDATE `creature_template` SET `ScriptName`='npc_memory' WHERE `name` LIKE 'Memory of %' AND `name` NOT LIKE '%(1)%';

-- Champions
UPDATE `creature_template` SET `type_flags`=`type_flags`|0x800, `ScriptName`='boss_grand_champion_toc5' WHERE `entry` IN (34657,34701,34702,34703,34705,35569,35570,35571,35572,35617);
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `AIName`='', `ScriptName`='npc_faction_champion_toc5' WHERE `entry` IN (35314,35326,35327,35325,35323,35331,35330,35329,35328,35332);

-- Spell Scripts
DELETE FROM `spell_script_names` WHERE `spell_id`=67830;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(67830, 'spell_ride_vehicle_toc5');
