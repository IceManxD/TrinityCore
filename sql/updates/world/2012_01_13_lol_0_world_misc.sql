-- Spawn Black Knight
DELETE FROM `vehicle_template_accessory` WHERE `entry`=35491;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(35491,35451,0,0, 'Trial of the Champion - Black Knight on his Gryphon',6,900000);

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x01000000 WHERE `entry`=35491;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35491;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(35491,46598,0,0,0,1,0,0,0);

UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=2, `faction_A`=16, `faction_H`=16, `speed_walk`=0.8, `speed_run`=0.992063, `scale`=1.4, `mindmg`=422, `maxdmg`=586, `attackpower`=642, `baseattacktime`=2000, `dynamicflags`=8, `minrangedmg`=345, `maxrangedmg`=509, `rangedattackpower`=103 WHERE `entry` IN (35545,35564,35590,35717,35568,35546);
UPDATE `creature_template` SET `difficulty_entry_1`=35717, `ScriptName`='npc_risen_ghoul' WHERE `entry`=35590;
UPDATE `creature_template` SET `difficulty_entry_1`=35546 WHERE `entry`=35545;
UPDATE `creature_template` SET `difficulty_entry_1`=35568 WHERE `entry`=35564;
