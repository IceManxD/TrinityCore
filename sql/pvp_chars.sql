-- Trainingspuppe für Allies: 32667
-- Runenschmiede 201742

--
-- Einführung von PvP.Charakteren
-- Introduction of PvP.Characters
--
--> Trinity WotlK <--
--
-- !This file is UTF-8 encoded! --
--
-- > Diverse Anpassungen am Server Code
-- > Anpasssungen an der Datenbank
--
-- --
-- Variablen
-- --
-- Quest, durch den ein Character zu einem PvP.Char wird
-- 100100
SET @QUEST_TEMPLATE = 30000;
-- Ab hier die neuen creature_template Einträge (Händler, etc)
-- 150.000 -> BG Arena Server
SET @CREA_TEMPLATE = 150200;
-- Ab hier die Spawns
-- 150.000 -> BG Arena Server
SET @CREATURE = 150200;
-- Standard Modell für alle Händler - uebernommen von Arena Tournament -- ist der Gnome Arena Meister
SET @MODEL_VENDOR = 23766;
-- http://de.wowhead.com/npc=4429
SET @HAENDLER_KOSTENLOS_MODEL = 7192;
-- Name/Untergruppe für die speziellen LoL-NPCs
-- Hat ein NPC diese Untergruppe (SubName), dann erhalten die PvP Chars
-- alle Gegenstände kostenlos.
-- Andere Chars dürfen nicht mit diesen Händlern handeln.
SET @LOL_TEAM = 'LoL BG Team';
-- Model von Mei Francis
SET @MODEL_MEI_FRANCIS = 27822;
-- Model Runenkriegsgolem // http://loldb.landoflegends.de/?npc=26347
SET @MODEL_RUNE_GOLEM = 23823;
-- Model Obsidian Golem // // http://loldb.landoflegends.de/?npc=4872
SET @MODEL_OBSIDIAN_GOLEM = 2695;
-- Model War Golem // // http://loldb.landoflegends.de/?npc=2751
SET @MODEL_WAR_GOLEM = 5747;
-- Pilot Vic
SET @MODEL_RIDING_TRAINER = 25671;
SET @MODEL_ALANURA_FEUERWOLKE = 26892;

SET @UNIT_FLAG_DISABLE_MOVE = 4;

/*
-- Selbst gemachte Gegenstände
SET @ITEM_TEMPLATE = 220000;
-- Model von Dori Volanthius; S5 Verkäufer
SET @MODEL_HAENDLER_SEASON5 = 22602;
-- Model Arena Kampfmeister (Goblin)
SET @MODEL_BATTLEMASTER = 23766;
*/
--
--
-- NPC Flags
SET @NPCFLAG_REPAIRER = 4096;
SET @NPCFLAG_VENDOR_REAGENT = 2048;
SET @NPCFLAG_VENDOR_POISON = 1024;
SET @NPCFLAG_VENDOR = 128;
SET @NPCFLAG_PROFESSIONTRAINER=64;
SET @NPCFLAG_CLASS_TRAINER = 32;
SET @NPCFLAG_TRAINER = 16;
SET @NPCFLAG_GOSSIP = 1;
SET @NPCFLAG_QUEST_GIVER =2;

-- Neue Creature_Template Einträge
-- Notwendig, damit die PvE Welt komplett unangetastet bleibt
SET @CT_SAVAGE_GLADIATOR = @CREA_TEMPLATE+11;
SET @CT_HUNTER_FOOD_VENDOR = @CREA_TEMPLATE+17;
SET @CT_VENDOR_MISC = @CREA_TEMPLATE+18;
SET @PVPCHAR_QUESTGIVER = @CREA_TEMPLATE+19;
SET @CT_HUNTER_PET_TRAINER = @CREA_TEMPLATE+20;
SET @CT_HUNTER_STABLE_MASTER = @CREA_TEMPLATE+21;
-- Hunter Pets: bis @CREA_TEMPLATE+69
SET @CT_HUNTER_PET = @CREA_TEMPLATE + 22;
SET @CT_RIDING_TRAINER = @CREA_TEMPLATE+70;
SET @CT_MOUNT_VENDOR = @CREA_TEMPLATE+71;
SET @CT_TELEPORTER_MAGE = @CREA_TEMPLATE+72;
SET @CT_ENCHANTMENT_SCROLLS = @CREA_TEMPLATE+73;
SET @CT_ENCHANTMENT_HEADSHOULDER = @CREA_TEMPLATE+74;
SET @CT_VENDOR_GEMS = @CREA_TEMPLATE+75;
SET @CT_VENDOR_METAGEMS = @CREA_TEMPLATE+76;
SET @CT_VENDOR_CONSUMABLES = @CREA_TEMPLATE+77;
SET @CT_VENDOR_PVP_STARTINGGEAR = @CREA_TEMPLATE+78;
SET @CT_VENDOR_GEMS_FREE = @CREA_TEMPLATE+79;
SET @CT_VENDOR_METAGEMS_FREE = @CREA_TEMPLATE+80;
SET @CT_VENDOR_NECK_FINGER_FREE = @CREA_TEMPLATE+81;
SET @CT_NPC_WEAPON_SKILL = @CREA_TEMPLATE+82;

SET @CT_CLASS_TRAINER = @CREA_TEMPLATE+100;
SET @CT_WEAPON_MASTER = @CREA_TEMPLATE+111;

-- Spawnen der Creature
SET @CREA_SAVAGE_GLADIATOR_01 = @CREATURE;
SET @CREA_SAVAGE_GLADIATOR_02 = @CREATURE+1;
SET @CREA_PVPCHAR_QUESTGIVER_01 = @CREATURE+2;
SET @CREA_PVPCHAR_QUESTGIVER_02 = @CREATURE+3;
SET @CREA_PVPCHAR_QUESTGIVER_03 = @CREATURE+4;
SET @CREA_PVPCHAR_QUESTGIVER_04 = @CREATURE+5;
SET @CREA_PVPCHAR_QUESTGIVER_05 = @CREATURE+6;
SET @CREA_PVPCHAR_QUESTGIVER_06 = @CREATURE+7;
SET @CREA_PVPCHAR_QUESTGIVER_07 = @CREATURE+8;
SET @CREA_PVPCHAR_QUESTGIVER_08 = @CREATURE+9;
SET @CREA_PVPCHAR_QUESTGIVER_09 = @CREATURE+10;
SET @CREA_STOCKADE = @CREATURE+10;
SET @CREA_RAGEFIRE = @CREATURE+50;
SET @CREA_HUNTER_PET = @CREATURE + 100;


-- Spawn: @CREATURE
-- @CREATURE   -> Savaga Gladiator in SW
-- @CREATURE+1 -> Savaga Gladiator in Org

SET @PAGE_TEXT_PVPLETTER = 3700;
SET @IT_PVPLETTER = 140100;
-- Letter for the PvP Chars
DELETE FROM `item_template` WHERE `entry` = @IT_PVPLETTER;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `unk0`, `name`, `displayid`,
`Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`,
`bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `WDBVerified`)
VALUES(@IT_PVPLETTER,'9','0','-1','PvP Letter','5567',
'1','0','0','1','0','0','0','-1','-1','1','0','0','0','0','0','0','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','-1','0','-1','0','0','0','0','-1','0','-1','0','0','0','0','-1','0','-1','0','0','0','0','-1','0','-1','0','0','0','0','-1','0','-1',
'0','An recruitment letter for PvP.Chars.',@PAGE_TEXT_PVPLETTER,'1','0','0','0','-1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','-1','0','0','0','0','','0','0','0','0','12340');
DELETE FROM `locales_item` WHERE `entry` = @IT_PVPLETTER;
INSERT INTO `locales_item` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`,
`description_loc1`, `description_loc2`, `description_loc3`, `description_loc4`, `description_loc5`, `description_loc6`, `description_loc7`, `description_loc8`)
VALUES(@IT_PVPLETTER,'','','PvP Brief','','','','','',
NULL,NULL,'Ein Anwerbungsbrief für die PvP.Chars.',NULL,NULL,NULL,NULL,NULL);
DELETE FROM `page_text` WHERE `entry` = @PAGE_TEXT_PVPLETTER;
INSERT INTO `page_text` (`entry`, `text`, `next_page`, `WDBVerified`)
VALUES(@PAGE_TEXT_PVPLETTER,
'\nThanks for your decision and welcome to the PvP.Chars\n\nYou show great braveness and we are pride you joined the PvP fighters.\n\nHorde: Move to Ragefire Chasm in Orgrimmar.\nAlliance: Visit the Stockades in Stormwind.\n\nThere you will find weapons and armor.\n\Yours sincerely,\n\n- The LoL-Team\n\n',
'0','12340');
DELETE FROM `locales_page_text` WHERE `entry` = @PAGE_TEXT_PVPLETTER;
INSERT INTO `locales_page_text` (`entry`, `Text_loc1`, `Text_loc2`, `Text_loc3`, `Text_loc4`, `Text_loc5`, `Text_loc6`, `Text_loc7`, `Text_loc8`)
VALUES(@PAGE_TEXT_PVPLETTER,NULL,NULL,
'\nVielen Dank für Eure Entscheidung und herzlich Willkommen bei den PvP.Chars\n\nIhr beweist großen Mut und wir sind stolz einen neuen Kämpfer begrüßen zu dürfen.\n\nHorde: Begebt Euch in den Flammenschlund in Orgrimmar.\nAllianz: Begebt Euch in das Verlies in Sturmwind. \n\nDort erhaltet Ihr Waffen und Ausrüstung.\n\nHochachtungsvoll,\n\n- Das LoL-Team\n\n',
NULL,NULL,NULL,NULL,NULL);

-- Mit diesem Quest wird ein Character zu einem PvP.Char
-- If a character does this quest it will become a PvP.Char
DELETE FROM `quest_template` WHERE `id` = @QUEST_TEMPLATE;
INSERT INTO `quest_template` ( `id`,
 `Title`, `OfferRewardText`,
 `MinLevel`, `ZoneOrSort`, `RequiredItemId1`,
 `Type`, `Method`, 
 `Details`,
 `EndText`, `Objectives`,
 `RequiredRaces`, `PrevQuestId`,
 `Flags`,
 `RewardSpell`, `RewardMoneyMaxLevel`,
 `Level`,
 `SpecialFlags`,
 `RewardXPId`, `MaxLevel`,
 `RequiredSkillId`,
 `EmoteOnComplete`,
 `RewardItemCount1`, `RewardItemId1`,
 `RewardItemCount2`, `RewardItemId2`,
 `RewardItemCount3`, `RewardItemId3`
 )
 VALUES
 ( @QUEST_TEMPLATE,
 'Ich will ein PvP.Char sein', '',
'1', '0', '0',
'0', '2', 
'Seid gegrüßt,$b$b\nwir suchen dringend Mitstreiter, die unseren Gegnern mal zeigen, was eine Harke ist.$b$bHier könnt Ihr sofort auf die Maximalstufe aufsteigen, aber Ihr dürft nur PvP spielen - sonst nichts.$b$bFalls Ihr dies wollt, so erledigt diese Quest und ich heiße Euch willkommen in der Welt des PvP - aber Vorsicht - NUR PvP.',
'Seid Ihr sicher, dass Ihr NUR PvP spielen wollt?\n\nIhr könnt niemals eine Instanz betreten oder einem Raid beiwohnen!',
'Nur wenn Ihr ganz sicher seid solltet Ihr es tun. Danach könnt Ihr niemals mehr PvE spielen - nur noch PvP in Arena oder BG.',
'0', '0',
'0',
'0', '4650',
'1',
'0',
'0', '1', 
'0',
'1',
1, @IT_PVPLETTER, -- Welcome letter
0, 0, -- 1, 44225, -- 1x Zügel des gepanzerten Braunbären
0, 0  -- 1, 44226   -- 1x Zügel des gepanzerten Braunbären
);
-- Quest for Death-Knights
DELETE FROM `quest_template` WHERE `id` = @QUEST_TEMPLATE+1;
INSERT INTO `quest_template` ( `id`,
 `Title`, `OfferRewardText`,
 `MinLevel`, `ZoneOrSort`, `RequiredItemId1`,
 `Type`, `Method`, 
 `Details`,
 `EndText`, `Objectives`,
 `RequiredRaces`, `PrevQuestId`,
 `Flags`,
 `RewardSpell`, `RewardMoneyMaxLevel`,
 `Level`,
 `SpecialFlags`,
 `RewardXPId`, `MaxLevel`,
 `RequiredSkillId`,
 `EmoteOnComplete`,
 `RewardItemCount1`, `RewardItemId1`,
 `RewardItemCount2`, `RewardItemId2`,
 `RewardItemCount3`, `RewardItemId3`
 )
 VALUES
 ( @QUEST_TEMPLATE+1,
 'Ich will ein PvP.Char sein', '',
'55', '-372', '0',
'0', '2', 
'Seid gegrüßt,$b$b\nwir suchen dringend Mitstreiter, die unseren Gegnern mal zeigen, was eine Harke ist.$b$bHier könnt Ihr sofort auf die Maximalstufe aufsteigen, aber Ihr dürft nur PvP spielen - sonst nichts.$b$bFalls Ihr dies wollt, so erledigt diese Quest und ich heiße Euch willkommen in der Welt des PvP - aber Vorsicht - NUR PvP.',
'Seid Ihr sicher, dass Ihr NUR PvP spielen wollt?\n\nIhr könnt niemals eine Instanz betreten oder einem Raid beiwohnen!',
'Nur wenn Ihr ganz sicher seid solltet Ihr es tun. Danach könnt Ihr niemals mehr PvE spielen - nur noch PvP in Arena oder BG.',
'0', '0',
'0',
'0', '4650',
'55',
'0',
'0', '55', 
'0',
'1',
1, @IT_PVPLETTER, -- Welcome letter
0, 0, -- 1, 44225, -- 1x Zügel des gepanzerten Braunbären
0, 0  -- 1, 44226   -- 1x Zügel des gepanzerten Braunbären
);

-- Creature, that gives the quest
DELETE FROM `creature_template` WHERE `entry` = @PVPCHAR_QUESTGIVER;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`,
`speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES(@PVPCHAR_QUESTGIVER,@MODEL_RUNE_GOLEM,'0','0','0',
'PvP.Char Questgiver',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_QUEST_GIVER,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','768','8','0','0','0','0','0','315','468','69',
'7','0',
'',
'0','0','0','npc_pvpchars_questgiver');
DELETE FROM `locales_creature` WHERE `entry` = @PVPCHAR_QUESTGIVER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@PVPCHAR_QUESTGIVER,'','','PvP.Char Questgeber','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `creature_questrelation` WHERE `quest` IN( @QUEST_TEMPLATE, @QUEST_TEMPLATE+1);
DELETE FROM `creature_involvedrelation` WHERE `quest` IN ( @QUEST_TEMPLATE, @QUEST_TEMPLATE+1);
INSERT INTO `creature_questrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE, @PVPCHAR_QUESTGIVER );
INSERT INTO `creature_involvedrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE, @PVPCHAR_QUESTGIVER );
INSERT INTO `creature_questrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE+1, @PVPCHAR_QUESTGIVER );
INSERT INTO `creature_involvedrelation` ( `quest`, `id` )  VALUES ( @QUEST_TEMPLATE+1, @PVPCHAR_QUESTGIVER );

DELETE FROM `creature` WHERE `guid` IN (
@CREA_PVPCHAR_QUESTGIVER_01, @CREA_PVPCHAR_QUESTGIVER_02, @CREA_PVPCHAR_QUESTGIVER_03,
@CREA_PVPCHAR_QUESTGIVER_04, @CREA_PVPCHAR_QUESTGIVER_05, @CREA_PVPCHAR_QUESTGIVER_06,
@CREA_PVPCHAR_QUESTGIVER_07, @CREA_PVPCHAR_QUESTGIVER_08, @CREA_PVPCHAR_QUESTGIVER_09);
DELETE FROM `creature` WHERE `id` IN (@PVPCHAR_QUESTGIVER);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`,
 `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`,
 `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(@CREA_PVPCHAR_QUESTGIVER_01,@PVPCHAR_QUESTGIVER,'530','1','1','0','0','10322.8','-6363.68','31.0299','0.132424','300','0','0','10080','8814','0','0','0','0'), -- Bloodelf
(@CREA_PVPCHAR_QUESTGIVER_02,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','-573.666','-4253.07','38.1184','3.15805','300','0','0','10080','8814','0','0','0','0'), -- Orc and Troll
(@CREA_PVPCHAR_QUESTGIVER_03,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','-2871.62','-252.444','53.9152','3.37486','300','0','0','10080','8814','0','0','0','0'), -- Tauren
(@CREA_PVPCHAR_QUESTGIVER_04,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','1696.67','1672.82','133.862','4.26567','300','0','0','10080','8814','0','0','0','0'), -- Undead
(@CREA_PVPCHAR_QUESTGIVER_05,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','-6231.92','349.142','384.032','4.8195','300','0','0','10080','8814','0','0','0','0'), -- Dwarf and Gnome
(@CREA_PVPCHAR_QUESTGIVER_06,@PVPCHAR_QUESTGIVER,'0','1','1','0','0','-8896.11','-136.168','80.694','1.20672','300','0','0','10080','8814','0','0','0','0'), -- Human
(@CREA_PVPCHAR_QUESTGIVER_07,@PVPCHAR_QUESTGIVER,'1','1','1','0','0','10334.3','821.644','1326.44','2.20771','300','0','0','10080','8814','0','0','0','0'), -- Night Elf
(@CREA_PVPCHAR_QUESTGIVER_08,@PVPCHAR_QUESTGIVER,'530','1','1','0','0','-3978.52','-13914.1','99.3008','5.25116','300','0','0','10080','8814','0','0','0','0'), -- Draenei
(@CREA_PVPCHAR_QUESTGIVER_09,@PVPCHAR_QUESTGIVER,'609','1','1','0','0','2333.78','-5651.35','426.029','5.69342','300','0','0','10080','8814','0','0','0','0'); -- Death Knight


-- The new Vendors // Die neuen Händler
-- Basierend auf:
--   Alanura Feuerwolke -- Neue Gegenstände für den Verkauf
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_MISC;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_MISC,@HAENDLER_KOSTENLOS_MODEL,'0','0','0',
'Miscellaneous',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'EventAI',
'897','0','0','','0');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_MISC;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_MISC,'','','Verschiedenes','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_MISC;

DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_MISC;
INSERT INTO npc_vendor(slot, entry, item)
VALUES
(  0, @CT_VENDOR_MISC, 34722 ), -- Schwerer Froststoffverband, Benötigt Erste Hilfe (400)
(  1, @CT_VENDOR_MISC, 3775 ), -- Verkrüppelndes Gift, Klassen: Schurke, Benötigt Stufe 20
(  2, @CT_VENDOR_MISC, 5237 ), -- Gedankenbenebelndes Gift, Klassen: Schurke, Benötigt Stufe 24
(  3, @CT_VENDOR_MISC, 5565 ), -- Höllenstein
(  4, @CT_VENDOR_MISC, 16583 ), -- Dämonenstatuette
(  5, @CT_VENDOR_MISC, 17020 ), -- Arkanes Pulver
(  6, @CT_VENDOR_MISC, 17030 ), -- Ankh
(  7, @CT_VENDOR_MISC, 17033 ), -- Symbol der Offenbarung
(  8, @CT_VENDOR_MISC, 21177 ), -- Symbol der Könige
(  9, @CT_VENDOR_MISC, 37201 ), -- Leichenstaub
( 10, @CT_VENDOR_MISC, 43231 ), -- Sofort wirkendes Gift IX, Klassen: Schurke, Benötigt Stufe 79
( 11, @CT_VENDOR_MISC, 43233 ), -- Tödliches Gift IX, Klassen: Schurke, Benötigt Stufe 80
( 12, @CT_VENDOR_MISC, 43235 ), -- Wundgift VII, Klassen: Schurke, Benötigt Stufe 78
( 13, @CT_VENDOR_MISC, 43237 ), -- Beruhigendes Gift II, Klassen: Schurke, Benötigt Stufe 77
( 14, @CT_VENDOR_MISC, 44605 ), -- Wildes Wirbelkraut (für Gabe der Wildnis)
( 15, @CT_VENDOR_MISC, 44614 ), -- Sternblattsamen (für Wiedergeburt)
( 16, @CT_VENDOR_MISC, 44615 ), -- Andachtskerze (für Gebet der Seelenstärke, etc)
( 17, @CT_VENDOR_MISC, 43523 ), -- Herbeigezauberter Manastrudel (80), Benötigt Stufe 80
( 18, @CT_VENDOR_MISC, 6265 ), -- Seelensplitter
( 19, @CT_VENDOR_MISC, 17058 ), -- Fischöl
( 20, @CT_VENDOR_MISC, 17056 ), -- Leichte Feder
( 21, @CT_VENDOR_MISC, 35948 ), -- Pikante Schneepflaume, Benötigt Stufe 75
( 22, @CT_VENDOR_MISC, 43236 ), -- Sternentrauer, Benötigt Stufe 75
( 23, @CT_VENDOR_MISC, 41165 ), -- Messerscharfe Saronitpfeile; 200 blau
( 24, @CT_VENDOR_MISC, 41164 ), -- Mammutschneider; 200 blau
-- ( 23, @CT_VENDOR_MISC, 52021 ), -- Eisklingenpfeil; 230 epic
-- ( 24, @CT_VENDOR_MISC, 52020 ), -- Splittermunition; 230 epic
( 25, @CT_VENDOR_MISC, 40359 ), -- Frisches Adlerfleisch, Benötigt Stufe 65
-- ( 26, @CT_VENDOR_MISC, 23162 ), -- Forors Kiste der endlosen Widerstandsausstattung, Beim Aufheben gebunden, 36 Platz Tasche
( 26, @CT_VENDOR_MISC, 41599 ), -- Froststofftasche
( 27, @CT_VENDOR_MISC, 44447 ), -- Drachenschuppenmunitionsbeutel, Beim Anlegen gebunden, 28 Platz Munitionsbeutel
( 28, @CT_VENDOR_MISC, 44448 ), -- Verstärkter nerubischer Köcher, Beim Anlegen gebunden, 28 Platz Köcher
( 29, @CT_VENDOR_MISC, 5175 ), -- Erdtotem
( 30, @CT_VENDOR_MISC, 5176 ), -- Feuertotem
( 31, @CT_VENDOR_MISC, 5178 ), -- Lufttotem
( 32, @CT_VENDOR_MISC, 5177 ), -- Wassertotem
( 33, @CT_VENDOR_MISC, 21215 ), -- Graccus hausgemachte Früchtepastete, Beim Aufheben gebunden, Benötigt Stufe 40
( 34, @CT_VENDOR_MISC, 44225 ), -- Reins of the Armored Brown Bear
( 35, @CT_VENDOR_MISC, 44226 ), -- Reins of the Armored Brown Bear
( 36, @CT_VENDOR_MISC, 5976 );  -- Gildenwappenrock

/*
-- Stack auf 200, Preis
 UPDATE item_template SET stackable = 200, buycount = 200, sellprice = 0, buyprice = 0 WHERE entry IN (
43237, 17030, 17020, 43523, 37201, 3775, 43233, 16583, 44615, 17058, 40359, 21215, 34722, 52021,
5565, 43231, 17056, 5237, 35948, 52020, 6265, 43236, 44614, 17033, 21177, 44605, 43235);
UPDATE item_template SET sellprice = 0, buyprice = 0 WHERE entry IN ( 44448, 44447 );
-- Erdtotem
UPDATE item_template SET stackable = 1, buycount = 1, sellprice = 0, buyprice = 0 WHERE entry IN (5175);
*/

-- Reitlehrer -- Basierend auf Pilot Vic // 28746 :: ANFANG
DELETE FROM `creature_template` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3,
 KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4,
 name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp,
 faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower,
 dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family,
 trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower,
 type, type_flags, lootid, pickpocketloot, skinloot,
 resistance1, resistance2, resistance3, resistance4, resistance5, resistance6,
 spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId,
 VehicleId, mingold, maxgold, AIName, MovementType, InhabitType,
 Health_mod, Mana_mod, Armor_mod, RacialLeader,
 questItem1, questItem2, questItem3, questItem4, questItem5, questItem6,
 movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES
(@CT_RIDING_TRAINER, '0', '0', '0', '0', '0', '15759', '0', '0', '0',
 'Ulf', 'Meister des fliegens', NULL,
'10723', '78', '78', '2',
'35', '35', '209', '1.0', '1.38571',
'1.0', '0', '322.0', '466.0', '0', '236', '1.0', '2000', '0', '8', '32768', '8', '0', '1', '0', 
'0', '0', '296.0', '440.0', '58', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '7', '1.0', '1.0', '1.0', '0', '0', '0', '0',
'0', '0', '0', '0', '1', '0', '0', '128', '', '12340');
/*
(@CT_RIDING_TRAINER,@MODEL_RIDING_TRAINER,'0','0','0',
'Riding Trainer',@LOL_TEAM,'',
'0','80','80','2','35','35',209, -- @NPCFLAG_TRAINER | @NPCFLAG_PROFESSIONTRAINER | @NPCFLAG_GOSSIP,
'1','1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69',
'7','4096',
'',
'897','0','0','','12340');
*/
DELETE FROM `locales_creature` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_RIDING_TRAINER,'','','Reitlehrer','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `npc_trainer` WHERE `entry` = @CT_RIDING_TRAINER;
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue)
VALUES
(@CT_RIDING_TRAINER, '33388', '0', '0', '0'), -- Unerfahrenes Reiten
(@CT_RIDING_TRAINER, '33391', '0', '0', '0'), -- Geübtes Reiten
(@CT_RIDING_TRAINER, '34090', '0', '0', '0'), -- Erfahrenes Reiten
(@CT_RIDING_TRAINER, '34091', '0', '0', '0'), -- Gekonntes Reiten
(@CT_RIDING_TRAINER, '54197', '0', '0', '0'); -- Kaltwetterflug
-- (@CT_RIDING_TRAINER, '61229', '0', '0', '0'); -- Gepanzerter weißer Greif
-- (@CT_RIDING_TRAINER, '32296', '0', '0', '0'), -- Schneller gelber Windreiter
--
-- Reitlehrer -- Basierend auf Pilot Vic // 28746 :: ENDE

-- Mounts
DELETE FROM `creature_template` WHERE `entry` = (@CT_MOUNT_VENDOR);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2,
 modelid1, modelid2, modelid3, modelid4, name, subname, IconName,
 gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H,
 npcflag,
 speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier,
 baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family,
 trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_MOUNT_VENDOR, '0', '0', '0', '0', '0',
 '27822', '0', '0', '0', 'Mounts', NULL, NULL,
 '0', '80', '80', '2', '35', '35',
 @NPCFLAG_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,
 '1.0', '1.14286', '1.0', '0', '346.0', '499.0', '0', '287', '1.0',
 '2000', '0', '8', '32768', '8', '0',
 '1', '0', '0', '0', '315.0', '468.0', '69', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '897', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_MOUNT_VENDOR+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_MOUNT_VENDOR, '', '', 'Reittiere', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_vendor` WHERE `entry` = @CT_MOUNT_VENDOR;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES 
(@CT_MOUNT_VENDOR, '25531', '501', '0'), -- Swift Green Wind Rider
(@CT_MOUNT_VENDOR, '18788', '501', '1'), -- Swift Blue Raptor
(@CT_MOUNT_VENDOR, '25533', '501', '2'), -- Swift Purple Wind Rider
(@CT_MOUNT_VENDOR, '18795', '501', '3'), -- Great Gray Kodo
(@CT_MOUNT_VENDOR, '18796', '501', '4'), -- Horn of the Swift Brown Wolf
(@CT_MOUNT_VENDOR, '25477', '501', '5'), -- Swift Red Wind Rider
(@CT_MOUNT_VENDOR, '18797', '501', '6'), -- Horn of the Swift Timber Wolf
(@CT_MOUNT_VENDOR, '44690', '501', '7'), -- Armored Blue Wind Rider
(@CT_MOUNT_VENDOR, '25532', '501', '8'), -- Swift Yellow Wind Rider
(@CT_MOUNT_VENDOR, '18794', '501', '9'), -- Great Brown Kodo
(@CT_MOUNT_VENDOR, '28936', '501', '10'), -- Swift Pink Hawkstrider
(@CT_MOUNT_VENDOR, '29224', '501', '11'), -- Swift Purple Hawkstrider
-- (@CT_MOUNT_VENDOR, '44225', '0', '12'), -- Reins of the Armored Brown Bear
-- (@CT_MOUNT_VENDOR, '44226', '0', '13'), -- Reins of the Armored Brown Bear
(@CT_MOUNT_VENDOR, '18798', '501', '14'), -- Horn of the Swift Gray Wolf
(@CT_MOUNT_VENDOR, '13334', '501', '15'), -- Green Skeletal Warhorse
(@CT_MOUNT_VENDOR, '18791', '501', '16'), -- Purple Skeletal Warhorse
(@CT_MOUNT_VENDOR, '18790', '501', '17'), -- Swift Orange Raptor
(@CT_MOUNT_VENDOR, '18789', '501', '18'), -- Swift Olive Raptor
(@CT_MOUNT_VENDOR, '18766', '501', '19'), -- Reins of the Swift Frostsaber
(@CT_MOUNT_VENDOR, '18767', '501', '20'), -- Reins of the Swift Mistsaber
(@CT_MOUNT_VENDOR, '18902', '501', '21'), -- Reins of the Swift Stormsaber
(@CT_MOUNT_VENDOR, '18786', '501', '22'), -- Swift Brown Ram
(@CT_MOUNT_VENDOR, '18787', '501', '23'), -- Swift Gray Ram
(@CT_MOUNT_VENDOR, '18785', '501', '24'), -- Swift White Ram
(@CT_MOUNT_VENDOR, '18772', '501', '25'), -- Swift Green Mechanostrider
(@CT_MOUNT_VENDOR, '18773', '501', '26'), -- Swift White Mechanostrider
(@CT_MOUNT_VENDOR, '18774', '501', '27'), -- Swift Yellow Mechanostrider
(@CT_MOUNT_VENDOR, '18777', '501', '28'), -- Swift Brown Steed
(@CT_MOUNT_VENDOR, '18776', '501', '29'), -- Swift Palomino
(@CT_MOUNT_VENDOR, '18778', '501', '30'), -- Swift White Steed
(@CT_MOUNT_VENDOR, '29745', '501', '31'), -- Great Blue Elekk
(@CT_MOUNT_VENDOR, '29746', '501', '32'), -- Great Green Elekk
(@CT_MOUNT_VENDOR, '29747', '501', '33'), -- Great Purple Elekk
(@CT_MOUNT_VENDOR, '32858', '501', '34'), -- Reins of the Azure Netherwing Drake
(@CT_MOUNT_VENDOR, '32859', '501', '35'), -- Reins of the Cobalt Netherwing Drake
(@CT_MOUNT_VENDOR, '32857', '501', '36'), -- Reins of the Onyx Netherwing Drake
(@CT_MOUNT_VENDOR, '32860', '501', '37'), -- Reins of the Purple Netherwing Drake
(@CT_MOUNT_VENDOR, '32861', '501', '38'), -- Reins of the Veridian Netherwing Drake
(@CT_MOUNT_VENDOR, '32862', '501', '39'); -- Reins of the Violet Netherwing Drake
DELETE FROM `npc_trainer` WHERE `entry` = @CT_MOUNT_VENDOR;
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue)
VALUES
(@CT_MOUNT_VENDOR, '33388', '0', '0', '0'), -- Unerfahrenes Reiten
(@CT_MOUNT_VENDOR, '33391', '0', '0', '0'), -- Geübtes Reiten
(@CT_MOUNT_VENDOR, '34090', '0', '0', '0'), -- Erfahrenes Reiten
(@CT_MOUNT_VENDOR, '34091', '0', '0', '0'), -- Gekonntes Reiten
(@CT_MOUNT_VENDOR, '54197', '0', '0', '0'); -- Kaltwetterflug


-- Savage Gladiator // Grausamer Gladiator -- Item Level 200 Blau
-- Komplett
DELETE FROM `creature_template` WHERE `entry` = @CT_SAVAGE_GLADIATOR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_SAVAGE_GLADIATOR,@MODEL_OBSIDIAN_GOLEM,'0','0','0',
'Savage Gladiator Complete',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_SAVAGE_GLADIATOR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_SAVAGE_GLADIATOR,'','','Grausamer Gladiator Alles','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_SAVAGE_GLADIATOR;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`)
VALUES
(@CT_SAVAGE_GLADIATOR,'0','40778'),
(@CT_SAVAGE_GLADIATOR,'0','40779'), (@CT_SAVAGE_GLADIATOR,'0','40780'), (@CT_SAVAGE_GLADIATOR,'0','40797'), 
(@CT_SAVAGE_GLADIATOR,'0','40798'), (@CT_SAVAGE_GLADIATOR,'0','40799'), (@CT_SAVAGE_GLADIATOR,'0','40816'), 
(@CT_SAVAGE_GLADIATOR,'0','40817'), (@CT_SAVAGE_GLADIATOR,'0','40818'), (@CT_SAVAGE_GLADIATOR,'0','40836'), 
(@CT_SAVAGE_GLADIATOR,'0','40837'), (@CT_SAVAGE_GLADIATOR,'0','40838'), (@CT_SAVAGE_GLADIATOR,'0','40856'), 
(@CT_SAVAGE_GLADIATOR,'0','40857'), (@CT_SAVAGE_GLADIATOR,'0','40858'), (@CT_SAVAGE_GLADIATOR,'0','40898'), 
(@CT_SAVAGE_GLADIATOR,'0','40918'), (@CT_SAVAGE_GLADIATOR,'0','40930'), (@CT_SAVAGE_GLADIATOR,'0','40936'), 
(@CT_SAVAGE_GLADIATOR,'0','40960'), (@CT_SAVAGE_GLADIATOR,'0','40986'), (@CT_SAVAGE_GLADIATOR,'0','40987'), 
(@CT_SAVAGE_GLADIATOR,'0','40998'), (@CT_SAVAGE_GLADIATOR,'0','41004'), (@CT_SAVAGE_GLADIATOR,'0','41010'), 
(@CT_SAVAGE_GLADIATOR,'0','41016'), (@CT_SAVAGE_GLADIATOR,'0','41023'), (@CT_SAVAGE_GLADIATOR,'0','41024'), 
(@CT_SAVAGE_GLADIATOR,'0','41030'), (@CT_SAVAGE_GLADIATOR,'0','41041'), (@CT_SAVAGE_GLADIATOR,'0','41078'), 
(@CT_SAVAGE_GLADIATOR,'0','41084'), (@CT_SAVAGE_GLADIATOR,'0','41134'), (@CT_SAVAGE_GLADIATOR,'0','41140'), 
(@CT_SAVAGE_GLADIATOR,'0','41148'), (@CT_SAVAGE_GLADIATOR,'0','41154'), (@CT_SAVAGE_GLADIATOR,'0','41160'), 
(@CT_SAVAGE_GLADIATOR,'0','41202'), (@CT_SAVAGE_GLADIATOR,'0','41208'), (@CT_SAVAGE_GLADIATOR,'0','41214'), 
(@CT_SAVAGE_GLADIATOR,'0','41268'), (@CT_SAVAGE_GLADIATOR,'0','41269'), (@CT_SAVAGE_GLADIATOR,'0','41270'), 
(@CT_SAVAGE_GLADIATOR,'0','41271'), (@CT_SAVAGE_GLADIATOR,'0','41272'), (@CT_SAVAGE_GLADIATOR,'0','41278'), 
(@CT_SAVAGE_GLADIATOR,'0','41290'), (@CT_SAVAGE_GLADIATOR,'0','41301'), (@CT_SAVAGE_GLADIATOR,'0','41313'), 
(@CT_SAVAGE_GLADIATOR,'0','41324'), (@CT_SAVAGE_GLADIATOR,'0','41643'), (@CT_SAVAGE_GLADIATOR,'0','41644'), 
(@CT_SAVAGE_GLADIATOR,'0','41645'), (@CT_SAVAGE_GLADIATOR,'0','41646'), (@CT_SAVAGE_GLADIATOR,'0','41647'), 
(@CT_SAVAGE_GLADIATOR,'0','41658'), (@CT_SAVAGE_GLADIATOR,'0','41664'), (@CT_SAVAGE_GLADIATOR,'0','41675'), 
(@CT_SAVAGE_GLADIATOR,'0','41712'), (@CT_SAVAGE_GLADIATOR,'0','41770'), (@CT_SAVAGE_GLADIATOR,'0','41847'), 
(@CT_SAVAGE_GLADIATOR,'0','41848'), (@CT_SAVAGE_GLADIATOR,'0','41849'), (@CT_SAVAGE_GLADIATOR,'0','41850'), 
(@CT_SAVAGE_GLADIATOR,'0','41851'), (@CT_SAVAGE_GLADIATOR,'0','41912'), (@CT_SAVAGE_GLADIATOR,'0','41918'), 
(@CT_SAVAGE_GLADIATOR,'0','41924'), (@CT_SAVAGE_GLADIATOR,'0','41930'), (@CT_SAVAGE_GLADIATOR,'0','41937'), 
(@CT_SAVAGE_GLADIATOR,'0','41943'), (@CT_SAVAGE_GLADIATOR,'0','41949'), (@CT_SAVAGE_GLADIATOR,'0','41956'), 
(@CT_SAVAGE_GLADIATOR,'0','41962'), (@CT_SAVAGE_GLADIATOR,'0','41968'), (@CT_SAVAGE_GLADIATOR,'0','41990'), 
(@CT_SAVAGE_GLADIATOR,'0','41996'), (@CT_SAVAGE_GLADIATOR,'0','42002'), (@CT_SAVAGE_GLADIATOR,'0','42008'), 
(@CT_SAVAGE_GLADIATOR,'0','42014'), (@CT_SAVAGE_GLADIATOR,'0','42206'), (@CT_SAVAGE_GLADIATOR,'0','42212'), 
(@CT_SAVAGE_GLADIATOR,'0','42213'), (@CT_SAVAGE_GLADIATOR,'0','42214'), (@CT_SAVAGE_GLADIATOR,'0','42215'), 
(@CT_SAVAGE_GLADIATOR,'0','42216'), (@CT_SAVAGE_GLADIATOR,'0','42217'), (@CT_SAVAGE_GLADIATOR,'0','42218'), 
(@CT_SAVAGE_GLADIATOR,'0','42219'), (@CT_SAVAGE_GLADIATOR,'0','42221'), (@CT_SAVAGE_GLADIATOR,'0','42222'), 
(@CT_SAVAGE_GLADIATOR,'0','42224'), (@CT_SAVAGE_GLADIATOR,'0','42294'), (@CT_SAVAGE_GLADIATOR,'0','42295'), 
(@CT_SAVAGE_GLADIATOR,'0','42296'), (@CT_SAVAGE_GLADIATOR,'0','42297'), (@CT_SAVAGE_GLADIATOR,'0','42343'), 
(@CT_SAVAGE_GLADIATOR,'0','42344'), (@CT_SAVAGE_GLADIATOR,'0','42356'), (@CT_SAVAGE_GLADIATOR,'0','42382'), 
(@CT_SAVAGE_GLADIATOR,'0','42388'), (@CT_SAVAGE_GLADIATOR,'0','42444'), (@CT_SAVAGE_GLADIATOR,'0','42445'), 
(@CT_SAVAGE_GLADIATOR,'0','42446'), (@CT_SAVAGE_GLADIATOR,'0','42447'), (@CT_SAVAGE_GLADIATOR,'0','42448'), 
(@CT_SAVAGE_GLADIATOR,'0','42511'), (@CT_SAVAGE_GLADIATOR,'0','42517'), (@CT_SAVAGE_GLADIATOR,'0','42523'), 
(@CT_SAVAGE_GLADIATOR,'0','42529'), (@CT_SAVAGE_GLADIATOR,'0','42535'), (@CT_SAVAGE_GLADIATOR,'0','42556'), 
(@CT_SAVAGE_GLADIATOR,'0','42557'), (@CT_SAVAGE_GLADIATOR,'0','42568'), (@CT_SAVAGE_GLADIATOR,'0','42574'), 
(@CT_SAVAGE_GLADIATOR,'0','42575'), (@CT_SAVAGE_GLADIATOR,'0','42576'), (@CT_SAVAGE_GLADIATOR,'0','42593'), 
(@CT_SAVAGE_GLADIATOR,'0','42594'), (@CT_SAVAGE_GLADIATOR,'0','42595'), (@CT_SAVAGE_GLADIATOR,'0','42611'), 
(@CT_SAVAGE_GLADIATOR,'0','42612'), (@CT_SAVAGE_GLADIATOR,'0','42618'), (@CT_SAVAGE_GLADIATOR,'0','44415'), 
(@CT_SAVAGE_GLADIATOR,'0','44416');

---
-- Crafted PvP Gear - Item Level 187: START
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_PVP_STARTINGGEAR,@MODEL_OBSIDIAN_GOLEM,'0','0','0',
'Crafted PvP Gear',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_PVP_STARTINGGEAR,'','','Selbstgemachte PvP Sachen','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_PVP_STARTINGGEAR;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`) 
VALUES
-- Stoff, Frostgrimmschlachtrüstung :: http://loldb.landoflegends.de/?itemset=819
(@CT_VENDOR_PVP_STARTINGGEAR, '0', '41516'), -- Frostsavage Gloves
(@CT_VENDOR_PVP_STARTINGGEAR, '1', '43969'), -- Frostsavage Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '2', '43970'), -- Frostsavage Boots
(@CT_VENDOR_PVP_STARTINGGEAR, '3', '43971'), -- Frostsavage Cowl
(@CT_VENDOR_PVP_STARTINGGEAR, '4', '43972'), -- Frostsavage Robe
(@CT_VENDOR_PVP_STARTINGGEAR, '5', '43973'), -- Frostsavage Shoulders
(@CT_VENDOR_PVP_STARTINGGEAR, '6', '43974'), -- Frostsavage Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '7', '43975'), -- Frostsavage Leggings
-- Leder, Schlachtrüstung des Ausweiders :: http://loldb.landoflegends.de/?itemset=813
(@CT_VENDOR_PVP_STARTINGGEAR, '8', '43260'), -- Eviscerator''s Facemask
(@CT_VENDOR_PVP_STARTINGGEAR, '9', '43433'), -- Eviscerator''s Shoulderpads
(@CT_VENDOR_PVP_STARTINGGEAR, '10', '43434'), -- Eviscerator''s Chestguard
(@CT_VENDOR_PVP_STARTINGGEAR, '11', '43435'), -- Eviscerator''s Bindings
(@CT_VENDOR_PVP_STARTINGGEAR, '12', '43436'), -- Eviscerator''s Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '13', '43437'), -- Eviscerator''s Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '14', '43438'), -- Eviscerator''s Legguards
(@CT_VENDOR_PVP_STARTINGGEAR, '15', '43439'), -- Eviscerator''s Treads
-- Leder, Unwetterschlachtrüstung :: http://loldb.landoflegends.de/?itemset=815
(@CT_VENDOR_PVP_STARTINGGEAR, '16', '43261'), -- Overcast Headguard
(@CT_VENDOR_PVP_STARTINGGEAR, '17', '43262'), -- Overcast Spaulders
(@CT_VENDOR_PVP_STARTINGGEAR, '18', '43263'), -- Overcast Chestguard
(@CT_VENDOR_PVP_STARTINGGEAR, '19', '43264'), -- Overcast Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '20', '43265'), -- Overcast Handwraps
(@CT_VENDOR_PVP_STARTINGGEAR, '21', '43266'), -- Overcast Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '22', '43271'), -- Overcast Leggings
(@CT_VENDOR_PVP_STARTINGGEAR, '23', '43273'), -- Overcast Boots
-- Schwere Rüstung, Sturmbalgschlachtrüstung :: http://loldb.landoflegends.de/?itemset=817
(@CT_VENDOR_PVP_STARTINGGEAR, '24', '43450'), -- Stormhide Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '25', '43451'), -- Stormhide Stompers
(@CT_VENDOR_PVP_STARTINGGEAR, '26', '43452'), -- Stormhide Wristguards
(@CT_VENDOR_PVP_STARTINGGEAR, '27', '43453'), -- Stormhide Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '28', '43454'), -- Stormhide Grips
(@CT_VENDOR_PVP_STARTINGGEAR, '29', '43455'), -- Stormhide Crown
(@CT_VENDOR_PVP_STARTINGGEAR, '30', '43456'), -- Stormhide Legguards
(@CT_VENDOR_PVP_STARTINGGEAR, '31', '43457'), -- Stormhide Shoulders
-- Schwere Rüstung, Flinkpfeilschlachtrüstung :: http://loldb.landoflegends.de/?itemset=818
(@CT_VENDOR_PVP_STARTINGGEAR, '32', '43442'), -- Swiftarrow Belt
(@CT_VENDOR_PVP_STARTINGGEAR, '33', '43443'), -- Swiftarrow Boots
(@CT_VENDOR_PVP_STARTINGGEAR, '34', '43444'), -- Swiftarrow Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '35', '43445'), -- Swiftarrow Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '36', '43446'), -- Swiftarrow Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '37', '43447'), -- Swiftarrow Helm
(@CT_VENDOR_PVP_STARTINGGEAR, '38', '43448'), -- Swiftarrow Leggings
(@CT_VENDOR_PVP_STARTINGGEAR, '39', '43449'), -- Swiftarrow Shoulderguards
-- Platte, Verzierte Saronitschlachtrüstung :: http://loldb.landoflegends.de/?itemset=814
(@CT_VENDOR_PVP_STARTINGGEAR, '40', '42723'), -- Ornate Saronite Bracers
(@CT_VENDOR_PVP_STARTINGGEAR, '41', '42724'), -- Ornate Saronite Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '42', '42725'), -- Ornate Saronite Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '43', '42726'), -- Ornate Saronite Legplates
(@CT_VENDOR_PVP_STARTINGGEAR, '44', '42727'), -- Ornate Saronite Pauldrons
(@CT_VENDOR_PVP_STARTINGGEAR, '45', '42728'), -- Ornate Saronite Skullshield
(@CT_VENDOR_PVP_STARTINGGEAR, '46', '42729'), -- Ornate Saronite Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '47', '42730'), -- Ornate Saronite Walkers
-- Platte, Wilde Saronitschlachtrüstung :: http://loldb.landoflegends.de/?itemset=816
(@CT_VENDOR_PVP_STARTINGGEAR, '48', '41347'), -- Savage Saronite Legplates
(@CT_VENDOR_PVP_STARTINGGEAR, '49', '41348'), -- Savage Saronite Walkers
(@CT_VENDOR_PVP_STARTINGGEAR, '50', '41349'), -- Savage Saronite Gauntlets
(@CT_VENDOR_PVP_STARTINGGEAR, '51', '41350'), -- Savage Saronite Skullshield
(@CT_VENDOR_PVP_STARTINGGEAR, '52', '41351'), -- Savage Saronite Pauldrons
(@CT_VENDOR_PVP_STARTINGGEAR, '53', '41352'), -- Savage Saronite Waistguard
(@CT_VENDOR_PVP_STARTINGGEAR, '54', '41353'), -- Savage Saronite Hauberk
(@CT_VENDOR_PVP_STARTINGGEAR, '55', '41354'); -- Savage Saronite Bracers

-- Händler für Fressalien für Hunter Pets: ANFANG
-- Model: Slosh
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`,
`speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`,
`unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`,
`minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_HUNTER_FOOD_VENDOR,5782,'0','0','0',
'Food and Drink',@LOL_TEAM,NULL,
'0','80','80','2','35', '35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8',
'0','8','0','0',
'0','0','0',
'315','468','69',
'7','4096',
'',
'85','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_FOOD_VENDOR,'','','Speis & Trank','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_HUNTER_FOOD_VENDOR;
INSERT INTO npc_vendor(entry, item, ExtendedCost, slot)
VALUES
(@CT_HUNTER_FOOD_VENDOR+0, '34722', '0', '0'), -- Heavy Frostweave Bandage
(@CT_HUNTER_FOOD_VENDOR+0, '33445', '0', '1'), -- Honeymint Tea
(@CT_HUNTER_FOOD_VENDOR+0, '35948', '0', '2'), -- Savory Snowplum
(@CT_HUNTER_FOOD_VENDOR+0, '35953', '0', '3'), -- Mead Basted Caribou
(@CT_HUNTER_FOOD_VENDOR+0, '43236', '0', '4'), -- Star's Sorrow
(@CT_HUNTER_FOOD_VENDOR+0, '29453', '0', '5'), -- Sporeggarpilz
(@CT_HUNTER_FOOD_VENDOR+0, '43523', '0', '6'); -- Conjured Mana Strudel
-- Gegenstände kostenlos
-- UPDATE item_template SET buycount = 200, sellprice = 0, buyprice = 0, stackable = 200 WHERE entry IN ( 33445, 35953 );

-- Händler für Fressalien für Hunter Pets: ENDE
-- Model: Slosh

-- Hunter Pet Trainer, basierend auf Creature 10088: ANFANG
-- Model: Xao\'tsu'
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_PET_TRAINER;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`,
`name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`,
`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_HUNTER_PET_TRAINER,'0','0','0','0','0','9336','0','0','0',
'Pet Trainer',@LOL_TEAM,NULL,'4783','40','40','0',
'35', '35','19','1.1','1.14286','1','0','56','74','0','136','1','2000','1771','1','512','8','0','3','0','0','0','39','57','14','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1.15','1','1','0','0','0','0','0','0','0','0','1','191','0','2','npc_pet_trainer','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_PET_TRAINER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_PET_TRAINER,'','','Tierausbilder','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
-- Hunter Pet Trainer, basierend auf Creature 10088: ENDE
-- Model: Xao\'tsu'

-- Hunter Stallmeister, basierend auf Creature 28690; Tassia Flüsterschlucht: ANFANG
-- Model: Tassia Flüsterschlucht
DELETE FROM `creature_template` WHERE `entry` = @CT_HUNTER_STABLE_MASTER;
insert into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`,
`name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`,
`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
values(@CT_HUNTER_STABLE_MASTER,'0','0','0','0','0','25607','0','0','0',
'Stable Master',@LOL_TEAM,'','9821','75','75','2',
'35', '35','4194305','1','1.14286','1','0','342','485','0','392','1','2000','0','1','32768','8','0','0','0','0','0','295','438','68','7','4096','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_HUNTER_STABLE_MASTER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`,
`subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`, `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_HUNTER_STABLE_MASTER,'','','Stallmeisterin','','','','','',
NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
-- Hunter Stallmeister, basierend auf Creature 28.690; Tassia Flüsterschlucht: ENDE
-- Model: Tassia Flüsterschlucht

--
-- Hunter Pets: ANFANG
--

-- Copy all needed hunter pets
-- This is necessary, since we need to change their faction to "yellow"
-- Young Goretusk 454
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+0, '0', '0', '0', '0', '0', '8871', '0', '0', '0', 'Young Goretusk', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '48', '1.0', '2000', '0', '1', '0', '8', '5', '0', '0', '0', '0', '12.0', '18.0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '6268', '0', '0', '0', '0', '0', '0', '0', '9088', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+0, '', '', 'Junger Geiferzahn', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Black Widow Hatchling 930
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+1, '0', '0', '0', '0', '0', '368', '0', '0', '0', 'Black Widow Hatchling', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '86', '1.0', '2000', '0', '1', '0', '8', '3', '0', '0', '0', '0', '24.0', '36.0', '6', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7367', '744', '0', '0', '0', '0', '0', '0', '10506', '0', '0', '0', 'EventAI', '1', '1', '1.02', '1.0', '1.0', '0', '1130', '7267', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+1, '', '', 'Junges einer Schwarzen Witwe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Corrupted Scorpid 3226
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+2, '0', '0', '0', '0', '0', '2488', '0', '0', '0', 'Corrupted Scorpid', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '44', '1.0', '2000', '0', '1', '0', '8', '20', '0', '0', '0', '0', '9.0', '14.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5413', '0', '0', '0', '0', '0', '0', '0', '8848', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '4886', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+2, '', '', 'Verderbter Skorpid', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Corrupted Dreadmaw Crocolisk 3231
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+3, '0', '0', '0', '0', '0', '1034', '0', '0', '0', 'Corrupted Dreadmaw Crocolisk', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '46', '1.0', '2000', '0', '1', '32768', '8', '6', '0', '0', '0', '0', '11.0', '17.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7901', '0', '0', '0', '0', '0', '0', '0', '12928', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '4891', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+3, '', '', 'Verderbter Schaudermagenkrokilisk', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Savannah Highmane 3243
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+4, '0', '0', '0', '0', '0', '1973', '0', '0', '0', 'Savannah Highmane', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.42857', '1.0', '0', '5', '5', '0', '48', '1.0', '1500', '0', '1', '0', '8', '2', '0', '0', '0', '0', '12.0', '18.0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13338', '0', '0', '0', '', '1', '1', '1.0', '1.0', '1.0', '0', '4893', '0', '0', '0', '0', '0', '144', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+4, '', '', 'Savannenhochmähne', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ashenvale Bear 3809
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+5, '0', '0', '0', '0', '0', '820', '0', '0', '0', 'Ashenvale Bear', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '78', '1.0', '2000', '0', '1', '0', '8', '4', '0', '0', '0', '0', '21.0', '32.0', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5803', '0', '0', '0', '', '1', '1', '1.27', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+5, '', '', 'Eschentalbär', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bonepaw Hyena 4688
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+6, '0', '0', '0', '0', '0', '10902', '0', '0', '0', 'Bonepaw Hyena', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '118', '1.0', '2000', '0', '1', '0', '8', '25', '0', '0', '0', '0', '33.0', '49.0', '11', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8280', '0', '0', '0', '', '1', '1', '0.4', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+6, '', '', 'Skelettpfotenhyäne', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Monstrous Plaguebat 8602
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+7, '0', '0', '0', '0', '0', '7897', '0', '0', '0', 'Monstrous Plaguebat', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '242', '1.0', '2000', '0', '1', '0', '8', '24', '0', '0', '0', '0', '69.0', '101.0', '25', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8281', '0', '0', '0', '0', '0', '0', '0', '5789', '0', '0', '0', 'EventAI', '1', '3', '1.35', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+7, '', '', 'Monströse Seuchenfledermaus', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Core Hound 11671
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+8, '0', '0', '0', '0', '0', '12168', '0', '0', '0', 'Core Hound', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.3', '1.14286', '1.0', '1', '5', '5', '0', '258', '7.5', '2000', '0', '1', '0', '8', '45', '0', '0', '0', '0', '127.0', '188.0', '28', '1', '8', '0', '0', '0', '0', '93', '0', '0', '0', '0', '19771', '19771', '0', '0', '0', '0', '0', '0', '0', '0', '2056', '2689', '', '1', '3', '15.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '164', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+8, '', '', 'Kernhund', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Vekniss Warrior 15230
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+9, '0', '0', '0', '0', '0', '15334', '0', '0', '0', 'Vekniss Warrior', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.6', '1.14286', '1.0', '1', '5', '5', '0', '258', '7.5', '2000', '0', '1', '64', '8', '41', '0', '0', '0', '0', '127.0', '188.0', '28', '1', '65545', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '16.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '167', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+9, '', '', 'Krieger der Vekniss', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Feral Dragonhawk Hatchling 15649
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+10);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+10, '0', '0', '0', '0', '0', '17547', '0', '0', '0', 'Feral Dragonhawk Hatchling', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.0', '0.85714', '1.0', '0', '5', '5', '0', '29', '1.0', '2000', '0', '2', '0', '8', '30', '0', '0', '0', '0', '4.0', '6.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10481', '29117', '0', '0', '0', '0', '0', '0', '0', '10481', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '100', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+10);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+10, '', '', 'Wildes Drachenfalkenjunges', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Razorfang Hatchling 16932
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+11);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+11, '0', '0', '0', '0', '0', '19844', '0', '0', '0', 'Razorfang Hatchling', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '252', '1.0', '2000', '0', '1', '0', '8', '31', '0', '0', '0', '0', '72.0', '106.0', '26', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '33781', '0', '0', '0', '0', '0', '0', '0', '11567', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+11);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+11, '', '', 'Messerklauenjungtier', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Shattered Hand Warhound 17280
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+12);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+12, '18059', '0', '0', '0', '0', '14334', '0', '0', '0', 'Shattered Hand Warhound', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.38571', '1.0', '0', '5', '5', '0', '248', '4.6', '1500', '0', '1', '0', '8', '1', '0', '0', '0', '0', '70.0', '103.0', '25', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '30639', '30636', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+12);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+12, '', '', 'Kriegshund der Zerschmetterten Hand', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blue Flutterer 17349
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+13);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+13, '0', '0', '0', '0', '0', '17709', '0', '0', '0', 'Blue Flutterer', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '44', '1.0', '2000', '0', '1', '0', '8', '37', '0', '0', '0', '0', '9.0', '14.0', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36332', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+13);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+13, '', '', 'Blauer Falter', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- The Kurken 17447
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+14);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+14, '0', '0', '0', '0', '0', '17028', '0', '0', '0', 'The Kurken', NULL, NULL, '0', '80', '80', '0', '189', '189', '2', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '46', '1.0', '2000', '0', '1', '32768', '8', '45', '0', '0', '0', '0', '11.0', '17.0', '0', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13', '22', '', '1', '3', '1.0', '1.0', '1.0', '0', '23860', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+14);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+14, '', '', 'Kurken', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Zarakh 17683
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+15);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+15, '0', '0', '0', '0', '0', '17180', '0', '0', '0', 'Zarakh', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '68', '1.0', '1000', '0', '1', '0', '8', '3', '0', '0', '0', '0', '19.0', '27.0', '3', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13118', '0', '0', '0', '', '1', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+15);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+15, '', '', 'Zarakh', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Sporebat 18128
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+16);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+16, '0', '0', '0', '0', '0', '17751', '0', '0', '0', 'Sporebat', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '0.95238', '1.0', '0', '5', '5', '0', '262', '1.0', '2000', '0', '1', '0', '8', '33', '0', '0', '0', '0', '139.0', '207.0', '30', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '35394', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '24426', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+16);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+16, '', '', 'Sporensegler', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Crusty 18241
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+17);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+17, '0', '0', '0', '0', '0', '17625', '0', '0', '0', 'Crusty', NULL, NULL, '0', '80', '80', '0', '189', '189', '0', '1.02', '1.14286', '1.0', '4', '5', '5', '0', '108', '1.0', '1800', '0', '1', '0', '8', '8', '0', '0', '0', '0', '31.0', '46.0', '10', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13024', '0', '40', '205', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+17);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+17, '', '', 'Krusti', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blacksting 18283
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+18);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+18, '0', '0', '0', '0', '0', '18724', '0', '0', '0', 'Blacksting', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '262', '1.0', '2000', '0', '1', '0', '8', '44', '0', '0', '0', '0', '139.0', '207.0', '30', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '35331', '17170', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '24372', '25448', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+18);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+18, '', '', 'Schwarzsichel', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blackfang Tarantula 18983
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+19);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+19, '22162', '0', '0', '0', '0', '1104', '0', '0', '0', 'Blackfang Tarantula', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '292', '4.6', '2000', '1650', '1', '0', '8', '3', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '34365', '0', '0', '0', '0', '0', '0', '0', '13167', '0', '0', '0', 'EventAI', '1', '1', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+19);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+19, '', '', 'Schwarzfangtarantel', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Coilskar Cobra 19784
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+20);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+20, '0', '0', '0', '0', '0', '14559', '0', '0', '0', 'Coilskar Cobra', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '32768', '8', '35', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '38030', '0', '0', '0', '0', '0', '0', '0', '10530', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+20);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+20, '', '', 'Kobra der Echsennarbe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bloodthirsty Marshfang 20196
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+21);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+21, '0', '0', '0', '0', '0', '19405', '0', '0', '0', 'Bloodthirsty Marshfang', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '246', '1.0', '2000', '0', '2', '0', '8', '34', '0', '0', '0', '0', '129.0', '191.0', '26', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12889', '0', '0', '0', 'EventAI', '1', '3', '1.0', '0.5', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+21);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+21, '', '', 'Blutdurstiger Marschenfänger', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bladespire Ravager 20729
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+22);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+22, '0', '0', '0', '0', '0', '20093', '0', '0', '0', 'Bladespire Ravager', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.48', '1.14286', '1.0', '1', '5', '5', '0', '288', '4.6', '2000', '0', '1', '32832', '8', '11', '0', '0', '0', '0', '186.0', '276.0', '39', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16128', '22911', '0', '0', '0', '0', '0', '0', '13231', '0', '0', '0', '', '1', '1', '3.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+22);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+22, '', '', 'Verheerer der Speerspießer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Tyrantus 20931
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+23);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+23, '0', '0', '0', '0', '0', '5238', '0', '0', '0', 'Tyrantus', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '308', '1.0', '1400', '1900', '1', '0', '8', '39', '0', '0', '0', '0', '262.0', '389.0', '48', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36629', '35321', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.3', '1.0', '1.0', '0', '32666', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+23);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+23, '', '', 'Tyrantus', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Nuramoc 20932
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+24);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+24, '0', '0', '0', '0', '0', '19913', '0', '0', '0', 'Nuramoc', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.78', '1.14286', '1.0', '2', '5', '5', '0', '304', '4.6', '1400', '0', '1', '0', '8', '38', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '2.0', '4.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+24);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+24, '', '', 'Nuramoc', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Dire Raven 21042
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+25);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+25, '0', '0', '0', '0', '0', '20013', '0', '0', '0', 'Dire Raven', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '0', '8', '7', '0', '0', '0', '0', '195.0', '289.0', '41', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '31273', '0', '0', '0', '0', '0', '0', '0', '12668', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '147', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+25);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+25, '', '', 'Terrorrabe', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Spawn of Uvuros 21108
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+26);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+26, '0', '0', '0', '0', '0', '20521', '0', '0', '0', 'Spawn of Uvuros', NULL, NULL, '0', '80', '80', '1', '189', '189', '2', '1.125', '1.14286', '1.0', '0', '5', '5', '0', '298', '1.0', '2000', '0', '1', '32768', '8', '45', '0', '0', '0', '0', '206.0', '302.0', '43', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '36405', '36406', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+26);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+26, '', '', 'Brut von Uvuros', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Felboar 21878
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+27);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+27, '0', '0', '0', '21978', '0', '19249', '0', '0', '0', 'Felboar', NULL, NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.19048', '1.0', '0', '5', '5', '0', '292', '1.0', '2000', '0', '1', '0', '8', '0', '0', '0', '0', '0', '195.0', '289.0', '41', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '1', '3', '1.0', '1.0', '1.0', '0', '32502', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+27);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+27, '', '', 'Teufelseber', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Lost Torranche 22807
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+28);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+28, '0', '0', '0', '0', '0', '21087', '0', '0', '0', 'Lost Torranche', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '304', '1.0', '2000', '0', '1', '0', '8', '12', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11669', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '184', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+28);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+28, '', '', 'Verirrter Torranche', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Blackwind Warp Chaser 23219
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+29);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+29, '0', '0', '0', '0', '0', '19998', '0', '0', '0', 'Blackwind Warp Chaser', '', NULL, '0', '80', '80', '1', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '304', '1.0', '2000', '0', '1', '0', '8', '32', '0', '0', '0', '0', '215.0', '320.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '32920', '32739', '32942', '37417', '0', '0', '0', '0', '12933', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+29);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+29, '', '', 'Schattenwindhetzer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Goreclaw the Ravenous 23873
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+30);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+30, '0', '0', '0', '0', '0', '21825', '0', '0', '0', 'Goreclaw the Ravenous', '', NULL, '0', '80', '80', '0', '189', '189', '0', '1.6', '1.14286', '1.0', '0', '5', '5', '0', '132', '1.0', '2000', '0', '1', '0', '8', '11', '0', '0', '0', '0', '37.0', '55.0', '13', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13236', '0', '0', '0', '', '1', '3', '1.5', '1.0', '1.0', '0', '33085', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+30);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+30, '', '', 'Schlächterklaue der Gefräßige', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Bloodthirsty Worg 24475
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+31);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+31, '0', '0', '0', '0', '0', '22088', '0', '0', '0', 'Bloodthirsty Worg', '', '', '0', '80', '80', '2', '189', '189', '0', '1.2', '1.0', '1.0', '0', '5', '5', '0', '298', '1.0', '2000', '0', '1', '32768', '8', '1', '0', '0', '0', '0', '206.0', '302.0', '43', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13468', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+31);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+31, '', '', 'Blutdurstiger Worg', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Wooly Rhino Calf 25488
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+32);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+32, '0', '0', '0', '0', '0', '26296', '0', '0', '0', 'Wooly Rhino Calf', '', '', '0', '80', '80', '1', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '288', '1.0', '3000', '0', '1', '32768', '8', '43', '0', '0', '0', '0', '186.0', '276.0', '39', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+32);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+32, '', '', 'Wollhornkalb', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ice Heart Jormungar Spawn 26359
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+33);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+33, '0', '0', '0', '0', '0', '24862', '0', '0', '0', 'Ice Heart Jormungar Spawn', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '314', '1.0', '2000', '0', '1', '32768', '8', '42', '0', '0', '0', '0', '270.0', '401.0', '53', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '0.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+33);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+33, '', '', 'Eiskernjormungarbrut', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ice Serpent 26446
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+34);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+34, '0', '0', '0', '0', '0', '16901', '0', '0', '0', 'Ice Serpent', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '302', '1.0', '2000', '0', '2', '0', '8', '27', '0', '0', '0', '0', '276.0', '411.0', '44', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11586', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '35798', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+34);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+34, '', '', 'Eisschlange', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Darkweb Recluse 26625
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+35);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+35, '31336', '0', '0', '0', '0', '16462', '0', '0', '0', 'Darkweb Recluse', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.28571', '1.0', '1', '5', '5', '0', '354', '7.5', '2400', '0', '1', '64', '8', '3', '0', '0', '0', '0', '287.0', '426.0', '63', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13148', '0', '0', '0', '', '0', '3', '4.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+35);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+35, '', '', 'Dunkelnetzeinsiedler', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Hardknuckle Charger 28096
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+36);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+36, '0', '0', '0', '0', '0', '809', '0', '0', '0', 'Hardknuckle Charger', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '478', '1.0', '2000', '0', '1', '32768', '8', '9', '0', '0', '0', '0', '314.0', '466.0', '81', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '38642', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_rejek_first_blood', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+36);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+36, '', '', 'Hartknöchelstürmer', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Vargul Blighthound 29452
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+37);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+37, '0', '0', '0', '0', '0', '25785', '0', '0', '0', 'Vargul Blighthound', '', '', '0', '80', '80', '2', '189', '189', '0', '1.6', '1.42857', '1.0', '0', '5', '5', '0', '392', '1.0', '2000', '0', '1', '32768', '8', '1', '0', '0', '0', '0', '295.0', '438.0', '68', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '150', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+37);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+37, '', '', 'Pesthund der Vargul', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Ravenous Jormungar 30291
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+38);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+38, '0', '0', '0', '29605', '0', '26262', '0', '0', '0', 'Ravenous Jormungar', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '0.99206', '1.0', '0', '5', '5', '0', '642', '1.0', '2000', '0', '1', '0', '8', '42', '0', '0', '0', '0', '345.0', '509.0', '103', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '42927', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+38);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+38, '', '', 'Gefräßiger Jormungar', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Aotona 32481
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+39);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+39, '0', '0', '0', '0', '0', '27975', '0', '0', '0', 'Aotona', '', '', '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '24', '7.5', '2000', '0', '1', '0', '8', '26', '0', '0', '0', '0', '1.0', '1.0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+39);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+39, '', '', 'Aotona', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Loque'nahak 32517
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+40);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+40, '0', '0', '0', '0', '0', '28010', '0', '0', '0', 'Loque''nahak', 'Mate of Har''koa', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '432', '4.6', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '305.0', '452.0', '74', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+40);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+40, '', '', 'Loque''nahak', '', '', '', '', '', NULL, NULL, 'Gefährte der Har''koa', NULL, NULL, NULL, NULL, NULL);
-- Lake Snapper 33710
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+41);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+41, '0', '0', '0', '0', '0', '28819', '0', '0', '0', 'Lake Snapper', '', '', '0', '80', '80', '0', '189', '189', '0', '1.0', '1.14286', '1.0', '0', '5', '5', '0', '38', '1.0', '2000', '0', '1', '0', '8', '21', '0', '0', '0', '0', '7.0', '10.0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+41);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+41, '', '', 'Seeschnapper', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Gondria 33776
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+42);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+42, '0', '0', '0', '0', '0', '28871', '0', '0', '0', 'Gondria', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '478', '15.0', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '314.0', '466.0', '81', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+42);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+42, '', '', 'Gondria', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Skoll 35189
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+43);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+43, '0', '0', '0', '0', '0', '29673', '0', '0', '0', 'Skoll', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '642', '7.5', '1500', '0', '1', '0', '8', '46', '0', '0', '0', '0', '345.0', '509.0', '103', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+43);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+43, '', '', 'Skoll', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Arcturis 38453
DELETE FROM `creature_template` WHERE `entry` = (@CT_HUNTER_PET+44);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_HUNTER_PET+44, '0', '0', '0', '0', '0', '31094', '0', '0', '0', 'Arcturis', '', '', '0', '80', '80', '2', '189', '189', '0', '1.0', '1.14286', '1.0', '2', '5', '5', '0', '354', '7.5', '2000', '0', '1', '0', '8', '46', '0', '0', '0', '0', '287.0', '426.0', '63', '1', '65537', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '1.5', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_HUNTER_PET+44);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_HUNTER_PET+44, '', '', 'Arcturis', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+11;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+11) * 100) +0, @CT_HUNTER_PET+11, '0', '0', '100', '1', '6000', '6000', '10000', '10000', '11', '33781', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Razorfang Hatchling - Cast Ravage');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+42;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+42) * 100) +0, @CT_HUNTER_PET+42, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Gondria - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+9;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+9) * 100) +0, @CT_HUNTER_PET+9, '6', '0', '100', '2', '0', '0', '0', '0', '11', '6122', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', 'Vekniss Warrior - Cast on Death Summon Vekniss Borer');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+37;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+37) * 100) +0, @CT_HUNTER_PET+37, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '50046', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Vargul Blighthound - Casts Gnaw Bone');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+18;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+18) * 100) +0, @CT_HUNTER_PET+18, '0', '0', '75', '1', '1000', '1000', '15000', '15000', '11', '35331', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blacksting - Cast Black Blood');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+39;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+39) * 100) +0, @CT_HUNTER_PET+39, '0', '0', '100', '1', '3000', '6000', '12000', '15000', '11', '49865', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Aotona - Cast Eye Peck');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+39;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+39) * 100) +1, @CT_HUNTER_PET+39, '0', '0', '100', '1', '9000', '13000', '10000', '15000', '11', '51144', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Aotona - Cast Wing Buffet');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+16;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+16) * 100) +0, @CT_HUNTER_PET+16, '6', '0', '75', '0', '0', '0', '0', '0', '11', '35336', '1', '7', '0', '0', '0', '0', '0', '0', '0', '0', 'Spore Bat - Cast Energizing Spores on Death');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+16;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+16) * 100) +1, @CT_HUNTER_PET+16, '0', '0', '100', '1', '1000', '1000', '15000', '15000', '11', '35394', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Spore Bat - Cast Spore Cloud');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+21;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+21) * 100) +0, @CT_HUNTER_PET+21, '0', '0', '75', '1', '1000', '1000', '10000', '10000', '11', '17008', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodthirsty Marshfang - Cast Drain Mana');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+0;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+0) * 100) +0, @CT_HUNTER_PET+0, '9', '0', '50', '0', '6', '15', '500', '1000', '11', '6268', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Young Goretusk - Cast Rushing Charge');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +0, @CT_HUNTER_PET+12, '11', '0', '100', '0', '0', '0', '0', '0', '11', '18950', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Invisibility and Stealth Detection');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +1, @CT_HUNTER_PET+12, '0', '0', '100', '7', '1000', '2300', '13100', '17400', '11', '30636', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Cast Furious Howl');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+12;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+12) * 100) +2, @CT_HUNTER_PET+12, '0', '0', '100', '7', '2300', '8600', '4600', '14300', '11', '30639', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Shattered Hand Warhound - Cast Carnivorous Bite');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +0, @CT_HUNTER_PET+24, '0', '0', '100', '1', '2000', '5000', '2500', '7500', '11', '15797', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Lightning Breath');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +1, @CT_HUNTER_PET+24, '0', '0', '100', '1', '7000', '10000', '7500', '12500', '11', '21971', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Poison Bolt');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+24;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+24) * 100) +2, @CT_HUNTER_PET+24, '0', '0', '100', '1', '12000', '15000', '12500', '17500', '11', '38905', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Nuramoc - Casts Prismatic Shield');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+44;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+44) * 100) +0, @CT_HUNTER_PET+44, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Arcturis - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+34;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+34) * 100) +0, @CT_HUNTER_PET+34, '9', '0', '100', '1', '0', '5', '5000', '7000', '11', '51878', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ice Serpent - Cast Ice Slash');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+28;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+28) * 100) +0, @CT_HUNTER_PET+28, '2', '0', '100', '0', '15', '0', '0', '0', '25', '0', '0', '0', '1', '-47', '0', '0', '0', '0', '0', '0', 'Lost Torranche - Flee at 15% HP');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+40;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+40) * 100) +0, @CT_HUNTER_PET+40, '0', '0', '100', '1', '0', '0', '12000', '15000', '11', '61184', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Loque''nahak - Cast Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+43;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+43) * 100) +0, @CT_HUNTER_PET+43, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '61184', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Skoll - Casts Pounce');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+1;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+1) * 100) +0, @CT_HUNTER_PET+1, '0', '0', '100', '1', '3200', '13400', '8300', '14100', '11', '7367', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Black Widow Hatchling - Cast Infected Bite');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+1;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+1) * 100) +1, @CT_HUNTER_PET+1, '0', '0', '100', '1', '9800', '19900', '6500', '26000', '11', '744', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Black Widow Hatchling - Cast Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+2;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+2) * 100) +0, @CT_HUNTER_PET+2, '0', '0', '100', '1', '3000', '6000', '30000', '35000', '11', '5413', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'c - Cast Noxious Catalyst');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+2;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+2) * 100) +1, @CT_HUNTER_PET+2, '0', '0', '100', '1', '8000', '10000', '8000', '12000', '11', '11918', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Corrupted Scorpid - Cast Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+33;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+33) * 100) +0, @CT_HUNTER_PET+33, '9', '0', '100', '1', '0', '5', '10000', '15000', '11', '43358', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ice Heart Jormungar Spawn - Cast Gut Rip');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+27;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+27) * 100) +0, @CT_HUNTER_PET+27, '0', '0', '100', '1', '100', '100', '30000', '55000', '11', '35570', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Felboar - Cast Charge');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +0, @CT_HUNTER_PET+29, '11', '0', '100', '0', '0', '0', '0', '0', '11', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Phasing Invisibility On Spawn');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +1, @CT_HUNTER_PET+29, '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Remove Phasing Invisibility On Aggro');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +2, @CT_HUNTER_PET+29, '0', '0', '100', '1', '3000', '6000', '4000', '7000', '11', '32739', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Venomous Bite');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +3, @CT_HUNTER_PET+29, '0', '0', '100', '1', '12000', '15000', '20000', '40000', '11', '32920', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Warp');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +4, @CT_HUNTER_PET+29, '0', '0', '100', '1', '2000', '5000', '7000', '15000', '11', '37417', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Cast Warp Charge');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+29;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+29) * 100) +5, @CT_HUNTER_PET+29, '7', '0', '100', '0', '0', '0', '0', '0', '11', '32942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackwind Warp Chaser - Recast Phasing Invisibility when evading');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+31;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+31) * 100) +0, @CT_HUNTER_PET+31, '0', '0', '100', '1', '2000', '10000', '10000', '17500', '11', '7367', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodthirsty Worg - Casts Infected Bite');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+19;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+19) * 100) +0, @CT_HUNTER_PET+19, '0', '0', '100', '7', '1400', '3000', '29800', '30200', '11', '34366', '4', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Blackfang Tarantula - Cast Ebon Poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+7;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+7) * 100) +0, @CT_HUNTER_PET+7, '0', '0', '100', '1', '4000', '7000', '16000', '19000', '11', '64140', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Monstrous Plaguebat - Cast Sonic Burst');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CT_HUNTER_PET+3;
INSERT INTO `creature_ai_scripts` (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(((@CT_HUNTER_PET+3) * 100) +0, @CT_HUNTER_PET+3, '0', '0', '100', '1', '1000', '4000', '6000', '12000', '11', '7901', '1', '32', '0', '0', '0', '0', '0', '0', '0', '0', 'Corrupted Dreadmaw Crocolisk - Cast Decayed Agility');

SET @PHASEMASK = 2;
-- Spawnen nach Düsterbruch, Das Konservatorium
DELETE FROM `creature` WHERE `id` BETWEEN @CT_HUNTER_PET AND (@CT_HUNTER_PET+45);
DELETE FROM `creature` WHERE `guid` BETWEEN @CREA_HUNTER_PET AND (@CREA_HUNTER_PET+60);
-- Young Goretusk
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`,
 `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`,
 `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES (@CREA_HUNTER_PET+0,@CT_HUNTER_PET+0,'429','1',@PHASEMASK,
'0','0','-35.8506','-309.025','-53.2882','5.16657','300','0',
'0','247','0','0','0','0','0');
-- Black Widow Hatchling 930
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+ 1,@CT_HUNTER_PET+1,'429','1',@PHASEMASK,'0','0','-3.18622','-233.369','-53.8879','1.6811','300','0','0','664','0','0','0','0','0');
-- Corrupted Scorpid 3226
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+ 2,@CT_HUNTER_PET+2,'429','1',@PHASEMASK,'0','0','33.3731','-314.912','-52.0737','2.28652','300','0','0','198','0','0','0','0','0');
-- Corrupted Dreadmaw Crocolisk 3231
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 3,@CT_HUNTER_PET+3,'429','1',@PHASEMASK,'0','0','-11.1443','-319.635','-50.6709','6.20722','300','0','0','222','0','0','0','0','0');
-- Savannah Highmane 3243
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 4,@CT_HUNTER_PET+4,'429','1',@PHASEMASK,'0','0','-82.5652','-258.503','-57.1526','5.51695','300','0','0','273','0','0','0','0','0');
-- Ashenvale Bear 3809
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 5,@CT_HUNTER_PET+5,'429','1',@PHASEMASK,'0','0','-11.2959','-253.086','-55.9866','4.20615','300','0','0','662','0','0','0','0','0');
-- Bonepaw Hyena 4688
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 6,@CT_HUNTER_PET+6,'429','1',@PHASEMASK,'0','0','-91.718','-245.827','-56.4213','5.35201','300','0','0','488','0','0','0','0','0');
-- Monstrous Plaguebat 8602
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 7,@CT_HUNTER_PET+7,'429','1',@PHASEMASK,'0','0','-3.37166','-221.841','-53.9279','4.48497','300','0','0','3876','0','0','0','0','0');
-- Core Hound 11671
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 8,@CT_HUNTER_PET+8,'429','1',@PHASEMASK,'0','0','-53.1069','-328.679','-51.846','3.12845','300','0','0','47160','0','0','0','0','0');
-- Vekniss Warrior 15230
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+ 9,@CT_HUNTER_PET+9,'429','1',@PHASEMASK,'0','0','110.224','-332.761','-54.9454','1.18303','300','0','0','50304','0','0','0','0','0');
-- Feral Dragonhawk Hatchling 15649
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+10,@CT_HUNTER_PET+10,'429','1',@PHASEMASK,'0','0','-73.1951','-222.676','-57.0928','5.56171','300','0','0','115','126','0','0','0','0');
-- Razorfang Hatchling 16932
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+11,@CT_HUNTER_PET+11,'429','1',@PHASEMASK,'0','0','65.0592','-331','-52.4179','1.30478','300','0','0','4979','0','0','0','0','0');
-- Shattered Hand Warhound 17280
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+12,@CT_HUNTER_PET+12,'429','1',@PHASEMASK,'0','0','15.6406','-266.737','-52.4864','0.59332','300','0','0','4142','0','0','0','0','0');
-- Blue Flutterer 17349
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+13,@CT_HUNTER_PET+12,'429','1',@PHASEMASK,'0','0','-57.4696','-243.558','-57.8698','4.84232','300','0','0','198','0','0','0','0','0');
-- The Kurken 17447
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+14,@CT_HUNTER_PET+14,'429','1',@PHASEMASK,'0','0','-57.5751','-344.089','-54.4313','2.44987','300','0','0','247','0','0','0','0','0');
-- Zarakh 17683
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+15,@CT_HUNTER_PET+15,'429','1',@PHASEMASK,'0','0','-119.593','-243.222','-55.4527','5.68581','300','0','0','449','0','0','0','0','0');
-- Zarakh 17683 XX
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+16,@CT_HUNTER_PET+15,'429','1',@PHASEMASK,'0','0','-66.2943','-318.102','-54.2059','2.1742','300','0','0','449','0','0','0','0','0');
-- Sporebat 18128
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+17,@CT_HUNTER_PET+16,'429','1',@PHASEMASK,'0','0','-73.8813','-345.582','-56.024','2.39097','300','0','0','5158','0','0','0','0','0');
-- Crusty 18241
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+18,@CT_HUNTER_PET+17,'429','1',@PHASEMASK,'0','0','-30.6863','-323.767','-50.8561','2.05247','300','0','0','1006','0','0','0','0','0');
-- Blacksting 18283
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+19,@CT_HUNTER_PET+18,'429','1',@PHASEMASK,'0','0','-48.4916','-236.614','-57.9216','4.9994','300','0','0','5341','0','0','0','0','0');
-- Blackfang Tarantula 18983
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+20,@CT_HUNTER_PET+19,'429','1',@PHASEMASK,'0','0','7.29852','-252.055','-51.7716','3.29509','300','0','0','9813','0','0','0','0','0');
-- Coilskar Cobra 19784
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+21,@CT_HUNTER_PET+20,'429','1',@PHASEMASK,'0','0','-129.878','-279.712','-54.9394','5.77219','300','0','0','6542','0','0','0','0','0');
-- Bloodthirsty Marshfang 20196
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+22,@CT_HUNTER_PET+21,'429','1',@PHASEMASK,'0','0','-107.982','-263.239','-57.0779','0.239065','300','0','0','4274','1284','0','0','0','0');
-- Bladespire Ravager 20729
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+23,@CT_HUNTER_PET+22,'429','1',@PHASEMASK,'0','0','-101.738','-289.562','-57.972','4.18176','300','0','0','18978','0','0','0','0','0');
-- Tyrantus 20931
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+24,@CT_HUNTER_PET+23,'429','1',@PHASEMASK,'0','0','-14.2909','-306.428','-52.506','6.27163','300','0','0','9335','0','0','0','0','0');
-- Nuramoc 20932
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+25,@CT_HUNTER_PET+24,'429','1',@PHASEMASK,'0','0','18.1754','-335.155','-52.3309','6.07214','300','0','0','13972','0','0','0','0','0');
-- Dire Raven 21042
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+26,@CT_HUNTER_PET+25,'429','1',@PHASEMASK,'0','0','-69.5069','-241.954','-57.2405','4.95857','300','0','0','6542','0','0','0','0','0');
-- Spawn of Uvuros 21108
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+27,@CT_HUNTER_PET+26,'429','1',@PHASEMASK,'0','0','-57.6722','-361.206','-55.4931','2.27316','300','0','0','6761','0','0','0','0','0');
-- Felboar 21878
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+28,@CT_HUNTER_PET+27,'429','1',@PHASEMASK,'0','0','-64.2143','-298.558','-57.1919','1.88211','300','0','0','6542','0','0','0','0','0');
-- Lost Torranche 22807
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+29,@CT_HUNTER_PET+28,'429','1',@PHASEMASK,'0','0','-39.5936','-245.963','-58.7358','2.92595','300','0','0','6986','0','0','0','0','0');
-- Blackwind Warp Chaser 23219
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+30,@CT_HUNTER_PET+29,'429','1',@PHASEMASK,'0','0','13.5101','-233.499','-51.4345','3.77811','300','0','0','6761','0','0','0','0','0');
-- Goreclaw the Ravenous 23873
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+31,@CT_HUNTER_PET+30,'429','1',@PHASEMASK,'0','0','-82.1072','-233.048','-56.5128','5.4439','300','0','0','2189','0','0','0','0','0');
-- Bloodthirsty Worg 24475
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+32,@CT_HUNTER_PET+31,'429','1',@PHASEMASK,'0','0','-16.1883','-325.56','-50.5448','3.01458','300','0','0','6986','0','0','0','0','0');
-- Wooly Rhino Calf 25488
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+33,@CT_HUNTER_PET+32,'429','1',@PHASEMASK,'0','0','63.5754','-306.44','-54.3562','0.739284','300','0','0','6326','0','0','0','0','0');
-- Ice Heart Jormungar Spawn 26359
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+34,@CT_HUNTER_PET+33,'429','1',@PHASEMASK,'0','0','46.2449','-302.876','-53.4588','1.98021','300','0','0','4805','0','0','0','0','0');
-- Ice Serpent 26446
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+35,@CT_HUNTER_PET+34,'429','1',@PHASEMASK,'0','0','-84.0209','-353.931','-56.716','3.21956','300','0','0','9610','3309','0','0','0','0');
-- Darkweb Recluse 26625
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+36,@CT_HUNTER_PET+35,'429','1',@PHASEMASK,'0','0','-123.077','-255.948','-54.7062','5.9175','300','0','0','41128','0','0','0','0','0');
-- Hardknuckle Charger 28096
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+37,@CT_HUNTER_PET+36,'429','1',@PHASEMASK,'0','0','16.8375','-312.644','-51.2932','5.78469','300','0','0','11379','0','0','0','0','0');
-- Vargul Blighthound 29452
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+38,@CT_HUNTER_PET+37,'429','1',@PHASEMASK,'0','0','-18.1521','-247.108','-56.8827','5.55311','300','0','0','10635','0','0','0','0','0');
-- Ravenous Jormungar 30291
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+39,@CT_HUNTER_PET+38,'429','1',@PHASEMASK,'0','0','-2.10712','-297.668','-52.9171','1.37468','300','0','0','12175','0','0','0','0','0');
-- Aotona 32481
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+40,@CT_HUNTER_PET+39,'429','1',@PHASEMASK,'0','0','-9.96008','-207.127','-53.4207','4.70488','300','0','0','6978','0','0','0','0','0');
-- Loque'nahak 32517
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+41,@CT_HUNTER_PET+40,'429','1',@PHASEMASK,'0','0','-110.416','-299.639','-57.4157','4.75118','300','0','0','16502','0','0','0','0','0');
-- Lake Snapper 33710
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES(@CREA_HUNTER_PET+42,@CT_HUNTER_PET+41,'429','1',@PHASEMASK,'0','0','13.7471','-302.835','-52.1134','3.39708','300','0','0','156','0','0','0','0','0');
-- Gondria 33776
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+43,@CT_HUNTER_PET+42,'429','1',@PHASEMASK,'0','0','27.2706','-299.631','-52.4969','1.63386','300','0','0','17069','0','0','0','0','0');
-- Skoll 35189
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+44,@CT_HUNTER_PET+43,'429','1',@PHASEMASK,'0','0','-64.6566','-252.867','-57.8737','4.0373','300','0','0','18900','0','0','0','0','0');
-- Arcturis 38453
INSERT  INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+45,@CT_HUNTER_PET+44,'429','1',@PHASEMASK,'0','0','-35.3267','-294.272','-55.17','6.27005','300','0','0','15423','0','0','0','0','0');
--
-- Port back
--INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES(@CREA_HUNTER_PET+46,'900004','429','1','1','0','0','51.7399','-257.364','-53.0248','5.09432','300','0','0','100800','88140','0','0','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(@CREA_HUNTER_PET+47,@CT_HUNTER_FOOD_VENDOR,'429','1',@PHASEMASK,'0','897','47.3075','-258.475','-52.9096','5.00714','300','0','0','10080','8814','0','0','0','0');
-- Stablemaster
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+48,@CT_HUNTER_STABLE_MASTER,'429','1',@PHASEMASK,'0','0','49.9412','-257.581','-52.9192','5.10217','300','0','0','10635','0','0','0','0','0');
-- Hunter Trainer
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,  `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+49,(@CT_CLASS_TRAINER+8),'429','1',@PHASEMASK,'0','0','42.1533','-261.419','-52.9894','5.21213','300','0','0','8982','3155','0','0','0','0');
-- Tierausbilder
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,  `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
 VALUES(@CREA_HUNTER_PET+50,@CT_HUNTER_PET_TRAINER,'429','1',@PHASEMASK,'0','191','44.5411','-259.957','-52.949','5.2946','300','0','0','1753','0','0','0','0','0');
-- 
-- Hunter Pets: ENDE
-- 

-- Death Knight Trainer and Runeforge 33251
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+0, '0', '0', '0', '0', '0', '28516', '0', '0', '0', 'Death Knight Trainer and Runeforge', @LOL_TEAM, NULL, '0', '1', '1', '0', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.0', '1.14286', '1.0', '0', '2.0', '2.0', '0', '24', '1.0', '2000', '0', '1', '0', '8', '0', '0', '0', '6', '0', '1.0', '1.0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+0, '', '', 'Todesritterlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+0, '-200019', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+0);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES
-- (@CT_CLASS_TRAINER+0, '37301', '501'), -- Deprecated Test Glyph
(@CT_CLASS_TRAINER+0, '43533', '0'), -- Glyph of Anti-Magic Shell
(@CT_CLASS_TRAINER+0, '43826', '0'), -- Glyph of Blood Strike
(@CT_CLASS_TRAINER+0, '43535', '0'), -- Glyph of Blood Tap
(@CT_CLASS_TRAINER+0, '43536', '0'), -- Glyph of Bone Shield
(@CT_CLASS_TRAINER+0, '43537', '0'), -- Glyph of Chains of Ice
(@CT_CLASS_TRAINER+0, '43671', '0'), -- Glyph of Corpse Explosion
(@CT_CLASS_TRAINER+0, '45799', '0'), -- Glyph of Dancing Rune Weapon
(@CT_CLASS_TRAINER+0, '43538', '0'), -- Glyph of Dark Command
(@CT_CLASS_TRAINER+0, '45804', '0'), -- Glyph of Dark Death
(@CT_CLASS_TRAINER+0, '43542', '0'), -- Glyph of Death and Decay
(@CT_CLASS_TRAINER+0, '43541', '0'), -- Glyph of Death Grip
(@CT_CLASS_TRAINER+0, '43827', '0'), -- Glyph of Death Strike
(@CT_CLASS_TRAINER+0, '43539', '0'), -- Glyph of Death's Embrace
(@CT_CLASS_TRAINER+0, '45805', '0'), -- Glyph of Disease
(@CT_CLASS_TRAINER+0, '43543', '0'), -- Glyph of Frost Strike
(@CT_CLASS_TRAINER+0, '43534', '0'), -- Glyph of Heart Strike
(@CT_CLASS_TRAINER+0, '43544', '0'), -- Glyph of Horn of Winter
(@CT_CLASS_TRAINER+0, '45806', '0'), -- Glyph of Howling Blast
(@CT_CLASS_TRAINER+0, '45800', '0'), -- Glyph of Hungering Cold
(@CT_CLASS_TRAINER+0, '43545', '0'), -- Glyph of Icebound Fortitude
(@CT_CLASS_TRAINER+0, '43546', '0'), -- Glyph of Icy Touch
(@CT_CLASS_TRAINER+0, '43547', '0'), -- Glyph of Obliterate
(@CT_CLASS_TRAINER+0, '43672', '0'), -- Glyph of Pestilence
(@CT_CLASS_TRAINER+0, '43548', '0'), -- Glyph of Plague Strike
(@CT_CLASS_TRAINER+0, '43673', '0'), -- Glyph of Raise Dead
(@CT_CLASS_TRAINER+0, '44432', '0'), -- Glyph of Raise Dead
(@CT_CLASS_TRAINER+0, '43550', '0'), -- Glyph of Rune Strike
(@CT_CLASS_TRAINER+0, '43825', '0'), -- Glyph of Rune Tap
(@CT_CLASS_TRAINER+0, '43551', '0'), -- Glyph of Scourge Strike
(@CT_CLASS_TRAINER+0, '43552', '0'), -- Glyph of Strangulate
(@CT_CLASS_TRAINER+0, '43549', '0'), -- Glyph of the Ghoul
(@CT_CLASS_TRAINER+0, '43553', '0'), -- Glyph of Unbreakable Armor
(@CT_CLASS_TRAINER+0, '45803', '0'), -- Glyph of Unholy Blight
(@CT_CLASS_TRAINER+0, '43554', '501'); -- Glyph of Vampiric Blood

DELETE FROM `gameobject` WHERE `id` = 201742 AND `map` IN (34, 389);
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
('201742','34', '1','2','115.216', '5.077',  '-25.6062','4.76', '0','0','0.0123592','0.999924','300','0','1'), -- Stockade - visual
('190557','34', '1','2','115.216', '5.077',  '-25.6062','4.76', '0','0','0.0123592','0.999924','300','0','1'), -- Stockade, real forge
('201742','389','1','2','-69.6914','-42.328','-17.092', '1.726','0','0','0.0237436','0.999718','300','0','1'), -- Ragefire Chasm
('190557','389','1','2','-69.6914','-42.328','-17.092', '1.726','0','0','0.0237436','0.999718','300','0','1'); -- Ragefire Chasm, real forge


-- Warrior Trainer 26332
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+1, '0', '0', '0', '0', '0', '24036', '0', '0', '0', 'Warrior Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '252.0', '357.0', '0', '304', '1.0', '2000', '0', '1', '768', '8', '0', '0', '0', '1', '0', '215.0', '320.0', '44', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+1, '', '', 'Kriegerlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+1, '-200002', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+1, '-200001', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+1, '8616', '0', '0', '0', '0');  -- Berserker
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+1);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+1, '43420', '0'), -- Glyph of Barbaric Insults
(@CT_CLASS_TRAINER+1, '43395', '0'), -- Glyph of Battle
(@CT_CLASS_TRAINER+1, '45790', '0'), -- Glyph of Bladestorm
(@CT_CLASS_TRAINER+1, '43425', '0'), -- Glyph of Blocking
(@CT_CLASS_TRAINER+1, '43396', '0'), -- Glyph of Bloodrage
(@CT_CLASS_TRAINER+1, '43412', '0'), -- Glyph of Bloodthirst
(@CT_CLASS_TRAINER+1, '43397', '0'), -- Glyph of Charge
(@CT_CLASS_TRAINER+1, '43414', '0'), -- Glyph of Cleaving
(@CT_CLASS_TRAINER+1, '49084', '0'), -- Glyph of Command
(@CT_CLASS_TRAINER+1, '43415', '0'), -- Glyph of Devastate
(@CT_CLASS_TRAINER+1, '43400', '0'), -- Glyph of Enduring Victory
(@CT_CLASS_TRAINER+1, '45794', '0'), -- Glyph of Enraged Regeneration
(@CT_CLASS_TRAINER+1, '43416', '0'), -- Glyph of Execution
(@CT_CLASS_TRAINER+1, '43417', '0'), -- Glyph of Hamstring
(@CT_CLASS_TRAINER+1, '43418', '0'), -- Glyph of Heroic Strike
(@CT_CLASS_TRAINER+1, '43419', '0'), -- Glyph of Intervene
(@CT_CLASS_TRAINER+1, '43426', '0'), -- Glyph of Last Stand
(@CT_CLASS_TRAINER+1, '43398', '0'), -- Glyph of Mocking Blow
(@CT_CLASS_TRAINER+1, '43421', '0'), -- Glyph of Mortal Strike
(@CT_CLASS_TRAINER+1, '43422', '0'), -- Glyph of Overpower
(@CT_CLASS_TRAINER+1, '43413', '0'), -- Glyph of Rapid Charge
(@CT_CLASS_TRAINER+1, '43423', '0'), -- Glyph of Rending
(@CT_CLASS_TRAINER+1, '43430', '0'), -- Glyph of Resonating Power
(@CT_CLASS_TRAINER+1, '43424', '0'), -- Glyph of Revenge
(@CT_CLASS_TRAINER+1, '45797', '0'), -- Glyph of Shield Wall
(@CT_CLASS_TRAINER+1, '45792', '0'), -- Glyph of Shockwave
(@CT_CLASS_TRAINER+1, '45795', '0'), -- Glyph of Spell Reflection
(@CT_CLASS_TRAINER+1, '43427', '0'), -- Glyph of Sunder Armor
(@CT_CLASS_TRAINER+1, '43428', '0'), -- Glyph of Sweeping Strikes
(@CT_CLASS_TRAINER+1, '43429', '0'), -- Glyph of Taunt
(@CT_CLASS_TRAINER+1, '43399', '0'), -- Glyph of Thunder Clap
(@CT_CLASS_TRAINER+1, '43431', '0'), -- Glyph of Victory Rush
(@CT_CLASS_TRAINER+1, '45793', '0'), -- Glyph of Vigilance
(@CT_CLASS_TRAINER+1, '43432', '501'); -- Glyph of Whirlwind
-- Warlock Trainer 26331
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+2, '0', '0', '0', '0', '0', '24035', '0', '0', '0', 'Warlock Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '9', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+2, '', '', 'Hexenmeisterlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+2, '-200010', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+2, '-200009', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+2);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+2, '45781', '0'), -- Glyph of Chaos Bolt
(@CT_CLASS_TRAINER+2, '42454', '0'), -- Glyph of Conflagrate
(@CT_CLASS_TRAINER+2, '42455', '0'), -- Glyph of Corruption
(@CT_CLASS_TRAINER+2, '42456', '0'), -- Glyph of Curse of Agony
(@CT_CLASS_TRAINER+2, '43392', '0'), -- Glyph of Curse of Exhaustion
(@CT_CLASS_TRAINER+2, '42457', '0'), -- Glyph of Death Coil
(@CT_CLASS_TRAINER+2, '45782', '0'), -- Glyph of Demonic Circle
(@CT_CLASS_TRAINER+2, '43390', '0'), -- Glyph of Drain Soul
(@CT_CLASS_TRAINER+2, '43393', '0'), -- Glyph of Enslave Demon
(@CT_CLASS_TRAINER+2, '42458', '0'), -- Glyph of Fear
(@CT_CLASS_TRAINER+2, '42459', '0'), -- Glyph of Felguard
(@CT_CLASS_TRAINER+2, '42460', '0'), -- Glyph of Felhunter
(@CT_CLASS_TRAINER+2, '45779', '0'), -- Glyph of Haunt
(@CT_CLASS_TRAINER+2, '42461', '0'), -- Glyph of Health Funnel
(@CT_CLASS_TRAINER+2, '42462', '0'), -- Glyph of Healthstone
(@CT_CLASS_TRAINER+2, '42463', '0'), -- Glyph of Howl of Terror
(@CT_CLASS_TRAINER+2, '42464', '0'), -- Glyph of Immolate
(@CT_CLASS_TRAINER+2, '42465', '0'), -- Glyph of Imp
(@CT_CLASS_TRAINER+2, '42453', '0'), -- Glyph of Incinerate
(@CT_CLASS_TRAINER+2, '43391', '0'), -- Glyph of Kilrogg
(@CT_CLASS_TRAINER+2, '45785', '0'), -- Glyph of Life Tap
(@CT_CLASS_TRAINER+2, '45780', '0'), -- Glyph of Metamorphosis
(@CT_CLASS_TRAINER+2, '50077', '0'), -- Glyph of Quick Decay
(@CT_CLASS_TRAINER+2, '42466', '0'), -- Glyph of Searing Pain
(@CT_CLASS_TRAINER+2, '42467', '0'), -- Glyph of Shadow Bolt
(@CT_CLASS_TRAINER+2, '42468', '0'), -- Glyph of Shadowburn
(@CT_CLASS_TRAINER+2, '45783', '0'), -- Glyph of Shadowflame
(@CT_CLASS_TRAINER+2, '42469', '0'), -- Glyph of Siphon Life
(@CT_CLASS_TRAINER+2, '45789', '0'), -- Glyph of Soul Link
(@CT_CLASS_TRAINER+2, '43394', '0'), -- Glyph of Souls
(@CT_CLASS_TRAINER+2, '42470', '0'), -- Glyph of Soulstone
(@CT_CLASS_TRAINER+2, '42471', '0'), -- Glyph of Succubus
(@CT_CLASS_TRAINER+2, '43389', '0'), -- Glyph of Unending Breath
(@CT_CLASS_TRAINER+2, '42472', '0'), -- Glyph of Unstable Affliction
(@CT_CLASS_TRAINER+2, '42473', '501'); -- Glyph of Voidwalker
-- Shaman Trainer 26330
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName,
gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H,
npcflag,
speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+3, '0', '0', '0', '0', '0', '24034', '0', '0', '0', 'Shaman Trainer', @LOL_TEAM, NULL,
'0', '70', '70', '2', '35', '35',
@NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,
'1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '7', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+3, '', '', 'Schamanenlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+3, '-200018', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+3, '-200017', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+3);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+3, '43381', '0'), -- Glyph of Astral Recall
(@CT_CLASS_TRAINER+3, '41517', '0'), -- Glyph of Chain Heal
(@CT_CLASS_TRAINER+3, '41518', '0'), -- Glyph of Chain Lightning
(@CT_CLASS_TRAINER+3, '45775', '0'), -- Glyph of Earth Shield
(@CT_CLASS_TRAINER+3, '41527', '0'), -- Glyph of Earthliving Weapon
(@CT_CLASS_TRAINER+3, '41552', '0'), -- Glyph of Elemental Mastery
(@CT_CLASS_TRAINER+3, '45771', '0'), -- Glyph of Feral Spirit
(@CT_CLASS_TRAINER+3, '41529', '0'), -- Glyph of Fire Elemental Totem
(@CT_CLASS_TRAINER+3, '41530', '0'), -- Glyph of Fire Nova
(@CT_CLASS_TRAINER+3, '41531', '0'), -- Glyph of Flame Shock
(@CT_CLASS_TRAINER+3, '41532', '0'), -- Glyph of Flametongue Weapon
(@CT_CLASS_TRAINER+3, '41547', '0'), -- Glyph of Frost Shock
(@CT_CLASS_TRAINER+3, '43725', '0'), -- Glyph of Ghost Wolf
(@CT_CLASS_TRAINER+3, '41533', '0'), -- Glyph of Healing Stream Totem
(@CT_CLASS_TRAINER+3, '41534', '0'), -- Glyph of Healing Wave
(@CT_CLASS_TRAINER+3, '45777', '0'), -- Glyph of Hex
(@CT_CLASS_TRAINER+3, '41524', '0'), -- Glyph of Lava
(@CT_CLASS_TRAINER+3, '41540', '0'), -- Glyph of Lava Lash
(@CT_CLASS_TRAINER+3, '41535', '0'), -- Glyph of Lesser Healing Wave
(@CT_CLASS_TRAINER+3, '41536', '0'), -- Glyph of Lightning Bolt
(@CT_CLASS_TRAINER+3, '41537', '0'), -- Glyph of Lightning Shield
(@CT_CLASS_TRAINER+3, '41538', '0'), -- Glyph of Mana Tide Totem
(@CT_CLASS_TRAINER+3, '43385', '0'), -- Glyph of Renewed Life
(@CT_CLASS_TRAINER+3, '45772', '0'), -- Glyph of Riptide
(@CT_CLASS_TRAINER+3, '41526', '0'), -- Glyph of Shocking
(@CT_CLASS_TRAINER+3, '45778', '0'), -- Glyph of Stoneclaw Totem
(@CT_CLASS_TRAINER+3, '41539', '0'), -- Glyph of Stormstrike
(@CT_CLASS_TRAINER+3, '45770', '0'), -- Glyph of Thunder
(@CT_CLASS_TRAINER+3, '44923', '0'), -- Glyph of Thunderstorm
(@CT_CLASS_TRAINER+3, '45776', '0'), -- Glyph of Totem of Wrath
(@CT_CLASS_TRAINER+3, '43344', '0'), -- Glyph of Water Breathing
(@CT_CLASS_TRAINER+3, '41541', '0'), -- Glyph of Water Mastery
(@CT_CLASS_TRAINER+3, '43386', '0'), -- Glyph of Water Shield
(@CT_CLASS_TRAINER+3, '43388', '0'), -- Glyph of Water Walking
(@CT_CLASS_TRAINER+3, '41542', '501'); -- Glyph of Windfury Weapon
-- Rogue Trainer 26329
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+4, '0', '0', '0', '0', '0', '23777', '0', '0', '0', 'Rogue Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '252.0', '357.0', '0', '304', '1.0', '2000', '0', '1', '768', '8', '0', '0', '0', '4', '0', '215.0', '320.0', '44', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+4, '', '', 'Schurkenlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+4, '-200016', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+4, '-200015', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+4);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+4, '42954', '0'), -- Glyph of Adrenaline Rush
(@CT_CLASS_TRAINER+4, '42955', '0'), -- Glyph of Ambush
(@CT_CLASS_TRAINER+4, '42956', '0'), -- Glyph of Backstab
(@CT_CLASS_TRAINER+4, '42957', '0'), -- Glyph of Blade Flurry
(@CT_CLASS_TRAINER+4, '43379', '0'), -- Glyph of Blurred Speed
(@CT_CLASS_TRAINER+4, '45769', '0'), -- Glyph of Cloak of Shadows
(@CT_CLASS_TRAINER+4, '42958', '0'), -- Glyph of Crippling Poison
(@CT_CLASS_TRAINER+4, '42959', '0'), -- Glyph of Deadly Throw
(@CT_CLASS_TRAINER+4, '43376', '0'), -- Glyph of Distract
(@CT_CLASS_TRAINER+4, '45908', '0'), -- Glyph of Envenom
(@CT_CLASS_TRAINER+4, '42960', '0'), -- Glyph of Evasion
(@CT_CLASS_TRAINER+4, '42961', '0'), -- Glyph of Eviscerate
(@CT_CLASS_TRAINER+4, '42962', '0'), -- Glyph of Expose Armor
(@CT_CLASS_TRAINER+4, '45766', '0'), -- Glyph of Fan of Knives
(@CT_CLASS_TRAINER+4, '42963', '0'), -- Glyph of Feint
(@CT_CLASS_TRAINER+4, '42964', '0'), -- Glyph of Garrote
(@CT_CLASS_TRAINER+4, '42965', '0'), -- Glyph of Ghostly Strike
(@CT_CLASS_TRAINER+4, '42966', '0'), -- Glyph of Gouge
(@CT_CLASS_TRAINER+4, '42967', '0'), -- Glyph of Hemorrhage
(@CT_CLASS_TRAINER+4, '45761', '0'), -- Glyph of Hunger for Blood
(@CT_CLASS_TRAINER+4, '45762', '0'), -- Glyph of Killing Spree
(@CT_CLASS_TRAINER+4, '45768', '0'), -- Glyph of Mutilate
(@CT_CLASS_TRAINER+4, '43377', '0'), -- Glyph of Pick Lock
(@CT_CLASS_TRAINER+4, '43343', '0'), -- Glyph of Pick Pocket
(@CT_CLASS_TRAINER+4, '42968', '0'), -- Glyph of Preparation
(@CT_CLASS_TRAINER+4, '42969', '0'), -- Glyph of Rupture
(@CT_CLASS_TRAINER+4, '43378', '0'), -- Glyph of Safe Fall
(@CT_CLASS_TRAINER+4, '42970', '0'), -- Glyph of Sap
(@CT_CLASS_TRAINER+4, '45764', '0'), -- Glyph of Shadow Dance
(@CT_CLASS_TRAINER+4, '42972', '0'), -- Glyph of Sinister Strike
(@CT_CLASS_TRAINER+4, '42973', '0'), -- Glyph of Slice and Dice
(@CT_CLASS_TRAINER+4, '42974', '0'), -- Glyph of Sprint
(@CT_CLASS_TRAINER+4, '45767', '0'), -- Glyph of Tricks of the Trade
(@CT_CLASS_TRAINER+4, '43380', '0'), -- Glyph of Vanish
(@CT_CLASS_TRAINER+4, '42971', '501'); -- Glyph of Vigor
-- Priest Trainer 26328
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+5, '0', '0', '0', '0', '0', '24033', '0', '0', '0', 'Priest Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '5', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+5, '', '', 'Priesterlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+5, '-200012', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+5, '-200011', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+5);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+5, '42396', '0'), -- Glyph of Circle of Healing
(@CT_CLASS_TRAINER+5, '42397', '0'), -- Glyph of Dispel Magic
(@CT_CLASS_TRAINER+5, '45753', '0'), -- Glyph of Dispersion
(@CT_CLASS_TRAINER+5, '42398', '0'), -- Glyph of Fade
(@CT_CLASS_TRAINER+5, '43342', '0'), -- Glyph of Fading
(@CT_CLASS_TRAINER+5, '42399', '0'), -- Glyph of Fear Ward
(@CT_CLASS_TRAINER+5, '42400', '0'), -- Glyph of Flash Heal
(@CT_CLASS_TRAINER+5, '43371', '0'), -- Glyph of Fortitude
(@CT_CLASS_TRAINER+5, '45755', '0'), -- Glyph of Guardian Spirit
(@CT_CLASS_TRAINER+5, '42401', '0'), -- Glyph of Holy Nova
(@CT_CLASS_TRAINER+5, '45758', '0'), -- Glyph of Hymn of Hope
(@CT_CLASS_TRAINER+5, '42402', '0'), -- Glyph of Inner Fire
(@CT_CLASS_TRAINER+5, '43370', '0'), -- Glyph of Levitate
(@CT_CLASS_TRAINER+5, '42403', '0'), -- Glyph of Lightwell
(@CT_CLASS_TRAINER+5, '42404', '0'), -- Glyph of Mass Dispel
(@CT_CLASS_TRAINER+5, '42405', '0'), -- Glyph of Mind Control
(@CT_CLASS_TRAINER+5, '42415', '0'), -- Glyph of Mind Flay
(@CT_CLASS_TRAINER+5, '45757', '0'), -- Glyph of Mind Sear
(@CT_CLASS_TRAINER+5, '45760', '0'), -- Glyph of Pain Suppression
(@CT_CLASS_TRAINER+5, '45756', '0'), -- Glyph of Penance
(@CT_CLASS_TRAINER+5, '42408', '0'), -- Glyph of Power Word: Shield
(@CT_CLASS_TRAINER+5, '42409', '0'), -- Glyph of Prayer of Healing
(@CT_CLASS_TRAINER+5, '42410', '0'), -- Glyph of Psychic Scream
(@CT_CLASS_TRAINER+5, '42411', '0'), -- Glyph of Renew
(@CT_CLASS_TRAINER+5, '42412', '0'), -- Glyph of Scourge Imprisonment
(@CT_CLASS_TRAINER+5, '43373', '0'), -- Glyph of Shackle Undead
(@CT_CLASS_TRAINER+5, '42407', '0'), -- Glyph of Shadow
(@CT_CLASS_TRAINER+5, '43372', '0'), -- Glyph of Shadow Protection
(@CT_CLASS_TRAINER+5, '42414', '0'), -- Glyph of Shadow Word: Death
(@CT_CLASS_TRAINER+5, '42406', '0'), -- Glyph of Shadow Word: Pain
(@CT_CLASS_TRAINER+5, '43374', '0'), -- Glyph of Shadowfiend
(@CT_CLASS_TRAINER+5, '42416', '0'), -- Glyph of Smite
(@CT_CLASS_TRAINER+5, '42417', '501'); -- Glyph of Spirit of Redemption
-- Paladin Trainer 26327
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+6, '0', '0', '0', '0', '0', '24032', '0', '0', '0', 'Paladin Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '2', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+6, '', '', 'Paladinlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+6, '-200004', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+6, '-200003', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+6);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES 
(@CT_CLASS_TRAINER+6, '41101', '0'), -- Glyph of Avenger's Shield
(@CT_CLASS_TRAINER+6, '41107', '0'), -- Glyph of Avenging Wrath
(@CT_CLASS_TRAINER+6, '45741', '0'), -- Glyph of Beacon of Light
(@CT_CLASS_TRAINER+6, '43365', '0'), -- Glyph of Blessing of Kings
(@CT_CLASS_TRAINER+6, '43340', '0'), -- Glyph of Blessing of Might
(@CT_CLASS_TRAINER+6, '43366', '0'), -- Glyph of Blessing of Wisdom
(@CT_CLASS_TRAINER+6, '41104', '0'), -- Glyph of Cleansing
(@CT_CLASS_TRAINER+6, '41099', '0'), -- Glyph of Consecration
(@CT_CLASS_TRAINER+6, '41098', '0'), -- Glyph of Crusader Strike
(@CT_CLASS_TRAINER+6, '45745', '0'), -- Glyph of Divine Plea
(@CT_CLASS_TRAINER+6, '45743', '0'), -- Glyph of Divine Storm
(@CT_CLASS_TRAINER+6, '41108', '0'), -- Glyph of Divinity
(@CT_CLASS_TRAINER+6, '41103', '0'), -- Glyph of Exorcism
(@CT_CLASS_TRAINER+6, '41105', '0'), -- Glyph of Flash of Light
(@CT_CLASS_TRAINER+6, '41095', '0'), -- Glyph of Hammer of Justice
(@CT_CLASS_TRAINER+6, '45742', '0'), -- Glyph of Hammer of the Righteous
(@CT_CLASS_TRAINER+6, '41097', '0'), -- Glyph of Hammer of Wrath
(@CT_CLASS_TRAINER+6, '41106', '0'), -- Glyph of Holy Light
(@CT_CLASS_TRAINER+6, '45746', '0'), -- Glyph of Holy Shock
(@CT_CLASS_TRAINER+6, '43867', '0'), -- Glyph of Holy Wrath
(@CT_CLASS_TRAINER+6, '41092', '0'), -- Glyph of Judgement
(@CT_CLASS_TRAINER+6, '43367', '0'), -- Glyph of Lay on Hands
(@CT_CLASS_TRAINER+6, '41100', '0'), -- Glyph of Righteous Defense
(@CT_CLASS_TRAINER+6, '45747', '0'), -- Glyph of Salvation
(@CT_CLASS_TRAINER+6, '41094', '0'), -- Glyph of Seal of Command
(@CT_CLASS_TRAINER+6, '41110', '0'), -- Glyph of Seal of Light
(@CT_CLASS_TRAINER+6, '43868', '0'), -- Glyph of Seal of Righteousness
(@CT_CLASS_TRAINER+6, '43869', '0'), -- Glyph of Seal of Vengeance
(@CT_CLASS_TRAINER+6, '41109', '0'), -- Glyph of Seal of Wisdom
(@CT_CLASS_TRAINER+6, '43368', '0'), -- Glyph of Sense Undead
(@CT_CLASS_TRAINER+6, '45744', '0'), -- Glyph of Shield of Righteousness
(@CT_CLASS_TRAINER+6, '41096', '0'), -- Glyph of Spiritual Attunement
(@CT_CLASS_TRAINER+6, '43369', '0'), -- Glyph of the Wise
(@CT_CLASS_TRAINER+6, '41102', '501'); -- Glyph of Turn Evil
-- Mage Trainer 26326
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+7, '0', '0', '0', '0', '0', '24031', '0', '0', '0', 'Mage Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '248.0', '363.0', '0', '135', '1.0', '2000', '0', '8', '768', '8', '0', '0', '0', '8', '0', '233.0', '347.0', '28', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+7, '', '', 'Magierlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+7, '-200008', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+7, '-200007', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+7);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+7, '45738', '0'), -- Glyph of Arcane Barrage
(@CT_CLASS_TRAINER+7, '44955', '0'), -- Glyph of Arcane Blast
(@CT_CLASS_TRAINER+7, '42734', '0'), -- Glyph of Arcane Explosion
(@CT_CLASS_TRAINER+7, '43339', '0'), -- Glyph of Arcane Intellect
(@CT_CLASS_TRAINER+7, '42735', '0'), -- Glyph of Arcane Missiles
(@CT_CLASS_TRAINER+7, '42736', '0'), -- Glyph of Arcane Power
(@CT_CLASS_TRAINER+7, '44920', '0'), -- Glyph of Blast Wave
(@CT_CLASS_TRAINER+7, '42737', '0'), -- Glyph of Blink
(@CT_CLASS_TRAINER+7, '45736', '0'), -- Glyph of Deep Freeze
(@CT_CLASS_TRAINER+7, '50045', '0'), -- Glyph of Eternal Water
(@CT_CLASS_TRAINER+7, '42738', '0'), -- Glyph of Evocation
(@CT_CLASS_TRAINER+7, '42740', '0'), -- Glyph of Fire Blast
(@CT_CLASS_TRAINER+7, '43357', '0'), -- Glyph of Fire Ward
(@CT_CLASS_TRAINER+7, '42739', '0'), -- Glyph of Fireball
(@CT_CLASS_TRAINER+7, '43359', '0'), -- Glyph of Frost Armor
(@CT_CLASS_TRAINER+7, '42741', '0'), -- Glyph of Frost Nova
(@CT_CLASS_TRAINER+7, '43360', '0'), -- Glyph of Frost Ward
(@CT_CLASS_TRAINER+7, '42742', '0'), -- Glyph of Frostbolt
(@CT_CLASS_TRAINER+7, '44684', '0'), -- Glyph of Frostfire
(@CT_CLASS_TRAINER+7, '42743', '0'), -- Glyph of Ice Armor
(@CT_CLASS_TRAINER+7, '45740', '0'), -- Glyph of Ice Barrier
(@CT_CLASS_TRAINER+7, '42744', '0'), -- Glyph of Ice Block
(@CT_CLASS_TRAINER+7, '42745', '0'), -- Glyph of Ice Lance
(@CT_CLASS_TRAINER+7, '42746', '0'), -- Glyph of Icy Veins
(@CT_CLASS_TRAINER+7, '42748', '0'), -- Glyph of Invisibility
(@CT_CLASS_TRAINER+7, '45737', '0'), -- Glyph of Living Bomb
(@CT_CLASS_TRAINER+7, '42749', '0'), -- Glyph of Mage Armor
(@CT_CLASS_TRAINER+7, '42750', '0'), -- Glyph of Mana Gem
(@CT_CLASS_TRAINER+7, '45739', '0'), -- Glyph of Mirror Image
(@CT_CLASS_TRAINER+7, '42751', '0'), -- Glyph of Molten Armor
(@CT_CLASS_TRAINER+7, '42752', '0'), -- Glyph of Polymorph
(@CT_CLASS_TRAINER+7, '42753', '0'), -- Glyph of Remove Curse
(@CT_CLASS_TRAINER+7, '42747', '0'), -- Glyph of Scorch
(@CT_CLASS_TRAINER+7, '43364', '0'), -- Glyph of Slow Fall
(@CT_CLASS_TRAINER+7, '43362', '0'), -- Glyph of the Bear Cub
(@CT_CLASS_TRAINER+7, '43361', '0'), -- Glyph of the Penguin
(@CT_CLASS_TRAINER+7, '42754', '501'); -- Glyph of Water Elemental
-- Hunter Trainer 26325
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+8, '0', '0', '0', '0', '0', '24030', '0', '0', '0', 'Hunter Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '3', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+8, '', '', 'Jägerlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+8, '-200014', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+8, '-200013', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+8);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES (@CT_CLASS_TRAINER+8, '42897', '0'), -- Glyph of Aimed Shot
(@CT_CLASS_TRAINER+8, '42898', '0'), -- Glyph of Arcane Shot
(@CT_CLASS_TRAINER+8, '42901', '0'), -- Glyph of Aspect of the Viper
(@CT_CLASS_TRAINER+8, '42902', '0'), -- Glyph of Bestial Wrath
(@CT_CLASS_TRAINER+8, '45625', '0'), -- Glyph of Chimera Shot
(@CT_CLASS_TRAINER+8, '42903', '0'), -- Glyph of Deterrence
(@CT_CLASS_TRAINER+8, '42904', '0'), -- Glyph of Disengage
(@CT_CLASS_TRAINER+8, '45731', '0'), -- Glyph of Explosive Shot
(@CT_CLASS_TRAINER+8, '45733', '0'), -- Glyph of Explosive Trap
(@CT_CLASS_TRAINER+8, '43351', '0'), -- Glyph of Feign Death
(@CT_CLASS_TRAINER+8, '42905', '0'), -- Glyph of Freezing Trap
(@CT_CLASS_TRAINER+8, '42906', '0'), -- Glyph of Frost Trap
(@CT_CLASS_TRAINER+8, '42907', '0'), -- Glyph of Hunter's Mark
(@CT_CLASS_TRAINER+8, '42908', '0'), -- Glyph of Immolation Trap
(@CT_CLASS_TRAINER+8, '45732', '0'), -- Glyph of Kill Shot
(@CT_CLASS_TRAINER+8, '43350', '0'), -- Glyph of Mend Pet
(@CT_CLASS_TRAINER+8, '42900', '0'), -- Glyph of Mending
(@CT_CLASS_TRAINER+8, '42910', '0'), -- Glyph of Multi-Shot
(@CT_CLASS_TRAINER+8, '43354', '0'), -- Glyph of Possessed Strength
(@CT_CLASS_TRAINER+8, '42911', '0'), -- Glyph of Rapid Fire
(@CT_CLASS_TRAINER+8, '45735', '0'), -- Glyph of Raptor Strike
(@CT_CLASS_TRAINER+8, '43338', '0'), -- Glyph of Revive Pet
(@CT_CLASS_TRAINER+8, '43356', '0'), -- Glyph of Scare Beast
(@CT_CLASS_TRAINER+8, '45734', '0'), -- Glyph of Scatter Shot
(@CT_CLASS_TRAINER+8, '42912', '0'), -- Glyph of Serpent Sting
(@CT_CLASS_TRAINER+8, '42913', '0'), -- Glyph of Snake Trap
(@CT_CLASS_TRAINER+8, '42914', '0'), -- Glyph of Steady Shot
(@CT_CLASS_TRAINER+8, '42899', '0'), -- Glyph of the Beast
(@CT_CLASS_TRAINER+8, '42909', '0'), -- Glyph of the Hawk
(@CT_CLASS_TRAINER+8, '43355', '0'), -- Glyph of the Pack
(@CT_CLASS_TRAINER+8, '42915', '0'), -- Glyph of Trueshot Aura
(@CT_CLASS_TRAINER+8, '42916', '0'), -- Glyph of Volley
(@CT_CLASS_TRAINER+8, '42917', '501'); -- Glyph of Wyvern Sting
-- Druid Trainer 26324
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+9, '0', '0', '0', '0', '0', '24029', '0', '0', '0', 'Druid Trainer', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '11', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+9, '', '', 'Druidenlehrer', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+9, '-200006', '0', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_CLASS_TRAINER+9, '-200005', '0', '0', '0', '0');
DELETE FROM `npc_vendor` WHERE `entry` = (@CT_CLASS_TRAINER+9);
INSERT INTO `npc_vendor` (entry, item, ExtendedCost)
VALUES 
-- (@CT_CLASS_TRAINER+9, '43336', '501'), -- Deprecated Glyph of the Black Bear
-- (@CT_CLASS_TRAINER+9, '40948', '501'), -- Deprecated Glyph of the Red Lynx
-- (@CT_CLASS_TRAINER+9, '40484', '501'), -- Deprecated Glyph of the White Bear
(@CT_CLASS_TRAINER+9, '43316', '0'), -- Glyph of Aquatic Form
(@CT_CLASS_TRAINER+9, '45623', '0'), -- Glyph of Barkskin
(@CT_CLASS_TRAINER+9, '45601', '0'), -- Glyph of Berserk
(@CT_CLASS_TRAINER+9, '43334', '0'), -- Glyph of Challenging Roar
(@CT_CLASS_TRAINER+9, '48720', '0'), -- Glyph of Claw
(@CT_CLASS_TRAINER+9, '43674', '0'), -- Glyph of Dash
(@CT_CLASS_TRAINER+9, '40924', '0'), -- Glyph of Entangling Roots
(@CT_CLASS_TRAINER+9, '44928', '0'), -- Glyph of Focus
(@CT_CLASS_TRAINER+9, '40896', '0'), -- Glyph of Frenzied Regeneration
(@CT_CLASS_TRAINER+9, '40899', '0'), -- Glyph of Growl
(@CT_CLASS_TRAINER+9, '40914', '0'), -- Glyph of Healing Touch
(@CT_CLASS_TRAINER+9, '40920', '0'), -- Glyph of Hurricane
(@CT_CLASS_TRAINER+9, '40908', '0'), -- Glyph of Innervate
(@CT_CLASS_TRAINER+9, '40919', '0'), -- Glyph of Insect Swarm
(@CT_CLASS_TRAINER+9, '40915', '0'), -- Glyph of Lifebloom
(@CT_CLASS_TRAINER+9, '40900', '0'), -- Glyph of Mangle
(@CT_CLASS_TRAINER+9, '40897', '0'), -- Glyph of Maul
(@CT_CLASS_TRAINER+9, '45622', '0'), -- Glyph of Monsoon
(@CT_CLASS_TRAINER+9, '40923', '0'), -- Glyph of Moonfire
(@CT_CLASS_TRAINER+9, '45603', '0'), -- Glyph of Nourish
(@CT_CLASS_TRAINER+9, '40903', '0'), -- Glyph of Rake
(@CT_CLASS_TRAINER+9, '50125', '0'), -- Glyph of Rapid Rejuvenation
(@CT_CLASS_TRAINER+9, '40909', '0'), -- Glyph of Rebirth
(@CT_CLASS_TRAINER+9, '40912', '0'), -- Glyph of Regrowth
(@CT_CLASS_TRAINER+9, '40913', '0'), -- Glyph of Rejuvenation
(@CT_CLASS_TRAINER+9, '40902', '0'), -- Glyph of Rip
(@CT_CLASS_TRAINER+9, '45604', '0'), -- Glyph of Savage Roar
(@CT_CLASS_TRAINER+9, '40901', '0'), -- Glyph of Shred
(@CT_CLASS_TRAINER+9, '40921', '0'), -- Glyph of Starfall
(@CT_CLASS_TRAINER+9, '40916', '0'), -- Glyph of Starfire
(@CT_CLASS_TRAINER+9, '46372', '0'), -- Glyph of Survival Instincts
(@CT_CLASS_TRAINER+9, '40906', '0'), -- Glyph of Swiftmend
(@CT_CLASS_TRAINER+9, '43335', '0'), -- Glyph of the Wild
(@CT_CLASS_TRAINER+9, '43332', '0'), -- Glyph of Thorns
(@CT_CLASS_TRAINER+9, '44922', '0'), -- Glyph of Typhoon
(@CT_CLASS_TRAINER+9, '43331', '0'), -- Glyph of Unburdened Rebirth
(@CT_CLASS_TRAINER+9, '45602', '0'), -- Glyph of Wild Growth
(@CT_CLASS_TRAINER+9, '40922', '501'); -- Glyph of Wrath
-- Beastmaster 26307
DELETE FROM `creature_template` WHERE `entry` = (@CT_CLASS_TRAINER+10);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_CLASS_TRAINER+10, '0', '0', '0', '0', '0', '24028', '0', '0', '0', 'Beastmaster', @LOL_TEAM, NULL, '0', '70', '70', '2', '35', '35', @NPCFLAG_TRAINER | @NPCFLAG_CLASS_TRAINER | @NPCFLAG_REPAIRER | @NPCFLAG_GOSSIP | @NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR, '1.1', '1.14286', '1.0', '0', '234.0', '331.0', '0', '286', '1.0', '2000', '0', '2', '768', '8', '0', '0', '0', '0', '0', '198.0', '295.0', '33', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_CLASS_TRAINER+10);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_CLASS_TRAINER+10, '', '', 'Bestienmeister', '', '', '', '', '', NULL, NULL, @LOL_TEAM, NULL, NULL, NULL, NULL, NULL);


-- Waffenmeister
-- Weapon master
-- Handiir 16773
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+0, '0', '0', '0', '0', '0', '17216', '0', '0', '0', 'Handiir', 'Weapon Master', NULL, '8591', '30', '30', '0', '35', '35', '81', '1.0', '1.14286', '1.0', '0', '42.0', '56.0', '0', '102', '1.0', '1500', '0', '1', '512', '8', '0', '2', '0', '0', '0', '29.0', '42.0', '9', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+0, '', '', 'Handiir', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+0);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+0, '5011', '1000', '0', '0', '0');
-- Ileda 16621
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+1, '0', '0', '0', '0', '0', '16775', '0', '0', '0', 'Ileda', 'Weapon Master', NULL, '8612', '30', '30', '0', '35', '35', '81', '1.0', '1.14286', '1.0', '0', '30.0', '42.0', '0', '44', '1.0', '1500', '0', '8', '4608', '8', '0', '2', '0', '0', '0', '26.0', '38.0', '16', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+1, '', '', 'Ileda', '', '', '', '', '', NULL, NULL, 'Waffenmeisterin', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+1);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '200', '10000', '0', '0', '20');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+1, '2567', '1000', '0', '0', '0');
-- Bixi Wobblebonk 13084
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+2, '0', '0', '0', '0', '0', '12992', '0', '0', '0', 'Bixi Wobblebonk', 'Weapon Master', NULL, '5277', '50', '50', '0', '35', '35', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '210', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+2, '', '', 'Bixi Wobbelbonk', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+2);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+2, '5011', '1000', '0', '0', '0');
-- Archibald 11870
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+3, '0', '0', '0', '0', '0', '11805', '0', '0', '0', 'Archibald', 'Weapon Master', NULL, '5269', '50', '50', '0', '35', '35', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '37376', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '264', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+3, '', '', 'Archibald', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+3);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '200', '10000', '0', '0', '20');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+3, '5011', '1000', '0', '0', '0');
-- Ansekhwa 11869
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+4, '0', '0', '0', '0', '0', '11803', '0', '0', '0', 'Ansekhwa', 'Weapon Master', NULL, '5266', '50', '50', '0', '35', '35', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '473', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+4, '', '', 'Ansekhwa', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+4);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+4, '266', '1000', '0', '0', '0');
-- Sayoc 11868
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+5, '0', '0', '0', '0', '0', '11801', '0', '0', '0', 'Sayoc', 'Weapon Master', NULL, '5221', '50', '50', '0', '35', '35', '83', '1.1', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1331', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+5, '', '', 'Sayoc', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+5);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+5, '15590', '1000', '0', '0', '0');
-- Woo Ping 11867
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+6, '0', '0', '0', '0', '0', '11804', '0', '0', '0', 'Woo Ping', 'Weapon Master', NULL, '5271', '50', '50', '0', '35', '35', '81', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '202', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+6, '', '', 'Woo Ping', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+6);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '200', '10000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '201', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '202', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+6, '5011', '1000', '0', '0', '0');
-- Ilyenia Moonfire 11866
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+7, '0', '0', '0', '0', '0', '11802', '0', '0', '0', 'Ilyenia Moonfire', 'Weapon Master', NULL, '5273', '50', '50', '0', '35', '35', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '109', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+7, '', '', 'Ilyenia Mondfeuer', '', '', '', '', '', NULL, NULL, 'Waffenmeisterin', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+7);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '1180', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '2567', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+7, '15590', '1000', '0', '0', '0');
-- Buliwyf Stonehand 11865
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+8, '0', '0', '0', '0', '0', '11806', '0', '0', '0', 'Buliwyf Stonehand', 'Weapon Master', NULL, '5275', '50', '50', '0', '35', '35', '83', '1.0', '1.14286', '1.0', '1', '85.0', '112.0', '0', '206', '2.4', '1500', '0', '1', '0', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '201', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+8, '', '', 'Buliwyf Steinhand', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+8);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '198', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '199', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '266', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+8, '15590', '1000', '0', '0', '0');
-- Hanashi 2704
DELETE FROM `creature_template` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `creature_template` (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified)
VALUES (@CT_WEAPON_MASTER+9, '0', '0', '0', '0', '0', '12989', '0', '0', '0', 'Hanashi', 'Weapon Master', NULL, '5263', '50', '50', '0', '35', '35', '81', '1.1', '1.14286', '1.0', '0', '85.0', '112.0', '0', '206', '1.0', '2000', '0', '1', '4096', '8', '0', '2', '0', '0', '0', '58.0', '86.0', '20', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '7.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '835', '0', '2', '', '12340');
DELETE FROM `locales_creature` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `locales_creature` (entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, subname_loc1, subname_loc2, subname_loc3, subname_loc4, subname_loc5, subname_loc6, subname_loc7, subname_loc8)
VALUES (@CT_WEAPON_MASTER+9, '', '', 'Hanashi', '', '', '', '', '', NULL, NULL, 'Waffenmeister', NULL, NULL, NULL, NULL, NULL);
DELETE FROM `npc_trainer` WHERE `entry` = (@CT_WEAPON_MASTER+9);
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '196', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '197', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '227', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '264', '1000', '0', '0', '0');
INSERT INTO `npc_trainer` (entry, spell, spellcost, reqskill, reqskillvalue, reqlevel)
VALUES (@CT_WEAPON_MASTER+9, '2567', '1000', '0', '0', '0');



-- Enchantment Scrolls // Verzauberkunst
DELETE FROM `creature_template` WHERE `entry` = @CT_ENCHANTMENT_SCROLLS;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_ENCHANTMENT_SCROLLS,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Enchantment Scrolls','','','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_ENCHANTMENT_SCROLLS;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_ENCHANTMENT_SCROLLS,'','','Verzauberkunst Rollen','','','','','',
 NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_ENCHANTMENT_SCROLLS;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_ENCHANTMENT_SCROLLS, '46098', '2958', '0'), -- Scroll of Enchant Weapon - Blood Draining
(@CT_ENCHANTMENT_SCROLLS, '44497', '2958', '1'), -- Scroll of Enchant Weapon - Accuracy
(@CT_ENCHANTMENT_SCROLLS, '38973',   '95', '2'), -- Scroll of Enchant Cloak - Spell Piercing
(@CT_ENCHANTMENT_SCROLLS, '44457',   '95', '3'), -- Scroll of Enchant Cloak - Major Agility
(@CT_ENCHANTMENT_SCROLLS, '39001',   '95', '4'), -- Scroll of Enchant Cloak - Mighty Armor
(@CT_ENCHANTMENT_SCROLLS, '38978',   '95', '5'), -- Scroll of Enchant Cloak - Titanweave
(@CT_ENCHANTMENT_SCROLLS, '39004',   '95', '6'), -- Scroll of Enchant Cloak - Wisdom
(@CT_ENCHANTMENT_SCROLLS, '38993',   '95', '7'), -- Scroll of Enchant Cloak - Shadow Armor
(@CT_ENCHANTMENT_SCROLLS, '38979',   '95', '8'), -- Scroll of Enchant Gloves - Exceptional Spellpower
(@CT_ENCHANTMENT_SCROLLS, '38951',   '95', '9'), -- Scroll of Enchant Gloves - Expertise
(@CT_ENCHANTMENT_SCROLLS, '38953',   '95', '10'), -- Scroll of Enchant Gloves - Precision
(@CT_ENCHANTMENT_SCROLLS, '38967',   '95', '11'), -- Scroll of Enchant Gloves - Major Agility
(@CT_ENCHANTMENT_SCROLLS, '44458',   '95', '12'), -- Scroll of Enchant Gloves - Crusher
(@CT_ENCHANTMENT_SCROLLS, '38990',   '95', '13'), -- Scroll of Enchant Gloves - Armsman
(@CT_ENCHANTMENT_SCROLLS, '38968',   '95', '14'), -- Scroll of Enchant Bracers - Exceptional Intellect
(@CT_ENCHANTMENT_SCROLLS, '38987',   '95', '15'), -- Scroll of Enchant Bracers - Greater Stats
(@CT_ENCHANTMENT_SCROLLS, '38980',   '95', '16'), -- Scroll of Enchant Bracers - Major Spirit
(@CT_ENCHANTMENT_SCROLLS, '44815',   '95', '17'), -- Scroll of Enchant Bracers - Greater Assault
(@CT_ENCHANTMENT_SCROLLS, '38966',   '95', '18'), -- Scroll of Enchant Boots - Greater Fortitude
(@CT_ENCHANTMENT_SCROLLS, '38986',   '95', '19'), -- Scroll of Enchant Boots - Icewalker
(@CT_ENCHANTMENT_SCROLLS, '38974',   '95', '20'), -- Scroll of Enchant Boots - Greater Vitality
(@CT_ENCHANTMENT_SCROLLS, '38961',   '95', '21'), -- Scroll of Enchant Boots - Greater Spirit
(@CT_ENCHANTMENT_SCROLLS, '38976',   '95', '22'), -- Scroll of Enchant Boots - Superior Agility
(@CT_ENCHANTMENT_SCROLLS, '38954',   '95', '23'), -- Scroll of Enchant Shield - Defense
(@CT_ENCHANTMENT_SCROLLS, '39006',   '95', '24'), -- Scroll of Enchant Boots - Tuskarr's Vitality
(@CT_ENCHANTMENT_SCROLLS, '44469',   '95', '25'), -- Scroll of Enchant Boots - Greater Assault
(@CT_ENCHANTMENT_SCROLLS, '38912',   '95', '26'), -- Scroll of Enchant Chest - Exceptional Mana
(@CT_ENCHANTMENT_SCROLLS, '39002',   '95', '27'), -- Scroll of Enchant Chest - Greater Defense
(@CT_ENCHANTMENT_SCROLLS, '44493', '2958', '28'), -- Scroll of Enchant Weapon - Berserking
(@CT_ENCHANTMENT_SCROLLS, '43987', '2958', '29'), -- Scroll of Enchant Weapon - Black Magic
(@CT_ENCHANTMENT_SCROLLS, '44467', '2958', '30'), -- Scroll of Enchant Weapon - Mighty Spellpower
(@CT_ENCHANTMENT_SCROLLS, '44466', '2958', '31'), -- Scroll of Enchant Weapon - Superior Potency
(@CT_ENCHANTMENT_SCROLLS, '38988', '2958', '32'), -- Scroll of Enchant Weapon - Giant Slayer
(@CT_ENCHANTMENT_SCROLLS, '38965', '2958', '33'), -- Scroll of Enchant Weapon - Icebreaker
(@CT_ENCHANTMENT_SCROLLS, '38962',   '95', '34'), -- Scroll of Enchant Chest - Greater Mana Restoration
(@CT_ENCHANTMENT_SCROLLS, '38972', '2958', '35'), -- Scroll of Enchant Weapon - Lifeward
(@CT_ENCHANTMENT_SCROLLS, '38995', '2958', '36'), -- Scroll of Enchant Weapon - Exceptional Agility
(@CT_ENCHANTMENT_SCROLLS, '38963', '2958', '37'), -- Scroll of Enchant Weapon - Exceptional Spirit
(@CT_ENCHANTMENT_SCROLLS, '38948', '2958', '38'), -- Scroll of Enchant Weapon - Executioner
(@CT_ENCHANTMENT_SCROLLS, '38925', '2958', '39'), -- Scroll of Enchant Weapon - Mongoose
(@CT_ENCHANTMENT_SCROLLS, '38838', '2958', '40'), -- Scroll of Enchant Weapon - Fiery Weapon
(@CT_ENCHANTMENT_SCROLLS, '45056',   '95', '41'), -- Scroll of Enchant Staff - Greater Spellpower
(@CT_ENCHANTMENT_SCROLLS, '44463', '2958', '42'), -- Scroll of Enchant 2H Weapon - Massacre
(@CT_ENCHANTMENT_SCROLLS, '38981', '2958', '43'), -- Scroll of Enchant 2H Weapon - Scourgebane
(@CT_ENCHANTMENT_SCROLLS, '44455',   '95', '44'), -- Scroll of Enchant Shield - Greater Intellect
(@CT_ENCHANTMENT_SCROLLS, '38945',   '95', '45'), -- Scroll of Enchant Shield - Major Stamina
(@CT_ENCHANTMENT_SCROLLS, '39005',   '95', '46'), -- Scroll of Enchant Chest - Super Health
(@CT_ENCHANTMENT_SCROLLS, '38975',   '95', '47'), -- Scroll of Enchant Chest - Exceptional Resilience
(@CT_ENCHANTMENT_SCROLLS, '44465',   '95', '48'), -- Scroll of Enchant Chest - Powerful Stats
(@CT_ENCHANTMENT_SCROLLS, '39003',   '95', '49'), -- Scroll of Enchant Cloak - Greater Speed
(@CT_ENCHANTMENT_SCROLLS, '44470',   '95', '50'), -- Scroll of Enchant Bracer - Superior Spellpower
(@CT_ENCHANTMENT_SCROLLS, '44947',   '95', '51'), -- Scroll of Enchant Bracer - Major Stamina
(@CT_ENCHANTMENT_SCROLLS, '46026', '2958', '52'), -- Scroll of Enchant Weapon - Blade Ward
(@CT_ENCHANTMENT_SCROLLS, '38949',   '95', '53'), -- Scroll of Enchant Shield - Resilience
(@CT_ENCHANTMENT_SCROLLS, '38871', '2958', '54'); -- Scroll of Enchant Weapon - Lifestealing
--
--
-- Enchantment Scrolls // Verzauberkunst_ :: ENDE
--
-- Head, Shoulder, Trousers Enchantment // Kopf, Schulter, Hose Verzauberungen
DELETE FROM `creature_template` WHERE `entry` = @CT_ENCHANTMENT_HEADSHOULDER;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_ENCHANTMENT_HEADSHOULDER,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Head, Shoulder, Trousers Enchantment','','','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'EventAI',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_ENCHANTMENT_HEADSHOULDER;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_ENCHANTMENT_HEADSHOULDER,'','','Kopf, Schulter, Hose Verzauberungen','','','','','',
 NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- thanks to FlavaSava and Nature12 for helping with the items and prices
DELETE FROM npc_vendor WHERE entry = @CT_ENCHANTMENT_HEADSHOULDER;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_ENCHANTMENT_HEADSHOULDER, '41602',  '95',  '0'), -- Brilliant Spellthread
(@CT_ENCHANTMENT_HEADSHOULDER, '44877', '386',  '1'), -- Arcanum of Burning Mysteries
(@CT_ENCHANTMENT_HEADSHOULDER, '44876', '386',  '2'), -- Arcanum of Blissful Mending
(@CT_ENCHANTMENT_HEADSHOULDER, '44878', '386',  '3'), -- Arcanum of the Stalwart Protector
(@CT_ENCHANTMENT_HEADSHOULDER, '44879', '386',  '4'), -- Arcanum of Torment
(@CT_ENCHANTMENT_HEADSHOULDER, '44075', '386',  '5'), -- Arcanum of Dominance
(@CT_ENCHANTMENT_HEADSHOULDER, '44069', '386',  '6'), -- Arcanum of Triumph
(@CT_ENCHANTMENT_HEADSHOULDER, '44957',  '95',  '7'), -- Greater Inscription of the Gladiator
(@CT_ENCHANTMENT_HEADSHOULDER, '44873',  '95',  '8'), -- Greater Inscription of the Pinnacle
(@CT_ENCHANTMENT_HEADSHOULDER, '44874',  '95',  '9'), -- Greater Inscription of the Storm
(@CT_ENCHANTMENT_HEADSHOULDER, '44872',  '95', '10'), -- Greater Inscription of the Crag
(@CT_ENCHANTMENT_HEADSHOULDER, '44871',  '95', '11'), -- Greater Inscription of the Axe
(@CT_ENCHANTMENT_HEADSHOULDER, '41604',  '95', '12'), -- Sapphire Spellthread
(@CT_ENCHANTMENT_HEADSHOULDER, '38373',  '95', '13'), -- Frosthide Leg Armor
(@CT_ENCHANTMENT_HEADSHOULDER, '38374',  '95', '14'), -- Icescale Leg Armor
(@CT_ENCHANTMENT_HEADSHOULDER, '41611',  '95', '15'), -- Eternal Belt Buckle
(@CT_ENCHANTMENT_HEADSHOULDER, '41167',  '95', '16'), -- Heartseeker Scope
(@CT_ENCHANTMENT_HEADSHOULDER, '23765',  '95', '17'), -- Khorium Scope
(@CT_ENCHANTMENT_HEADSHOULDER, '41146',  '95', '18'), -- Sun Scope
(@CT_ENCHANTMENT_HEADSHOULDER, '44068',  '95', '19'), -- Inscription of Dominance
(@CT_ENCHANTMENT_HEADSHOULDER, '44067',  '95', '20'), -- Inscription of Triumph
(@CT_ENCHANTMENT_HEADSHOULDER, '41976',  '95', '21'), -- Titanium Weapon Chain
(@CT_ENCHANTMENT_HEADSHOULDER, '44936',  '95', '22'), -- Titanium Plating
(@CT_ENCHANTMENT_HEADSHOULDER, '44963',  '95', '23'), -- Earthen Leg Armor
(@CT_ENCHANTMENT_HEADSHOULDER, '42500',  '95', '24'); -- Titanium Shield Spike
--
-- Head and Shoulder Enchantment // Kopf- und Schulter Verzauberungen :: ENDE
--
-- Gem // Edelsteine
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_GEMS;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_GEMS,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Gems','','','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_GEMS;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_GEMS,'','','Edelsteine','','','','','',
 NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_GEMS;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_VENDOR_GEMS, '40148', '2588', '0'), -- Glinting Ametrine
(@CT_VENDOR_GEMS, '40143', '2588', '1'), -- Etched Ametrine
(@CT_VENDOR_GEMS, '40161', '2588', '2'), -- Glimmering Ametrine
(@CT_VENDOR_GEMS, '40154', '2588', '3'), -- Durable Ametrine
(@CT_VENDOR_GEMS, '40150', '2588', '4'), -- Deft Ametrine
(@CT_VENDOR_GEMS, '40147', '2588', '5'), -- Deadly Ametrine
(@CT_VENDOR_GEMS, '40146', '2588', '6'), -- Fierce Ametrine
(@CT_VENDOR_GEMS, '40158', '2588', '7'), -- Empowered Ametrine
(@CT_VENDOR_GEMS, '40166', '2588', '8'), -- Vivid Eye of Zul
(@CT_VENDOR_GEMS, '40144', '2588', '9'), -- Champion's Ametrine
(@CT_VENDOR_GEMS, '40162', '2588', '10'), -- Accurate Ametrine
(@CT_VENDOR_GEMS, '40173', '2588', '11'), -- Turbid Eye of Zul
(@CT_VENDOR_GEMS, '40164', '2588', '12'), -- Timeless Eye of Zul
(@CT_VENDOR_GEMS, '40172', '2588', '13'), -- Shining Eye of Zul
(@CT_VENDOR_GEMS, '40182', '2588', '14'), -- Shattered Eye of Zul
(@CT_VENDOR_GEMS, '40181', '2588', '15'), -- Tense Eye of Zul
(@CT_VENDOR_GEMS, '40168', '2588', '16'), -- Steady Eye of Zul
(@CT_VENDOR_GEMS, '40165', '2588', '17'), -- Jagged Eye of Zul
(@CT_VENDOR_GEMS, '40179', '2588', '18'), -- Energized Eye of Zul
(@CT_VENDOR_GEMS, '40178', '2588', '19'), -- Opaque Eye of Zul
(@CT_VENDOR_GEMS, '40175', '2588', '20'), -- Dazzling Eye of Zul
(@CT_VENDOR_GEMS, '40174', '2588', '21'), -- Intricate Eye of Zul
(@CT_VENDOR_GEMS, '40177', '2588', '22'), -- Lambent Eye of Zul
(@CT_VENDOR_GEMS, '40167', '2588', '23'), -- Enduring Eye of Zul
(@CT_VENDOR_GEMS, '40171', '2588', '24'), -- Misty Eye of Zul
(@CT_VENDOR_GEMS, '40169', '2588', '25'), -- Forceful Eye of Zul
(@CT_VENDOR_GEMS, '40117', '2588', '26'), -- Fractured Cardinal Ruby
(@CT_VENDOR_GEMS, '40114', '2588', '27'), -- Bright Cardinal Ruby
(@CT_VENDOR_GEMS, '40115', '2588', '28'), -- Subtle Cardinal Ruby
(@CT_VENDOR_GEMS, '40116', '2588', '29'), -- Flashing Cardinal Ruby
(@CT_VENDOR_GEMS, '40120', '2588', '30'), -- Sparkling Majestic Zircon
(@CT_VENDOR_GEMS, '40132', '2588', '31'), -- Glowing Dreadstone
(@CT_VENDOR_GEMS, '40135', '2588', '32'), -- Mysterious Dreadstone
(@CT_VENDOR_GEMS, '40138', '2588', '33'), -- Regal Dreadstone
(@CT_VENDOR_GEMS, '40130', '2588', '34'), -- Shifting Dreadstone
(@CT_VENDOR_GEMS, '40128', '2588', '35'), -- Quick King's Amber
(@CT_VENDOR_GEMS, '40139', '2588', '36'), -- Defender's Dreadstone
(@CT_VENDOR_GEMS, '40137', '2588', '37'), -- Infused Dreadstone
(@CT_VENDOR_GEMS, '40122', '2588', '38'), -- Stormy Majestic Zircon
(@CT_VENDOR_GEMS, '40140', '2588', '39'), -- Puissant Dreadstone
(@CT_VENDOR_GEMS, '40136', '2588', '40'), -- Balanced Dreadstone
(@CT_VENDOR_GEMS, '40133', '2588', '41'), -- Purified Dreadstone
(@CT_VENDOR_GEMS, '40134', '2588', '42'), -- Royal Dreadstone
(@CT_VENDOR_GEMS, '40131', '2588', '43'), -- Tenuous Dreadstone
(@CT_VENDOR_GEMS, '40125', '2588', '44'), -- Rigid King's Amber
(@CT_VENDOR_GEMS, '40126', '2588', '45'), -- Thick King's Amber
(@CT_VENDOR_GEMS, '40119', '2588', '46'), -- Solid Majestic Zircon
(@CT_VENDOR_GEMS, '40141', '2588', '47'), -- Guardian's Dreadstone
(@CT_VENDOR_GEMS, '40123', '2588', '48'), -- Brilliant King's Amber
(@CT_VENDOR_GEMS, '40127', '2588', '49'), -- Mystic King's Amber
(@CT_VENDOR_GEMS, '40129', '2588', '50'), -- Sovereign Dreadstone
(@CT_VENDOR_GEMS, '40124', '2588', '51'), -- Smooth King's Amber
(@CT_VENDOR_GEMS, '40176', '2588', '52'), -- Sundered Eye of Zul
(@CT_VENDOR_GEMS, '40170', '2588', '53'), -- Seer's Eye of Zul
(@CT_VENDOR_GEMS, '40113', '2588', '54'), -- Runed Cardinal Ruby
(@CT_VENDOR_GEMS, '40111', '2588', '55'), -- Bold Cardinal Ruby
(@CT_VENDOR_GEMS, '40118', '2588', '56'), -- Precise Cardinal Ruby
(@CT_VENDOR_GEMS, '40180', '2588', '57'), -- Radiant Eye of Zul
(@CT_VENDOR_GEMS, '40121', '2588', '58'), -- Lustrous Majestic Zircon
(@CT_VENDOR_GEMS, '40112', '2588', '59'), -- Delicate Cardinal Ruby
(@CT_VENDOR_GEMS, '40142', '2588', '60'), -- Inscribed Ametrine
(@CT_VENDOR_GEMS, '40149', '2588', '61'), -- Lucent Ametrine
(@CT_VENDOR_GEMS, '40151', '2588', '62'), -- Luminous Ametrine
(@CT_VENDOR_GEMS, '40152', '2588', '63'), -- Potent Ametrine
(@CT_VENDOR_GEMS, '40157', '2588', '64'), -- Pristine Ametrine
(@CT_VENDOR_GEMS, '40155', '2588', '65'), -- Reckless Ametrine
(@CT_VENDOR_GEMS, '40163', '2588', '66'), -- Resolute Ametrine
(@CT_VENDOR_GEMS, '40145', '2588', '67'), -- Resplendent Ametrine
(@CT_VENDOR_GEMS, '40160', '2588', '68'), -- Stalwart Ametrine
(@CT_VENDOR_GEMS, '40159', '2588', '69'), -- Stark Ametrine
(@CT_VENDOR_GEMS, '40153', '2588', '70'), -- Veiled Ametrine
(@CT_VENDOR_GEMS, '40156', '2588', '71'), -- Wicked Ametrine
(@CT_VENDOR_GEMS, '49110', '2588', '72'); -- Nightmare Tear
--
-- Gem // Edelsteine :: ENDE
--
-- Meta Gem // Meta Edelsteine
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_METAGEMS;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_METAGEMS,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Meta Gems','','','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_METAGEMS;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_METAGEMS,'','','Meta Edelsteine','','','','','',
 NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_METAGEMS;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_VENDOR_METAGEMS, '41380', '2588', '0'), -- Austere Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '41389', '2588', '1'), -- Beaming Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '41395', '2588', '2'), -- Bracing Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '25897', '2588', '3'), -- Bracing Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '25899', '2588', '4'), -- Brutal Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '34220', '2588', '5'), -- Chaotic Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41285', '2588', '6'), -- Chaotic Skyflare Diamond
(@CT_VENDOR_METAGEMS, '25890', '2588', '7'), -- Destructive Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41307', '2588', '8'), -- Destructive Skyflare Diamond
(@CT_VENDOR_METAGEMS, '41377', '2588', '9'), -- Effulgent Skyflare Diamond
(@CT_VENDOR_METAGEMS, '35503', '2588', '10'), -- Ember Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41333', '2588', '11'), -- Ember Skyflare Diamond
(@CT_VENDOR_METAGEMS, '25895', '2588', '12'), -- Enigmatic Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41335', '2588', '13'), -- Enigmatic Skyflare Diamond
(@CT_VENDOR_METAGEMS, '44081', '2588', '14'), -- Enigmatic Starflare Diamond
(@CT_VENDOR_METAGEMS, '41396', '2588', '15'), -- Eternal Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '352588', '2588', '16'), -- Eternal Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '41378', '2588', '17'), -- Forlorn Skyflare Diamond
(@CT_VENDOR_METAGEMS, '44084', '2588', '18'), -- Forlorn Starflare Diamond
(@CT_VENDOR_METAGEMS, '32641', '2588', '19'), -- Imbued Unstable Diamond
(@CT_VENDOR_METAGEMS, '41379', '2588', '20'), -- Impassive Skyflare Diamond
(@CT_VENDOR_METAGEMS, '44082', '2588', '21'), -- Impassive Starflare Diamond
(@CT_VENDOR_METAGEMS, '41401', '2588', '22'), -- Insightful Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '25901', '2588', '23'), -- Insightful Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '41385', '2588', '24'), -- Invigorating Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '25893', '2588', '25'), -- Mystical Skyfire Diamond
(@CT_VENDOR_METAGEMS, '44087', '2588', '26'), -- Persistent Earthshatter Diamond
(@CT_VENDOR_METAGEMS, '41381', '2588', '27'), -- Persistent Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '25896', '2588', '28'), -- Powerful Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '41398', '2588', '29'), -- Relentless Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '32409', '2588', '30'), -- Relentless Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '41376', '2588', '31'), -- Revitalizing Skyflare Diamond
(@CT_VENDOR_METAGEMS, '25894', '2588', '32'), -- Swift Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41339', '2588', '33'), -- Swift Skyflare Diamond
(@CT_VENDOR_METAGEMS, '28557', '2588', '34'), -- Swift Starfire Diamond
(@CT_VENDOR_METAGEMS, '44076', '2588', '35'), -- Swift Starflare Diamond
(@CT_VENDOR_METAGEMS, '28556', '2588', '36'), -- Swift Windfire Diamond
(@CT_VENDOR_METAGEMS, '25898', '2588', '37'), -- Tenacious Earthstorm Diamond
(@CT_VENDOR_METAGEMS, '32410', '2588', '38'), -- Thundering Skyfire Diamond
(@CT_VENDOR_METAGEMS, '41400', '2588', '39'), -- Thundering Skyflare Diamond
(@CT_VENDOR_METAGEMS, '41375', '2588', '40'), -- Tireless Skyflare Diamond
(@CT_VENDOR_METAGEMS, '44078', '2588', '41'), -- Tireless Starflare Diamond
(@CT_VENDOR_METAGEMS, '44089', '2588', '42'), -- Trenchant Earthshatter Diamond
(@CT_VENDOR_METAGEMS, '41382', '2588', '43'), -- Trenchant Earthsiege Diamond
(@CT_VENDOR_METAGEMS, '41397', '2588', '44'); -- Powerful Earthsiege Diamond

---
-- Free Meta Gems // Kostenlose Meta Edelsteine
-- Thanks to Nicola
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_METAGEMS_FREE;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_METAGEMS_FREE,@HAENDLER_KOSTENLOS_MODEL,'0','0','0',
'Free Meta Gems',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_METAGEMS_FREE;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_METAGEMS_FREE,'','','Kostenlose Metas','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_METAGEMS_FREE;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_VENDOR_METAGEMS_FREE, '25897', '0', '0'), --  Bracing Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '25899', '0', '1'), --  Brutal Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '34220', '0', '2'), --  Chaotic Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '25890', '0', '3'), --  Destructive Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '35503', '0', '4'), --  Ember Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '25895', '0', '5'), --  Enigmatic Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '35501', '0', '6'), --  Eternal Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '32641', '0', '7'), --  Imbued Unstable Diamond
(@CT_VENDOR_METAGEMS_FREE, '25901', '0', '8'), --  Insightful Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '25893', '0', '9'), --  Mystical Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '25896', '0', '10'), --  Powerful Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '32409', '0', '11'), --  Relentless Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '25894', '0', '12'), --  Swift Skyfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '28556', '0', '13'), --  Swift Windfire Diamond
(@CT_VENDOR_METAGEMS_FREE, '25898', '0', '14'), --  Tenacious Earthstorm Diamond
(@CT_VENDOR_METAGEMS_FREE, '32410', '0', '15'); --  Thundering Skyfire Diamond
-- Free Meta Gems // Kostenlose Meta Edelsteine :: ENDE
---

---
-- Free Gems // Kostenlose Edelsteine
-- Thanks to Nature12 and ZoundByrnes
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_GEMS_FREE;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_GEMS_FREE,@HAENDLER_KOSTENLOS_MODEL,'0','0','0',
'Free Gems',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_GEMS_FREE;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_GEMS_FREE,'','','Kostenlose Edelsteine','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_GEMS_FREE;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_VENDOR_GEMS_FREE, '40043', '0', '1'), --  (Agi + Crit)
(@CT_VENDOR_GEMS_FREE, '40050', '0', '2'), --  (Int + Abhärtung) Eigenwilliger Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40046', '0', '3'), --  (Agi + Tempo)
(@CT_VENDOR_GEMS_FREE, '40037', '0', '4'), --  (Stäe + Crit) Gravierter Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40048', '0', '5'), -- (Int+ Crit) Mächtiger Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40040', '0', '6'), --  (Stäe + Abhärtung) Prunkvoller Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40051', '0', '7'), --  (Int + Tempo) Tollkühner Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40054', '0', '8'), --  (Agi + Abhärtung)
(@CT_VENDOR_GEMS_FREE, '40052', '0', '9'), --  (Agi + Crit) Tödlicher Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40010', '0', '10'), --  (Wille) Funkelnder Himmelssaphir
(@CT_VENDOR_GEMS_FREE, '40008', '0', '11'), --  (Ausdauer) Gediegener Himmelssaphir
(@CT_VENDOR_GEMS_FREE, '40011', '0', '12'), --  (Zauberdurchschlagskraft) Stürmischer Himmelssaphir
(@CT_VENDOR_GEMS_FREE, '40013', '0', '13'), --  (Crit) Glatter Herbstglimmer
(@CT_VENDOR_GEMS_FREE, '40016', '0', '14'), --  (Abhärtung) Mystischer Herbstglimmer
(@CT_VENDOR_GEMS_FREE, '40017', '0', '15'), --  (Tempo) Spiegelnder Herbstglimmer
(@CT_VENDOR_GEMS_FREE, '40012', '0', '16'), --  (Int)
(@CT_VENDOR_GEMS_FREE, '40090', '0', '17'), -- (Ausdauer + Abhärtung) Beständiger Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40100', '0', '18'), -- (Hit + Tempo) Blitzender Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40105', '0', '19'), -- (Tempo + Wille) Geladener Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40033', '0', '20'), -- (Crit + Ausdauer)
(@CT_VENDOR_GEMS_FREE, '40091', '0', '21'), -- (Tempo + Ausdauer) Kraftvoller Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40095', '0', '22'), -- (Crit + Wille) Nebliger Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40101', '0', '23'), -- (Crit + Zauberdurchschlag)
(@CT_VENDOR_GEMS_FREE, '40102', '0', '24'), -- (Abhärtung + Wille) Trüber Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40058', '0', '25'), -- (Wk + Hit) Akkurater Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40028', '0', '26'), -- (Int+ Zauberdurchschlag) Geheimnisvoller Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40092', '0', '27'), -- (Int + Wille)
(@CT_VENDOR_GEMS_FREE, '40038', '0', '28'), -- (Stärke + Hit) Geätzter Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40053', '0', '29'), -- (Agi + Hit)
(@CT_VENDOR_GEMS_FREE, '40022', '0', '30'), -- (Stäe + Ausdauer) Stattlicher Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40049', '0', '31'), -- (Int + Hit) Verschleierter Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40023', '0', '32'), -- (Agi + Ausdauer) Veränderlicher Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '39997', '0', '33'), -- (Beweglichkeit) Feingeschliffener Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '39996', '0', '34'), -- (Stärke) Klobiger Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '40003', '0', '35'), -- (Wk) Präziser Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '36918', '0', '36'), --  Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '39998', '0', '37'), --  Glänzender Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '40001', '0', '38'), --  Scheinender Scharlachrubin
(@CT_VENDOR_GEMS_FREE, '36924', '0', '39'), --  Himmelssaphir
(@CT_VENDOR_GEMS_FREE, '40014', '0', '40'), --  Massiver Himmelssaphir
(@CT_VENDOR_GEMS_FREE, '36921', '0', '41'), --  Herbstglimmer
(@CT_VENDOR_GEMS_FREE, '40000', '0', '42'), --  Fragiler Herbstglimmer
(@CT_VENDOR_GEMS_FREE, '36927', '0', '43'), --  Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40025', '0', '44'), --  Zeitloser Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40026', '0', '45'), --  GelÃ¤uterter Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '40032', '0', '46'), --  Zwielichtopal des Verteidigers
(@CT_VENDOR_GEMS_FREE, '40034', '0', '47'), --  Zwielichtopal des WÃ¤chters
(@CT_VENDOR_GEMS_FREE, '40044', '0', '48'), --  Glitzernder Zwielichtopal
(@CT_VENDOR_GEMS_FREE, '36933', '0', '49'), --  Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40086', '0', '50'), --  Gezackter Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40088', '0', '51'), --  Geschickter Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40089', '0', '52'), --  MajestÃ¤tischer Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40098', '0', '53'), --  Strahlender Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '40106', '0', '54'), --  Zerschmetterter Waldsmaragd
(@CT_VENDOR_GEMS_FREE, '36930', '0', '55'), --  Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40039', '0', '56'), --  Monarchentopas des Champions
(@CT_VENDOR_GEMS_FREE, '40041', '0', '57'), --  Wilder Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40045', '0', '58'), --  Transparenter Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40055', '0', '59'), --  Gewandter Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40057', '0', '60'), --  Bruchfester Monarchentopas
(@CT_VENDOR_GEMS_FREE, '40059', '0', '61'); --  Resoluter Monarchentopas
--
-- Free Gems // Kostenlose Edelsteine :: ENDE
--

--
-- Free Necklaces and Stuff // Kostenloser Schmuck und Kram
---
-- Thanks to Nature12
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_NECK_FINGER_FREE;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_NECK_FINGER_FREE,@HAENDLER_KOSTENLOS_MODEL,'0','0','0',
'Free Necklaces and Stuff',@LOL_TEAM,'','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_NECK_FINGER_FREE;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_NECK_FINGER_FREE,'','','Kostenloser Schmuck und Kram','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_NECK_FINGER_FREE;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
-- Umhang (DD / Heal ):
(@CT_VENDOR_NECK_FINGER_FREE, '45811', '0', '0'), --   (mit Angriffskraft)
(@CT_VENDOR_NECK_FINGER_FREE, '45810', '0', '1'), --   (mit Zaubermacht)
-- Ringe :
(@CT_VENDOR_NECK_FINGER_FREE, '45809', '0', '2'), --   (mit Angriffskraft)
(@CT_VENDOR_NECK_FINGER_FREE, '45808', '0', '3'), --   (mit Zaubermacht)
-- Neck/Hals:
(@CT_VENDOR_NECK_FINGER_FREE, '45813', '0', '4'), --   (mit Zaubermacht)
(@CT_VENDOR_NECK_FINGER_FREE, '45812', '0', '5'), --   (mit Angriffskraft)
(@CT_VENDOR_NECK_FINGER_FREE, '38080', '0', '6'), --   (Crit + AP)
(@CT_VENDOR_NECK_FINGER_FREE, '38763', '0', '7'), --   (Zm+ Wille)
(@CT_VENDOR_NECK_FINGER_FREE, '38764', '0', '8'), --   (Crit + Hit)
(@CT_VENDOR_NECK_FINGER_FREE, '38765', '0', '9'), --   (Hit + Zm)
(@CT_VENDOR_NECK_FINGER_FREE, '44098', '0', '10'), --   Inherited Insignia of the Alliance
(@CT_VENDOR_NECK_FINGER_FREE, '44097', '0', '11'); --   Inherited Insignia of the Horde
--
-- Free Necklaces and Stuff // Kostenloser Schmuck und Kram :: ENDE
---


-- --
-- Händler: Consumables
-- --
DELETE FROM `creature_template` WHERE `entry` = @CT_VENDOR_CONSUMABLES;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`,
`speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_VENDOR_CONSUMABLES,@MODEL_ALANURA_FEUERWOLKE,'0','0','0',
'Consumables','','','0','80','80','2','35','35',@NPCFLAG_VENDOR_REAGENT | @NPCFLAG_VENDOR_POISON | @NPCFLAG_VENDOR,'1',
'1.14286','1','0','346','499','0','287','1',
'2000','0','8','32768','8','0','0','0','0','0','315','468','69','7','4096',
'',
'897','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_VENDOR_CONSUMABLES;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_VENDOR_CONSUMABLES,'','','Verbrauchswaren','','','','','',
 NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM npc_vendor WHERE entry = @CT_VENDOR_CONSUMABLES;
INSERT INTO `npc_vendor` (entry, item, ExtendedCost, slot)
VALUES
(@CT_VENDOR_CONSUMABLES, '43466', '2483',  '0'), -- Scroll of Strength VIII
(@CT_VENDOR_CONSUMABLES, '43464', '2483',  '1'), -- Scroll of Agility VIII
(@CT_VENDOR_CONSUMABLES, '37098', '2483',  '2'), -- Scroll of Spirit VIII
(@CT_VENDOR_CONSUMABLES, '37094', '2483',  '3'), -- Scroll of Stamina VIII
(@CT_VENDOR_CONSUMABLES, '37092', '2483',  '4'), -- Scroll of Intellect VIII
(@CT_VENDOR_CONSUMABLES, '46377', '2426',  '5'), -- Flask of Endless Rage
(@CT_VENDOR_CONSUMABLES, '46378', '2426',  '6'), -- Flask of Pure Mojo
(@CT_VENDOR_CONSUMABLES, '46379', '2426',  '7'), -- Flask of Stoneblood
(@CT_VENDOR_CONSUMABLES, '46376', '2426',  '8'), -- Flask of the Frost Wyrm
(@CT_VENDOR_CONSUMABLES, '33208', '2426',  '9'), -- Flask of Chromatic Wonder
(@CT_VENDOR_CONSUMABLES, '13511', '2426', '10'), -- Flask of Distilled Wisdom
(@CT_VENDOR_CONSUMABLES, '44325', '2426', '11'), -- Elixir of Accuracy
(@CT_VENDOR_CONSUMABLES, '44330', '2426', '12'), -- Elixir of Armor Piercing
(@CT_VENDOR_CONSUMABLES, '44327', '2426', '13'), -- Elixir of Deadly Strikes
(@CT_VENDOR_CONSUMABLES, '44329', '2426', '14'), -- Elixir of Expertise
(@CT_VENDOR_CONSUMABLES, '44331', '2426', '15'), -- Elixir of Lightning Speed
(@CT_VENDOR_CONSUMABLES, '39666', '2426', '16'), -- Elixir of Mighty Agility
(@CT_VENDOR_CONSUMABLES, '44328', '2426', '17'), -- Elixir of Mighty Defense
(@CT_VENDOR_CONSUMABLES, '40078', '2426', '18'), -- Elixir of Mighty Fortitude
(@CT_VENDOR_CONSUMABLES, '40109', '2426', '19'), -- Elixir of Mighty Mageblood
(@CT_VENDOR_CONSUMABLES, '40073', '2426', '20'), -- Elixir of Mighty Strength
(@CT_VENDOR_CONSUMABLES, '44332', '2426', '21'), -- Elixir of Mighty Thoughts
(@CT_VENDOR_CONSUMABLES, '40097', '2426', '22'), -- Elixir of Protection
(@CT_VENDOR_CONSUMABLES, '40072', '2426', '23'), -- Elixir of Spirit
(@CT_VENDOR_CONSUMABLES, '22831', '2426', '24'), -- Elixir of Major Agility
(@CT_VENDOR_CONSUMABLES, '32062', '2426', '25'), -- Elixir of Major Fortitude
(@CT_VENDOR_CONSUMABLES, '22824', '2426', '26'), -- Elixir of Major Strength
(@CT_VENDOR_CONSUMABLES, '8827',  '2426', '27'), -- Elixir of Water Walking
(@CT_VENDOR_CONSUMABLES, '18294', '2426', '28'), -- Elixir of Greater Water Breathing
(@CT_VENDOR_CONSUMABLES, '41166', '2426', '29'), -- Runic Healing Injector
(@CT_VENDOR_CONSUMABLES, '42545', '2426', '30'); -- Runic Mana Injector


----
-- NPC: Fight this one to improve your weapon skill :: START
----
DELETE FROM `creature_template` WHERE `entry` = @CT_NPC_WEAPON_SKILL;
INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`,
`speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, 
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`,
`trainer_spell`, `trainer_class`, `trainer_race`,
`minrangedmg`, `maxrangedmg`, `rangedattackpower`,
`type`, `type_flags`,
`AIName`,
`equipment_id`,`mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES(@CT_NPC_WEAPON_SKILL,@MODEL_WAR_GOLEM,'0','0','0',
'Improve Your Weapon Skill!',NULL,'',
'0','80','80','0','189','189',0,
'1','1.14286','1','0',
'0','0','0','0','0',
'2000','0','8',@UNIT_FLAG_DISABLE_MOVE,'8','0','0','0','0','0',
'0','0','0',
'7','4096',
'',
'0','0','0','','12340');
DELETE FROM `locales_creature` WHERE `entry` = @CT_NPC_WEAPON_SKILL;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`,
 `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`,
 `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES(@CT_NPC_WEAPON_SKILL,'','','Verbessere Deine Waffenfertigkeit!','','','','','',
 NULL,NULL,@LOL_TEAM,NULL,NULL,NULL,NULL,NULL);
----
-- NPC: Fight this one to improve your weapon skill :: END
----


----
-- Stockade
----
-- Savage Gladiator Complete 150211
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+0);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+0, @CT_SAVAGE_GLADIATOR, '34', '1', @PHASEMASK, '0', '0', '80.5359', '29.8368', '-26.5292', '5.37093', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Miscellaneous 150218
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+1);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+1, @CT_VENDOR_MISC, '34', '1', @PHASEMASK, '0', '897', '87.2204', '15.1501', '-26.5229', '3.03123', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Ulf 150270
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+2);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+2, @CT_RIDING_TRAINER, '34', '1', @PHASEMASK, '0', '0', '79.0913', '2.96038', '-25.6062', '4.66062', '300', '0.0', '0', '9416', '8459', '0', '0', '33587200', '0');
-- Mounts 150271
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+3);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+3, @CT_MOUNT_VENDOR, '34', '1', @PHASEMASK, '0', '897', '80.576', '-2.45216', '-25.6062', '1.76635', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Teleporter Mage 150272
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+4);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+4, @CT_TELEPORTER_MAGE, '34', '1', @PHASEMASK, '0', '0', '105.172', '0.540484', '-25.6062', '3.22444', '300', '0.0', '0', '100800', '88140', '0', '0', '0', '0');
-- Enchantment Scrolls 150273
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+5);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+5, @CT_ENCHANTMENT_SCROLLS, '34', '1', @PHASEMASK, '0', '897', '80.22', '20.9002', '-26.5241', '4.69154', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Head, Shoulder, Trousers Enchantment 150274
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+6);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+6, @CT_ENCHANTMENT_HEADSHOULDER, '34', '1', @PHASEMASK, '0', '897', '82.5877', '21.2924', '-26.5241', '4.71511', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Gems 150275
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+7);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+7, @CT_VENDOR_GEMS, '34', '1', @PHASEMASK, '0', '897', '85.6704', '21.5266', '-26.5227', '4.99785', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Meta Gems 150276
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+8);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+8, @CT_VENDOR_METAGEMS, '34', '1', @PHASEMASK, '0', '897', '88.2729', '21.6267', '-26.5272', '4.39702', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Consumables 150277
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+9);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+9, @CT_VENDOR_CONSUMABLES, '34', '1', @PHASEMASK, '0', '897', '80.8969', '17.0075', '-26.5243', '0.100909', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Crafted PvP Gear 150278
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+10);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+10, @CT_VENDOR_PVP_STARTINGGEAR, '34', '1', @PHASEMASK, '0', '0', '87.4375', '30.0799', '-26.5237', '4.03732', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Gems 150279
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+11);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+11, @CT_VENDOR_GEMS_FREE, '34', '1', @PHASEMASK, '0', '897', '87.9591', '11.5155', '-26.5229', '3.19695', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Meta Gems 150280
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+12);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+12, @CT_VENDOR_METAGEMS_FREE, '34', '1', @PHASEMASK, '7193', '897', '88.5222', '8.80133', '-26.5229', '3.00845', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Necklaces and Stuff 150281
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+13);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+13, @CT_VENDOR_NECK_FINGER_FREE, '34', '1', @PHASEMASK, '0', '897', '86.8813', '17.2419', '-26.5229', '3.34617', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Death Knight Trainer and Runeforge 150300
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+14);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+14, @CT_CLASS_TRAINER, '34', '1', @PHASEMASK, '0', '0', '92.2726', '5.66879', '-25.6062', '4.55923', '300', '0.0', '0', '42', '0', '0', '0', '0', '0');
-- Warrior Trainer 150301
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+15);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+15, (@CT_CLASS_TRAINER+1), '34', '1', @PHASEMASK, '0', '0', '96.0764', '5.77721', '-25.6062', '4.68883', '300', '0.0', '0', '8982', '0', '0', '0', '0', '0');
-- Warlock Trainer 150302
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+16);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+16, (@CT_CLASS_TRAINER+2), '34', '1', @PHASEMASK, '0', '0', '94.2883', '5.77715', '-25.6062', '4.74773', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Rogue Trainer 150304
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+17);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+17, (@CT_CLASS_TRAINER+4), '34', '1', @PHASEMASK, '0', '0', '98.4629', '5.77621', '-25.6062', '4.60243', '300', '0.0', '0', '8982', '0', '0', '0', '0', '0');
-- Priest Trainer 150305
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+18);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+18, (@CT_CLASS_TRAINER+5), '34', '1', @PHASEMASK, '0', '0', '101.029', '4.10182', '-25.6062', '4.63385', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Paladin Trainer 150306
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+19);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+19, (@CT_CLASS_TRAINER+6), '34', '1', @PHASEMASK, '0', '0', '101.007', '-1.92245', '-25.6062', '1.49225', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Mage Trainer 150307
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+20);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+20, (@CT_CLASS_TRAINER+7), '34', '1', @PHASEMASK, '0', '0', '98.9987', '-4.28586', '-25.6062', '1.61399', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Hunter Trainer 150308
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+21);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+21, (@CT_CLASS_TRAINER+8), '34', '1', @PHASEMASK, '0', '0', '97.1904', '-4.28586', '-25.6062', '1.51581', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Druid Trainer 150309
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+22);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+22, (@CT_CLASS_TRAINER+9), '34', '1', @PHASEMASK, '0', '0', '94.757', '-4.09328', '-25.6062', '1.6886', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Beastmaster 150310
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+23);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+23, (@CT_CLASS_TRAINER+10), '34', '1', @PHASEMASK, '0', '0', '92.9177', '-2.56495', '-25.6062', '1.65718', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Handiir 150311
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+24);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+24, @CT_WEAPON_MASTER, '34', '1', @PHASEMASK, '0', '0', '81.6713', '-8.1279', '-26.5229', '0.0160863', '300', '0.0', '0', '955', '0', '0', '0', '0', '0');
-- Ileda 150312
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+25);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+25, (@CT_WEAPON_MASTER+1), '34', '1', @PHASEMASK, '0', '0', '78.9712', '-11.1387', '-26.5229', '0.0435768', '300', '0.0', '0', '737', '2175', '0', '0', '0', '0');
-- Bixi Wobblebonk 150313
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+26);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+26, (@CT_WEAPON_MASTER+2), '34', '1', @PHASEMASK, '0', '210', '78.803', '-14.3822', '-26.5229', '0.169241', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Archibald 150314
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+27);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+27, (@CT_WEAPON_MASTER+3), '34', '1', @PHASEMASK, '0', '264', '81.116', '-17.8875', '-26.5229', '1.72825', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Ansekhwa 150315
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+28);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+28, (@CT_WEAPON_MASTER+4), '34', '1', @PHASEMASK, '0', '473', '84.6594', '-21.1488', '-26.5229', '1.49891', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Sayoc 150316
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+29);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+29, (@CT_WEAPON_MASTER+5), '34', '1', @PHASEMASK, '0', '1331', '90.0426', '-13.2656', '-26.5229', '3.18517', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Woo Ping 150317
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+30);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+30, (@CT_WEAPON_MASTER+6), '34', '1', @PHASEMASK, '0', '202', '89.6137', '-10.0428', '-26.5229', '3.22836', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Ilyenia Moonfire 150318
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+31);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+31, (@CT_WEAPON_MASTER+7), '34', '1', @PHASEMASK, '0', '109', '87.2705', '-7.87775', '-26.5229', '3.16395', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Buliwyf Stonehand 150319
DELETE FROM `creature` WHERE `guid` = (@CREA_STOCKADE+32);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_STOCKADE+32, (@CT_WEAPON_MASTER+8), '34', '1', @PHASEMASK, '0', '201', '87.8121', '-17.7614', '-26.5229', '1.42036', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');

----
-- Ragefire
----
-- Savage Gladiator Complete 150211
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+0);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+0, @CT_SAVAGE_GLADIATOR, '389', '1', @PHASEMASK, '0', '0', '-30.6252', '-51.5702', '-21.5339', '1.3057', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Miscellaneous 150218
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+1);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+1, @CT_VENDOR_MISC, '389', '1', @PHASEMASK, '0', '897', '-34.2031', '-46.7431', '-21.8633', '0.807738', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Ulf 150270
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+2);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+2, @CT_RIDING_TRAINER, '389', '1', @PHASEMASK, '0', '897', '-8.26827', '-54.2675', '-21.7976', '2.50897', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Mounts 150271
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+3);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+3, @CT_MOUNT_VENDOR, '389', '1', @PHASEMASK, '0', '897', '-5.90433', '-50.5969', '-21.8637', '2.5396', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Teleporter Mage 150272
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+4);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+4, @CT_TELEPORTER_MAGE, '389', '1', @PHASEMASK, '0', '0', '-9.39756', '-35.8637', '-19.8875', '4.6806', '300', '0.0', '0', '100800', '88140', '0', '0', '0', '0');
-- Enchantment Scrolls 150273
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+5);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+5, @CT_ENCHANTMENT_SCROLLS, '389', '1', @PHASEMASK, '0', '897', '-19.7524', '-62.4821', '-21.3729', '1.21462', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Head, Shoulder, Trousers Enchantment 150274
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+6);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+6, @CT_ENCHANTMENT_HEADSHOULDER, '389', '1', @PHASEMASK, '0', '897', '-21.7667', '-62.6689', '-21.3739', '1.45809', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Gems 150275
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+7);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+7, @CT_VENDOR_GEMS, '389', '1', @PHASEMASK, '0', '897', '-24.9795', '-63.056', '-21.3721', '1.45024', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Meta Gems 150276
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+8);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+8, @CT_VENDOR_METAGEMS, '389', '1', @PHASEMASK, '0', '897', '-27.4354', '-63.0227', '-21.3721', '1.15179', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Crafted PvP Gear 150278
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+9);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+9, @CT_VENDOR_PVP_STARTINGGEAR, '389', '1', @PHASEMASK, '0', '0', '-26.7781', '-53.6912', '-21.4093', '1.52168', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Gems 150279
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+10);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+10, @CT_VENDOR_GEMS_FREE, '389', '1', @PHASEMASK, '0', '897', '-36.3407', '-44.8284', '-21.8637', '0.262726', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Meta Gems 150280
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+11);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+11, @CT_VENDOR_METAGEMS_FREE, '389', '1', @PHASEMASK, '0', '897', '-37.2862', '-43.2576', '-21.8637', '0.265868', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Necklaces and Stuff 150281
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+12);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+12, @CT_VENDOR_NECK_FINGER_FREE, '389', '1', @PHASEMASK, '7193', '897', '-39.7221', '-40.4763', '-21.7986', '0.199057', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Free Necklaces and Stuff 150281
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+13);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+13, @CT_VENDOR_NECK_FINGER_FREE, '389', '1', @PHASEMASK, '7193', '897', '-39.7221', '-40.4763', '-21.7986', '0.199057', '300', '0.0', '0', '10080', '8814', '0', '0', '0', '0');
-- Death Knight Trainer and Runeforge 150300
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+14);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+14, @CT_CLASS_TRAINER, '389', '1', @PHASEMASK, '0', '0', '-21.9826', '-36.9566', '-21.6223', '3.70116', '300', '0.0', '0', '42', '0', '0', '0', '0', '0');
-- Warrior Trainer 150301
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+15);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+15, (@CT_CLASS_TRAINER+1), '389', '1', @PHASEMASK, '0', '0', '-23.1808', '-34.0125', '-21.6233', '3.52838', '300', '0.0', '0', '8982', '0', '0', '0', '0', '0');
-- Warlock Trainer 150302
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+16);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+16, (@CT_CLASS_TRAINER+2), '389', '1', @PHASEMASK, '0', '0', '-24.4265', '-31.58', '-21.6233', '3.62655', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Shaman Trainer 150303
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+17);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+17, (@CT_CLASS_TRAINER+3), '389', '1', @PHASEMASK, '0', '0', '-26.1071', '-27.9898', '-21.6233', '3.86217', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Rogue Trainer 150304
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+18);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+18, (@CT_CLASS_TRAINER+4), '389', '1', @PHASEMASK, '0', '0', '-28.3722', '-25.8137', '-21.6233', '4.40017', '300', '0.0', '0', '8982', '0', '0', '0', '0', '0');
-- Priest Trainer 150305
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+19);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+19, (@CT_CLASS_TRAINER+5), '389', '1', @PHASEMASK, '0', '0', '-31.9662', '-23.5542', '-21.6233', '4.23916', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Paladin Trainer 150306
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+20);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+20, (@CT_CLASS_TRAINER+6), '389', '1', @PHASEMASK, '0', '0', '-36.1417', '-21.4753', '-21.6233', '4.30984', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Mage Trainer 150307
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+21);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+21, (@CT_CLASS_TRAINER+7), '389', '1', @PHASEMASK, '0', '0', '-40.1978', '-20.4412', '-21.6233', '4.54546', '300', '0.0', '0', '7185', '7196', '0', '0', '0', '0');
-- Hunter Trainer 150308
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+22);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+22, (@CT_CLASS_TRAINER+8), '389', '1', @PHASEMASK, '0', '0', '-43.9324', '-20.2919', '-21.2703', '5.03633', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Druid Trainer 150309
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+23);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+23, (@CT_CLASS_TRAINER+9), '389', '1', @PHASEMASK, '0', '0', '-46.4213', '-21.2876', '-20.7178', '5.44866', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Beastmaster 150310
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+24);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+24, (@CT_CLASS_TRAINER+10), '389', '1', @PHASEMASK, '0', '0', '-49.1372', '-24.4804', '-20.5039', '5.51935', '300', '0.0', '0', '8982', '3155', '0', '0', '0', '0');
-- Handiir 150311
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+25);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+25, @CT_WEAPON_MASTER, '389', '1', @PHASEMASK, '0', '0', '-60.0632', '-43.6085', '-18.7787', '0.0208325', '300', '0.0', '0', '955', '0', '0', '0', '0', '0');
-- Ileda 150312
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+26);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+26, (@CT_WEAPON_MASTER+1), '389', '1', @PHASEMASK, '0', '0', '-55.933', '-46.3286', '-20.1907', '0.735546', '300', '0.0', '0', '737', '2175', '0', '0', '0', '0');
-- Bixi Wobblebonk 150313
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+27);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+27, (@CT_WEAPON_MASTER+2), '389', '1', @PHASEMASK, '0', '210', '-50.908', '-48.5629', '-21.1167', '0.586324', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Archibald 150314
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+28);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+28, (@CT_WEAPON_MASTER+3), '389', '1', @PHASEMASK, '0', '264', '-46.7545', '-50.8826', '-21.4354', '0.935827', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Ansekhwa 150315
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+29);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+29, (@CT_WEAPON_MASTER+4), '389', '1', @PHASEMASK, '0', '473', '-42.7968', '-53.7797', '-21.3972', '0.586325', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Sayoc 150316
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+30);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+30, (@CT_WEAPON_MASTER+5), '389', '1', @PHASEMASK, '0', '1331', '-38.6787', '-58.2021', '-21.3704', '0.382122', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Woo Ping 150317
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+31);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+31, (@CT_WEAPON_MASTER+6), '389', '1', @PHASEMASK, '0', '202', '-53.5901', '-47.6344', '-20.6139', '0.786603', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Ilyenia Moonfire 150318
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+32);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+32, (@CT_WEAPON_MASTER+7), '389', '1', @PHASEMASK, '0', '109', '-58.095', '-44.8808', '-19.4533', '0.692355', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');
-- Buliwyf Stonehand 150319
DELETE FROM `creature` WHERE `guid` = (@CREA_RAGEFIRE+33);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES (@CREA_RAGEFIRE+33, (@CT_WEAPON_MASTER+8), '389', '1', @PHASEMASK, '0', '201', '-62.8359', '-42.2307', '-18.0544', '0.625594', '300', '0.0', '0', '15505', '0', '0', '0', '0', '0');


-- -------------------------------------------------------------------------
-- ---- IMPORTANT: ONLY SET THESE VARIABLES, DO NOT TOUCH THE REST!!!! -----
-- -------------------------------------------------------------------------
-- Set all the important variables for the database
-- Replace xxx with a value (number)
-- NPC
-- NPC Teleporter:: ANFANG
SET @Entry = @CT_TELEPORTER_MAGE;  -- Creature Entry (need 1)
SET @Text = 100000; -- Gossip Texts (need 6)
SET @Main = 50050; -- Main gossip entry on creature (need 13)
SET @Scripts = 90000 ; 
-- Smart_script
SET @Script := 90000 ; -- scriptid iterator (need 84)
-- Conditional values
SET @Money_C := 0 ; -- How much users have to pay to travel to MAIN CITIES (in copper, set 0 for free usage)
SET @Money_T1 := 0 ; -- How much users have to pay to travel to TOWNS_TBC (in copper, set 0 for free usage)
SET @Money_T2 := 0 ; -- How much users have to pay to travel to TOWNS_WOTLK (in copper, set 0 for free usage)
SET @Money_A := 0 ; -- How much users have to pay to travel to ARENAS (in copper, set 0 for free usage)
SET @Money_I1 := 0 ; -- How much users have to pay to travel to DUNGEONS<60 (in copper, set 0 for free usage)
SET @Money_I2 := 0 ; -- How much users have to pay to travel to DUNGEONS_TBC (in copper, set 0 for free usage)
SET @Money_I3 := 0 ; -- How much users have to pay to travel to DUNGEONS_WOLTK (in copper, set 0 for free usage)
SET @Money_R1 := 0 ; -- How much users have to pay to travel to RAIDS<60 (in copper, set 0 for free usage)
SET @Money_R2 := 0 ; -- How much users have to pay to travel to RAIDS_TBC (in copper, set 0 for free usage)
SET @Money_R3 := 0 ; -- How much users have to pay to travel to RAIDS_WOLTK (in copper, set 0 for free usage)
-- --------------------------------------------------------------------------
-- ------- STOP HERE -- STOP HERE -- STOP HERE -- STOP HERE -- STOP HERE ----
-- --------------------------------------------------------------------------
 
-- ---------------------------------------------------------------------------
-- ------- DONT TOUCH THESE ----- DONT TOUCH THESE ----- DONT TOUCH THESE ----
-- ---------------------------------------------------------------------------
SET @Sub_Cities := @Main+1; -- Submenu: Cities
SET @Sub_Towns_BC := @Main+2; -- Submenu: Burning Crusade Towns
SET @Sub_Towns_WOTLK := @Main+3; -- Submenu: Wrath of Lich King Towns
SET @Sub_Arenas := @Main+4; -- Submenu: Arenas
SET @Sub_Instance1 := @Main+5; -- Submenu: Instances level 1-60
SET @Sub_Instance1_EK := @Main+6; -- Submenu: Instances level 1-60 Eastern Kingdoms
SET @Sub_Instance1_K := @Main+7; -- Submenu: Instances level 1-60 Kalimdor
SET @Sub_Instance2 := @Main+8; -- Submenu: Instances level 60-70
SET @Sub_Instance3 := @Main+9; -- Submenu: Instances level 70+
SET @Sub_Raid60 := @Main+10; -- Submenu: Raids level 60
SET @Sub_Raid70 := @Main+11; -- Submenu: Raids level 70
SET @Sub_Raid80 := @Main+12; -- Submenu: Raids level 80
SET @Script_Cities := @Scripts ; -- Submenu Scripts: Cities (need 10)
SET @Script_Towns := @Scripts+10 ; -- Submenu Scripts: Towns (need 21)
SET @Script_Arenas := @Scripts+32 ; -- Submenu Scripts: Arenas (need 4)
SET @Script_Instances := @Scripts+36 ; -- Submenu Scripts: Instances (need 31)
SET @Script_Raids := @Scripts+68 ; -- Submenu Scripts: Raids (need 16)
SET @ID := 0; -- iterator for script-subid
SET @opt := 0; -- Iterator for gossip_menu.option_id
-- Creature Definition
DELETE FROM `creature_template` WHERE `entry`=@Entry;
INSERT INTO creature_template (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(@Entry,0,0,0,0,0,29984,0,0,0, 'Teleporter Mage', 'Teleporting your PvP.Char', '',@Main,80,80,2,35,35,1,1,1.14286,1,0,346,499,0,287,1,0,0,8,512,8,0,0,0,0,0,315,468,69,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',0,3,10,10,1,0,0,0,0,0,0,0,0,1,0,0,0, '',0);
-- Text in Menus
DELETE FROM `npc_text` WHERE `ID` BETWEEN @Text AND @Text+5 ;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@Text, 'Select a Category.'),
(@Text+1, 'Select a City'),
(@Text+2, 'Hunterarea (Pets)');
/*
(@Text+3, 'Select an Arena'),
(@Text+4, 'Select an Instance'),
(@Text+5, 'Select a Raid Location');
*/
-- Gossip Menu Definition
DELETE FROM `gossip_menu` WHERE `entry` BETWEEN @Main AND @Main+12;
INSERT INTO gossip_menu (`entry`, `text_id`) VALUES
(@Main,@Text), -- "Select a Category"
(@Sub_Cities,@Text+1), -- "Select a City"
(@Sub_Towns_BC,@Text+2); -- "Select a Town"

-- ----------------------------------------
-- ---- Gossip Menu Options Definition ----
-- ----------------------------------------
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @Main AND @Main+12 ;
INSERT INTO gossip_menu_option (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
-- -----------------
-- -- Main Window --
-- -----------------
(@Main,0,0, 'Azeroth Cities',1,1,@Sub_Cities,0,0,0, ''),
(@Main,1,0, 'Hunterarea (Pets)',1,1,@Sub_Towns_BC,0,0,0, ''),
/*
(@Main,2,0, 'Northrend Towns',1,1,@Sub_Towns_WOTLK,0,0,0, ''),
(@Main,3,0, 'Arenas',1,1,@Sub_Arenas,0,0,0, ''),
(@Main,4,0, 'Azeroth Instances',1,1,@Sub_Instance1,0,0,0, ''),
(@Main,5,0, 'Outland Instances',1,1,@Sub_Instance2,0,0,0, ''),
(@Main,6,0, 'Northrend Instances',1,1,@Sub_Instance3,0,0,0, ''),
(@Main,7,0, 'Azeroth Raids',1,1,@Sub_Raid60,0,0,0, ''),
(@Main,8,0, 'Outland Raids',1,1,@Sub_Raid70,0,0,0, ''),
(@Main,9,0, 'Northrend Raids',1,1,@Sub_Raid80,0,0,0, ''),
*/
-- --------------------
-- -- Cities Submenu --
-- --------------------
(@Sub_Cities,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
(@Sub_Cities,1,2, 'Teleport me to Dalaran please',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Dalaran?'),
(@Sub_Cities,2,2, 'Teleport me to Stormwind',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Stormwind?'),
-- (@Sub_Cities,3,2, 'Teleport me to Ironforge',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Ironforge'),
-- (@Sub_Cities,4,2, 'Teleport me to Darnassus',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Darnassus?'),
-- (@Sub_Cities,5,2, 'Teleport me to Exodar',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Exodar?'),
(@Sub_Cities,6,2, 'Teleport me to Orgrimmar',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Orgrimmar?'),
-- (@Sub_Cities,7,2, 'Teleport me to Undercity',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Undercity?'),
-- (@Sub_Cities,8,2, 'Teleport me to ThunderBluff',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Thunder Bluff?'),
-- (@Sub_Cities,9,2, 'Teleport me to Silvermoon',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Silvermoon City?'),
-- (@Sub_Cities,10,2, 'Teleport me to Shattrath',1,1,0,0,0,@Money_C, 'Are you sure you wish to visit Shattrath?'),
-- -----------------------------------
-- -- Burning Crusade Towns Submenu --
-- -----------------------------------
(@Sub_Towns_BC,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Ally
-- (@Sub_Towns_BC,1,2, 'Teleport me to Honor Hold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Honor Hold?'),
-- (@Sub_Towns_BC,2,2, 'Teleport me to Telaar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Telaar?'),
-- (@Sub_Towns_BC,3,2, 'Teleport me to Sylvanaar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Sylvanaar?'),
-- (@Sub_Towns_BC,4,2, 'Teleport me to Wildhammer Stronghold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Wildhammer Stronghold?'),
-- Horde
-- (@Sub_Towns_BC,5,2, 'Teleport me to Thunderlord Stronghold please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Thunderlord Stronghold?'),
-- (@Sub_Towns_BC,6,2, 'Teleport me to Thrallmar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Thrallmar?'),
-- (@Sub_Towns_BC,7,2, 'Teleport me to Garadar please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Garadar?'),
-- (@Sub_Towns_BC,8,2, 'Teleport me to Shadowmoon Village please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Shadowmoon Village?'),
-- Neutral
-- WAS: Cenarion Refuge
(@Sub_Towns_BC,9,2, 'Teleport me to the Hunterarea please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit the Hunterarea?'),
-- (@Sub_Towns_BC,10,2, 'Teleport me to Ruuan Weald please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Ruuan Weald?'),
-- (@Sub_Towns_BC,11,2, 'Teleport me to Area52 please',1,1,0,0,0,@Money_T1, 'Are you sure you wish to visit Area52?'),
-- --------------------------------------
-- -- Wrath of Lich King Towns Submenu --
-- --------------------------------------
(@Sub_Towns_WOTLK,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Ally
(@Sub_Towns_WOTLK,1,2, 'Teleport me to Valiance Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Valiance Keep?'),
(@Sub_Towns_WOTLK,2,2, 'Teleport me to Westguard Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Westguard Keep?'),
(@Sub_Towns_WOTLK,3,2, 'Teleport me to Wintergarde Keep please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Wintergarde Keep?'),
(@Sub_Towns_WOTLK,4,2, 'Teleport me to Amberpine Lodge please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Amberpine Lodge?'),
-- Horde
(@Sub_Towns_WOTLK,5,2, 'Teleport me to Warsong Hold please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Warsong Hold?'),
(@Sub_Towns_WOTLK,6,2, 'Teleport me to Vengeance Landing please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Vengeance Landing?'),
(@Sub_Towns_WOTLK,7,2, 'Teleport me to Agmars Hammer please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Agmars Hammer?'),
(@Sub_Towns_WOTLK,8,2, 'Teleport me to Conquest Hold please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Conquest Hold?'),
-- Neutral
(@Sub_Towns_WOTLK,9,2, 'Teleport me to Wyrmrest Temple please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit Wyrmrest Temple?'),
(@Sub_Towns_WOTLK,10,2, 'Teleport me to The Argent Stand please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit The Argent Stand?'),
(@Sub_Towns_WOTLK,11,2, 'Teleport me to The Argent Tournament please',1,1,0,0,0,@Money_T2, 'Are you sure you wish to visit The Argent Tournament?'),
-- -------------------
-- -- Arena Submenu --
-- -------------------
(@Sub_Arenas,0,0, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Arenas
(@Sub_Arenas,1,2, 'Teleport me to Dire Maul Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Dire Maul Arena?'),
(@Sub_Arenas,2,2, 'Teleport me to Gurubashi Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Gurubashi Arena?'),
(@Sub_Arenas,3,2, 'Teleport me to the Circle of Blood Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Circle of Blood Arena?'),
(@Sub_Arenas,4,2, 'Teleport me to the Ring of Trials Arena please',1,1,0,0,0,@Money_A, 'Are you sure you wish to visit the Ring of Trials Arena?'),
-- ----------------------------
-- -- Dungeons 1-60 Submenu --
-- ----------------------------
(@Sub_Instance1,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
(@Sub_Instance1,1,2, 'I want to go to Eastern Kingdoms Instances',1,1,@Sub_Instance1_EK,0,0,0, ''),
(@Sub_Instance1,2,2, 'I want to go to Kalimdor Instances',1,1,@Sub_Instance1_K,0,0,0, ''),
-- Eastern Kingdoms
(@Sub_Instance1_EK,0,2, 'What other locations can you teleport me to?',1,1,@Sub_Instance1,0,0,0, ''),
-- Dungeons_Eastern Kingdoms
(@Sub_Instance1_EK,1,2, 'Teleport me to Deadmines please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Deadmines?'),
(@Sub_Instance1_EK,2,2, 'Teleport me to Stormwind Stockades please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Stormwind Stockades?'),
(@Sub_Instance1_EK,3,2, 'Teleport me to Gnomeregan please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Gnomeregan?'),
(@Sub_Instance1_EK,4,2, 'Teleport me to Scarlet Monestry please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Scarlet Monestry?'),
(@Sub_Instance1_EK,5,2, 'Teleport me to Uldaman please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Uldaman?'),
(@Sub_Instance1_EK,6,2, 'Teleport me to Scholomance please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Scholomance?'),
(@Sub_Instance1_EK,7,2, 'Teleport me to Stratholme please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Stratholme?'),
(@Sub_Instance1_EK,8,2, 'Teleport me to Blackrock Mountain please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Blackrock Mountain?'),
(@Sub_Instance1_EK,9,2, 'Teleport me to Sunken Temple please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Sunken Temple?'),
-- Kalimdor
(@Sub_Instance1_K,0,2, 'What other locations can you teleport me to?',1,1,@Sub_Instance1,0,0,0, ''),
-- Dungeons_Kalimdor
(@Sub_Instance1_K,1,2, 'Teleport me to Ragefire Chasm please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Ragefire Chasm?'),
(@Sub_Instance1_K,2,2, 'Teleport me to Wailing Caverns please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit the Wailing Caverns?'),
(@Sub_Instance1_K,3,2, 'Teleport me to Blackfathom Deeps please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Blackfathom Deeps?'),
(@Sub_Instance1_K,4,2, 'Teleport me to Shadowfang Keep please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Shadowfang Keep?'),
(@Sub_Instance1_K,5,2, 'Teleport me to Razorfen Kraul please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Razorfen Kraul?'),
(@Sub_Instance1_K,6,2, 'Teleport me to Maraudon please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Maraudon?'),
(@Sub_Instance1_K,7,2, 'Teleport me to Dire Maul please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Dire Maul?'),
(@Sub_Instance1_K,8,2, 'Teleport me to Razorfen Downs please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Razorfen Downs?'),
(@Sub_Instance1_K,9,2, 'Teleport me to Zul Farrak please',1,1,0,0,0,@Money_I1, 'Are you sure you wish to visit Zul Farrak?'),
-- ----------------------------
-- -- Dungeons 60-70 Submenu --
-- ----------------------------
(@Sub_Instance2,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Dungeons
(@Sub_Instance2,1,2, 'Teleport me to Hellfire Citadel please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Hellfire Citadel?'),
(@Sub_Instance2,2,2, 'Teleport me to Coilfang Reservoir please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Coilfang Reservoir?'),
(@Sub_Instance2,3,2, 'Teleport me to Auchindoun please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Auchindoun?'),
(@Sub_Instance2,4,2, 'Teleport me to The Tempest Keep please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Tempest Keep?'),
(@Sub_Instance2,5,2, 'Teleport me to Caverns of Time please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit the Caverns of Time?'),
(@Sub_Instance2,6,2, 'Teleport me to Magisters Terrace please',1,1,0,0,0,@Money_I2, 'Are you sure you wish to visit Magisters Terrace?'),
-- ----------------------------
-- -- Dungeons 70-80 Submenu --
-- ----------------------------
(@Sub_Instance3,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Dungeons
(@Sub_Instance3,1,2, 'Teleport me to Utguarde please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Utguarde?'),
(@Sub_Instance3,2,2, 'Teleport me to The Nexus please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit the Nexus?'),
(@Sub_Instance3,3,2, 'Teleport me to Pit of Narjun please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Pit of Narjun?'),
(@Sub_Instance3,4,2, 'Teleport me to Drak tharon please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Drak tharon?'),
(@Sub_Instance3,5,2, 'Teleport me to Gundrak please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Gundrak?'),
(@Sub_Instance3,6,2, 'Teleport me to Halls of Lightning and Stone please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Halls of Lightning/Stone?'),
(@Sub_Instance3,7,2, 'Teleport me to Culling of Stratholme please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Culling of Stratholme?'),
(@Sub_Instance3,8,2, 'Teleport me to Upper Icecrown Citadel please',1,1,0,0,0,@Money_I3, 'Are you sure you wish to visit Upper Icecrown Citadel?'),
-- -------------------
-- -- Azeroth Raids --
-- -------------------
(@Sub_Raid60,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid60,1,2, 'Teleport me to the Molten Core please' ,1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Molten Core?'),
(@Sub_Raid60,2,2, 'Teleport me to Ahn Qiraj 20 please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Ahn Qiraj 20?'),
(@Sub_Raid60,3,2, 'Teleport me to Ahn Qiraj 40 please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Ahn Qiraj 40?'),
(@Sub_Raid60,4,2, 'Teleport me to Zul Gurub please',1,1,0,0,0,@Money_R1, 'Are you sure you wish to visit Zul Gurub?'),
-- -------------------
-- -- Outland Raids --
-- -------------------
(@Sub_Raid70,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid70,1,2, 'Teleport me to the Black Temple please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Black Temple?'),
(@Sub_Raid70,2,2, 'Teleport me to Zul Aman please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Zul Aman?'),
(@Sub_Raid70,3,2, 'Teleport me to Karazhan please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Karazhan?'),
(@Sub_Raid70,4,2, 'Teleport me to the Tempest Keep please',1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Tempest Keep?'),
(@Sub_Raid70,5,2, 'Teleport me to Gruuls Lair please' ,1,1,0,0,0,@Money_R2, 'Are you sure you wish to visit Gruuls Lair?'),
-- ---------------------
-- -- Northrend Raids --
-- ---------------------
(@Sub_Raid80,0,2, 'What other locations can you teleport me to?',1,1,@Main,0,0,0, ''),
-- Raids
(@Sub_Raid80,1,2, 'Teleport me to Naxxramas please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Naxxramas?'),
(@Sub_Raid80,2,2, 'Teleport me to the Eye of Eternity please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Eye of Eternity?'),
(@Sub_Raid80,3,2, 'Teleport me to the Obsidian Sanctuary please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Obsidian Sanctuary?'),
(@Sub_Raid80,4,2, 'Teleport me to Onyxias Lair please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Onyxias Lair?'),
(@Sub_Raid80,5,2, 'Teleport me to Ulduar please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit Ulduar?'),
(@Sub_Raid80,6,2, 'Teleport me to the Ruby Sanctorum please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Ruby Sanctorum?'),
(@Sub_Raid80,7,2, 'Teleport me to the Icecrown Citadel please',1,1,0,0,0,@Money_R3, 'Are you sure you wish to visit the Icecrown Citadel?');
-- -------------
-- -- Scripts --
-- -------------
-- IMPORTANT FOR SAI:
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @Entry;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN @Script AND @Script+83 AND`source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Entry AND `source_type` IN (0,9);
INSERT INTO `smart_scripts`
(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
-- ------------------
-- -- Initialising --
-- -------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+0,0,62,0,100,0,@Sub_Cities,@opt+1 ,0,0,80,@Script ,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+1,0,62,0,100,0,@Sub_Cities,@opt+2 ,0,0,80,@Script+1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+2,0,62,0,100,0,@Sub_Cities,@opt+3 ,0,0,80,@Script+2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+3,0,62,0,100,0,@Sub_Cities,@opt+4 ,0,0,80,@Script+3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+4,0,62,0,100,0,@Sub_Cities,@opt+5 ,0,0,80,@Script+4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+5,0,62,0,100,0,@Sub_Cities,@opt+6 ,0,0,80,@Script+5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+6,0,62,0,100,0,@Sub_Cities,@opt+7 ,0,0,80,@Script+6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+7,0,62,0,100,0,@Sub_Cities,@opt+8 ,0,0,80,@Script+7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+8,0,62,0,100,0,@Sub_Cities,@opt+9 ,0,0,80,@Script+8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+9,0,62,0,100,0,@Sub_Cities,@opt+10,0,0,80,@Script+9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+10,0,62,0,100,0,@Sub_Towns_BC,@opt+1 ,0,0,80,@Script+10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+11,0,62,0,100,0,@Sub_Towns_BC,@opt+2 ,0,0,80,@Script+11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+12,0,62,0,100,0,@Sub_Towns_BC,@opt+3 ,0,0,80,@Script+12,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+13,0,62,0,100,0,@Sub_Towns_BC,@opt+4 ,0,0,80,@Script+13,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+14,0,62,0,100,0,@Sub_Towns_BC,@opt+5 ,0,0,80,@Script+14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+15,0,62,0,100,0,@Sub_Towns_BC,@opt+6 ,0,0,80,@Script+15,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+16,0,62,0,100,0,@Sub_Towns_BC,@opt+7 ,0,0,80,@Script+16,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+17,0,62,0,100,0,@Sub_Towns_BC,@opt+8 ,0,0,80,@Script+17,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+18,0,62,0,100,0,@Sub_Towns_BC,@opt+9 ,0,0,80,@Script+18,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+19,0,62,0,100,0,@Sub_Towns_BC,@opt+10,0,0,80,@Script+19,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+20,0,62,0,100,0,@Sub_Towns_BC,@opt+11,0,0,80,@Script+20,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+21,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+1 ,0,0,80,@Script+21,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+22,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+2 ,0,0,80,@Script+22,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+23,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+3 ,0,0,80,@Script+23,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+24,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+4 ,0,0,80,@Script+24,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+25,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+5 ,0,0,80,@Script+25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+26,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+6 ,0,0,80,@Script+26,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+27,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+7 ,0,0,80,@Script+27,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+28,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+8 ,0,0,80,@Script+28,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+29,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+9 ,0,0,80,@Script+29,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+30,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+10,0,0,80,@Script+30,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+31,0,62,0,100,0,@Sub_Towns_WOTLK,@opt+11,0,0,80,@Script+31,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+32,0,62,0,100,0,@Sub_Arenas,@opt+1,0,0,80,@Script+32,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+33,0,62,0,100,0,@Sub_Arenas,@opt+2,0,0,80,@Script+33,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+34,0,62,0,100,0,@Sub_Arenas,@opt+3,0,0,80,@Script+34,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+35,0,62,0,100,0,@Sub_Arenas,@opt+4,0,0,80,@Script+35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+36,0,62,0,100,0,@Sub_Instance1_EK,@opt+1 ,0,0,80,@Script+36,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+37,0,62,0,100,0,@Sub_Instance1_EK,@opt+2 ,0,0,80,@Script+37,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+38,0,62,0,100,0,@Sub_Instance1_EK,@opt+3 ,0,0,80,@Script+38,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+39,0,62,0,100,0,@Sub_Instance1_EK,@opt+4 ,0,0,80,@Script+39,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+40,0,62,0,100,0,@Sub_Instance1_EK,@opt+5 ,0,0,80,@Script+40,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+41,0,62,0,100,0,@Sub_Instance1_EK,@opt+6 ,0,0,80,@Script+41,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+42,0,62,0,100,0,@Sub_Instance1_EK,@opt+7 ,0,0,80,@Script+42,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+43,0,62,0,100,0,@Sub_Instance1_EK,@opt+8 ,0,0,80,@Script+43,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+44,0,62,0,100,0,@Sub_Instance1_EK,@opt+9 ,0,0,80,@Script+44,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+45,0,62,0,100,0,@Sub_Instance1_K,@opt+1,0,0,80,@Script+45,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+46,0,62,0,100,0,@Sub_Instance1_K,@opt+2,0,0,80,@Script+46,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+47,0,62,0,100,0,@Sub_Instance1_K,@opt+3,0,0,80,@Script+47,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+48,0,62,0,100,0,@Sub_Instance1_K,@opt+4,0,0,80,@Script+48,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+49,0,62,0,100,0,@Sub_Instance1_K,@opt+5,0,0,80,@Script+49,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+50,0,62,0,100,0,@Sub_Instance1_K,@opt+6,0,0,80,@Script+50,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+51,0,62,0,100,0,@Sub_Instance1_K,@opt+7,0,0,80,@Script+51,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+52,0,62,0,100,0,@Sub_Instance1_K,@opt+8,0,0,80,@Script+52,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+53,0,62,0,100,0,@Sub_Instance1_K,@opt+9,0,0,80,@Script+53,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+54,0,62,0,100,0,@Sub_Instance2,@opt+1,0,0,80,@Script+54,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+55,0,62,0,100,0,@Sub_Instance2,@opt+2,0,0,80,@Script+55,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+56,0,62,0,100,0,@Sub_Instance2,@opt+3,0,0,80,@Script+56,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+57,0,62,0,100,0,@Sub_Instance2,@opt+4,0,0,80,@Script+57,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+58,0,62,0,100,0,@Sub_Instance2,@opt+5,0,0,80,@Script+58,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+59,0,62,0,100,0,@Sub_Instance2,@opt+6,0,0,80,@Script+59,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+60,0,62,0,100,0,@Sub_Instance3,@opt+1,0,0,80,@Script+60,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+61,0,62,0,100,0,@Sub_Instance3,@opt+2,0,0,80,@Script+61,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+62,0,62,0,100,0,@Sub_Instance3,@opt+3,0,0,80,@Script+62,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+63,0,62,0,100,0,@Sub_Instance3,@opt+4,0,0,80,@Script+63,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+64,0,62,0,100,0,@Sub_Instance3,@opt+5,0,0,80,@Script+64,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+65,0,62,0,100,0,@Sub_Instance3,@opt+6,0,0,80,@Script+65,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+66,0,62,0,100,0,@Sub_Instance3,@opt+7,0,0,80,@Script+66,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+67,0,62,0,100,0,@Sub_Instance3,@opt+8,0,0,80,@Script+67,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+68,0,62,0,100,0,@Sub_Raid60,@opt+1,0,0,80,@Script+68,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+69,0,62,0,100,0,@Sub_Raid60,@opt+2,0,0,80,@Script+69,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+70,0,62,0,100,0,@Sub_Raid60,@opt+3,0,0,80,@Script+70,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+71,0,62,0,100,0,@Sub_Raid60,@opt+4,0,0,80,@Script+71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+72,0,62,0,100,0,@Sub_Raid70,@opt+1,0,0,80,@Script+72,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+73,0,62,0,100,0,@Sub_Raid70,@opt+2,0,0,80,@Script+73,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+74,0,62,0,100,0,@Sub_Raid70,@opt+3,0,0,80,@Script+74,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+75,0,62,0,100,0,@Sub_Raid70,@opt+4,0,0,80,@Script+75,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+76,0,62,0,100,0,@Sub_Raid70,@opt+5,0,0,80,@Script+76,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
(@Entry,0,@ID+77,0,62,0,100,0,@Sub_Raid80,@opt+1,0,0,80,@Script+77,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+78,0,62,0,100,0,@Sub_Raid80,@opt+2,0,0,80,@Script+78,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+79,0,62,0,100,0,@Sub_Raid80,@opt+3,0,0,80,@Script+79,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+80,0,62,0,100,0,@Sub_Raid80,@opt+4,0,0,80,@Script+80,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+81,0,62,0,100,0,@Sub_Raid80,@opt+5,0,0,80,@Script+81,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+82,0,62,0,100,0,@Sub_Raid80,@opt+6,0,0,80,@Script+82,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
(@Entry,0,@ID+83,0,62,0,100,0,@Sub_Raid80,@opt+7,0,0,80,@Script+83,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run teleport script'),
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -- ActionScripts --
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Cities
(@Script+00,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+00,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5804,625,647.768,1.64, 'script - teleport to Dalaran'),
(@Script+01,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+01,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-9004,870,29.621,2.25, 'script - teleport to Stormwind'),
(@Script+02,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+02,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-4918.88,-940.406,501.564,5.42347, 'script - teleport to Ironforge'),
(@Script+03,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+03,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,9660.810,2513.640,1331.66,3.06, 'script - teleport to Darnassus'),
(@Script+04,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+04,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-4030.000,-11572.000,-138.296,2.43, 'script - teleport to Exodar'),
(@Script+05,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+05,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,1629.36,-4373.39,31.4828,5.98, 'script - teleport to Orgrimmar'),
/*
(@Script+06,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+06,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,1773.470,61.121,-46.32,2.32443, 'script - teleport to Undercity'),
(@Script+07,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+07,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-964.980,283.433,111.187,3.02, 'script - teleport to ThunderBluff'),
(@Script+08,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+08,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,9998.490,-7106.780,47.7055,2.44, 'script - teleport to SilvermoonCity'),
(@Script+09,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+09,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1838.160,5301.790,-12.428,5.95, 'script - teleport to Shattrath'),
-- Towns TBC
(@Script+10,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+10,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-748.211,2681.52,100.35,5.7479, 'script - teleport to Honor Hold'),
(@Script+11,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+11,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-2560.76,7300.72,13.9485,2.18422, 'script - teleport to Telaar'),
(@Script+12,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+12,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2018.91,6854.47,171.409,0.087216, 'script - teleport to Sylvanaar'),
(@Script+13,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+13,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3989.47,2168.39,105.35,3.08422, 'script - teleport to Wildhammer Stronghold'),
(@Script+14,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+14,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2314.75,6041.96,142.417,6.24317, 'script - teleport to Thunderlord Stronghold'),
(@Script+15,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+15,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,156.251,2673.45,85.1587,0.382074, 'script - teleport to Thrallmar'),
(@Script+16,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+16,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1321.34,7239.12,32.7371,4.04169, 'script - teleport to Garadar'),
(@Script+17,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+17,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-2998.66,2568.9,76.6306,0.551303, 'script - teleport to Shadowmoon Village'),
*/
(@Script+18,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
-- WAS: Cenarion refugee (@Script+18,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-223.541,5487.99,23.2281,0.886755, 'script - teleport to Hunterarea'),
(@Script+18,9,1,0,0,0,100,0,1500,1500,0,0,62,429,0,0,0,0,0,0,8,0,0,48.5721,-268.792,-52.7521,0.886755, 'script - teleport to Hunterarea'),
(@Script+19,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+19,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2964.84,5663.43,146.879,5.89082, 'script - teleport to Ruuan Weald'),
(@Script+20,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+20,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3043.33,3681.33,143.065,5.07464, 'script - teleport to Area52'),
-- Towns WOTLK
(@Script+21,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+21,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,2213.95,5273.15,11.2565,5.89294, 'script - teleport to Valliance Keep'),
(@Script+22,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+22,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1391.04,-3284.63,163.929,1.59391, 'script - teleport to Westguard Keep'),
(@Script+23,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+23,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3682.71,-722.635,212.729,5.7991, 'script - teleport to Wintergarde Keep'),
(@Script+24,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+24,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3412.88,-2791.17,201.521,2.2458, 'script - teleport to Amberpine Lodge'),
(@Script+25,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+25,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,2741.29,6097.16,76.9055,0.731543, 'script - teleport to Warsong Hold'),
(@Script+26,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+26,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1942.86,-6167.11,23.724,2.64258, 'script - teleport to Vengeance Landing'),
(@Script+27,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+27,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3834.80,1544.01,89.73,0.25, 'script - teleport to Agmars Hammer'),
(@Script+28,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+28,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3249.58,-2254.53,114.65,1.21, 'script - teleport to Conquest Hold'),
(@Script+29,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+29,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3546.02,278.09,45.60,4.85, 'script - teleport to Wyrmrest Temple'),
(@Script+30,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+30,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5451.05,-2597.77,306.622,4.67, 'script - teleport to The Argent Stand'),
(@Script+31,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+31,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,8515.89,629.25,547.396,1.5747, 'script - teleport to The Argent Tournament'),
-- Arenas
(@Script+32,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+32,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-3761.49,1133.43,132.083,4.57259, 'script - teleport to Dire Maul Arena'),
(@Script+33,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+33,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-13277.4,127.372,26.1418,1.11878, 'script - teleport to Gurubashi Arena'),
(@Script+34,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+34,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2839.44,5930.17,11.1002,3.16284, 'script - teleport to Circle of Blood Arena'),
(@Script+35,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+35,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-1999.94,6581.71,11.32,2.3, 'script - teleport to Ring of Trials Arena'),
-- Dungeons Eastern Kingdoms
(@Script+36,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+36,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11208.7,1673.52,24.6361,1.51067, 'script - teleport to Deadmines'),
(@Script+37,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+37,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-8779.10,834.91,94.315,0.66, 'script - teleport to Stormwind Stockades'),
(@Script+38,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+38,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-5163.54,925.423,257.181,1.57423, 'script - teleport to Gnomeregan'),
(@Script+39,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+39,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,2872.6,-764.398,160.332,5.05735, 'script - teleport to Scarlet Monestry'),
(@Script+40,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+40,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-6071.37,-2955.16,209.782,0.015708, 'script - teleport to Uldaman'),
(@Script+41,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+41,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,1269.64,-2556.21,93.6088,0.620623, 'script - teleport to Scholomance'),
(@Script+42,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+42,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,3352.92,-3379.03,144.782,6.25978, 'script - teleport to Stratholme'),
(@Script+43,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+43,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-7494.94,-1123.49,265.547,3.3092, 'script - teleport to Blackrock Mountain'),
(@Script+44,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+44,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-10177.9,-3994.9,-111.239,6.01885, 'script - teleport to Sunken Temple'),
-- Dungeons Kalimdor
(@Script+45,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+45,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,1811.78,-4410.5,-18.4704,5.20165, 'script - teleport to Ragefire Chasm'),
(@Script+46,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+46,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-731.607,-2218.39,17.0281,2.78486, 'script - teleport to Wailing Caverns'),
(@Script+47,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+47,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,4249.99,740.102,-25.671,1.34, 'script - teleport to Blackfathom Deeps'),
(@Script+48,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+48,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-234.675,1561.63,76.8921,1.24031, 'script - teleport to Shadowfang Keep'),
(@Script+49,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+49,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4470.28,-1677.77,81.3925,1.16302, 'script - teleport to Razorfen Kraul'),
(@Script+50,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+50,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-1419.13,2908.14,137.464,1.57366, 'script - teleport to Maraudon'),
(@Script+51,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+51,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-3981.01,1129.61,161.03,0.05, 'script - teleport to Dire Maul'),
(@Script+52,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+52,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4657.3,-2519.35,81.0529,4.54808, 'script - teleport to Razorfen Downs'),
(@Script+53,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+53,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-6801.19,-2893.02,9.00388,0.158639, 'script - teleport to Zul Farrak'),
-- Dungeons TBC
(@Script+54,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+54,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-390.863,3130.64,4.51327,0.218692, 'script - teleport to Hellfire Citadel'),
(@Script+55,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+55,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,735.066,6883.45,-66.2913,5.89172, 'script - teleport to Coilfang Reservoir'),
(@Script+56,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+56,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3324.49,4943.45,-101.239,4.63901, 'script - teleport to Auchindoun'),
(@Script+57,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+57,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,2988.21,1806.9,139.071,3.8591, 'script - teleport to Tempest Keep'),
(@Script+58,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+58,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-8167.25,-4766.05,33.86,4.96, 'script - teleport to Caverns of Time'),
(@Script+59,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+59,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,12884.6,-7317.69,65.5023,4.799, 'script - teleport to Magister Terrace'),
-- Dungeons WOTLK
(@Script+60,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+60,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,1259.33,-4852.02,215.763,3.48293, 'script - teleport to Utgarde'),
(@Script+61,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+61,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3781.81,6953.65,104.82,0.467432, 'script - teleport to The Nexus'),
(@Script+62,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+62,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3707.86,2150.23,36.76,3.22, 'script - teleport to Pit of Narjun'),
(@Script+63,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+63,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,4774.6,-2032.92,229.15,1.59, 'script - teleport to DrakTharon Keep'),
(@Script+64,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+64,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,6898.72,-4584.94,451.12,2.34455, 'script - teleport to Gundrak'),
(@Script+65,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+65,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,9049.37,-1282.35,1060.19,5.8395, 'script - teleport to Halls of Stone/Lightning'),
(@Script+66,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+66,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,-8671.37,-4398.26,-207.01,3.44, 'script - teleport to Culling of Stratholme'),
(@Script+67,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+67,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5635.06,2052.08,798.05,4.68, 'script - teleport to Halls of Reflection'),
-- Raids lvl 60
(@Script+68,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+68,9,1,0,0,0,100,0,1500,1500,0,0,62,230,0,0,0,0,0,0,8,0,0,1121.45,-454.317,-101.33,3.5, 'script - teleport to Molten Core'),
(@Script+69,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+69,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-8409.03,1498.83,27.3615,2.49757, 'script - teleport to AQ20'),
(@Script+70,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+70,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-8245.84,1983.74,129.072,0.936195, 'script - teleport to AQ40'),
(@Script+71,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+71,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11916.7,-1212.82,92.2868,4.6095, 'script - teleport to Zul Gurub'),
-- Raids lvl 70
(@Script+72,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+72,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,-3610.72,324.988,37.4,3.28298, 'script - teleport to Black Temple'),
(@Script+73,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+73,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,6846.95,-7954.5,170.028,4.61501, 'script - teleport to Zul Aman'),
(@Script+74,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+74,9,1,0,0,0,100,0,1500,1500,0,0,62,0,0,0,0,0,0,0,8,0,0,-11118.8,-2010.84,47.0807,0, 'script - teleport to Karazhan'),
(@Script+75,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+75,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3089.58,1399.05,187.653,4.79407, 'script - teleport to Tempest Keep'),
(@Script+76,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+76,9,1,0,0,0,100,0,1500,1500,0,0,62,530,0,0,0,0,0,0,8,0,0,3539.01,5082.36,1.69107,0, 'script - teleport to Gruuls Lair'),
-- Raids lvl 80
(@Script+77,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+77,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3668.72,-1262.46,243.622,4.785, 'script - teleport to Naxxramas'),
(@Script+78,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+78,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3857.17,6990.71,152.10,5.87, 'script - teleport to Eye of Eternity'),
(@Script+79,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+79,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3516.08,269.89,-114.035,3.23, 'script - teleport to The Obsidian Sanctuary'),
(@Script+80,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+80,9,1,0,0,0,100,0,1500,1500,0,0,62,1,0,0,0,0,0,0,8,0,0,-4708.27,-3727.64,54.5589,3.72786, 'script - teleport to Onyxias Lair'),
(@Script+81,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+81,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,9049.37,-1282.35,1060.19,5.8395, 'script - teleport to Ulduar'),
(@Script+82,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+82,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,3598.44,198.52,-110.85,2.22, 'script - teleport to Ruby Sanctum'),
(@Script+83,9,0,0,0,0,100,0,0,0,0,0,85,35517,2,0,0,0,0,0,1,0,0,0,0,0,0, 'script - cast Visual on player'),
(@Script+83,9,1,0,0,0,100,0,1500,1500,0,0,62,571,0,0,0,0,0,0,8,0,0,5873.82,2110.98,636.011,3.5523, 'script - teleport to Icecrown Citadel');
-- ----------------
-- -- Conditions --
-- ----------------
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` BETWEEN @Main AND @Main+12;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Main Menu:
(15,@Main,1,0,27,55,3,0,0, '', 'Level 55+ Outland Towns'),
(15,@Main,2,0,27,70,3,0,0, '', 'Level 70+ Northrend Towns'),
(15,@Main,5,0,27,55,3,0,0, '', 'Level 55+ Outland Dungeons'),
(15,@Main,6,0,27,55,3,0,0, '', 'Level 70+ Northrend Dungeons'),
(15,@Main,7,0,27,60,3,0,0, '', 'Level 60+ Azeroth Raids'),
(15,@Main,8,0,27,70,3,0,0, '', 'Level 70+ Outland Raids'),
(15,@Main,9,0,27,80,3,0,0, '', 'Level 80+ Northrend Raids'),
-- Submenu: Cities
(15,@Sub_Cities,1,0,27,70,3,0,0, '', 'Level 70+ Dalaran'),
(15,@Sub_Cities,2,0,6,469,0,0,0, '', 'Ally: Stormwind'),
(15,@Sub_Cities,3,0,6,469,0,0,0, '', 'Ally: Ironforge'),
(15,@Sub_Cities,4,0,6,469,0,0,0, '', 'Ally: Darnassus'),
(15,@Sub_Cities,5,0,6,469,0,0,0, '', 'Ally: Exodar'),
(15,@Sub_Cities,6,0,6,67,0,0,0, '', 'Horde: Orgrimmar'),
(15,@Sub_Cities,7,0,6,67,0,0,0, '', 'Horde: Undercity'),
(15,@Sub_Cities,8,0,6,67,0,0,0, '', 'Horde: ThunderBluff'),
(15,@Sub_Cities,9,0,6,67,0,0,0, '', 'Horde: Silvermoon'),
(15,@Sub_Cities,10,0,27,60,3,0,0, '', 'Level 60+ Shattrath'),
-- Submenu: Towns BC
(15,@Sub_Towns_BC,1,0,6,469,0,0,0, '', 'Ally: Honor Hold'),
(15,@Sub_Towns_BC,2,0,6,469,0,0,0, '', 'Ally: Telaar'),
(15,@Sub_Towns_BC,3,0,6,469,0,0,0, '', 'Ally: Sylvanaar'),
(15,@Sub_Towns_BC,4,0,6,469,0,0,0, '', 'Ally: Wildhammer Stronghold'),
(15,@Sub_Towns_BC,5,0,6,67,0,0,0, '', 'Horde: Thunderlord Stronghold'),
(15,@Sub_Towns_BC,6,0,6,67,0,0,0, '', 'Horde: Thrallmar'),
(15,@Sub_Towns_BC,7,0,6,67,0,0,0, '', 'Horde: Garadar'),
(15,@Sub_Towns_BC,8,0,6,67,0,0,0, '', 'Horde: Shadowmoon Village'),
-- Submenu: Towns WOTLK
(15,@Sub_Towns_WOTLK,1,0,6,469,0,0,0, '', 'Ally: Valiance Keep'),
(15,@Sub_Towns_WOTLK,2,0,6,469,0,0,0, '', 'Ally: Westguard Keep'),
(15,@Sub_Towns_WOTLK,3,0,6,469,0,0,0, '', 'Ally: Wintergarde Keep'),
(15,@Sub_Towns_WOTLK,4,0,6,469,0,0,0, '', 'Ally: Amberpine Lodge'),
(15,@Sub_Towns_WOTLK,5,0,6,67,0,0,0, '', 'Horde: Warsong Hold'),
(15,@Sub_Towns_WOTLK,6,0,6,67,0,0,0, '', 'Horde: Vengeance Landing'),
(15,@Sub_Towns_WOTLK,7,0,6,67,0,0,0, '', 'Horde: Agmars Hammer'),
(15,@Sub_Towns_WOTLK,8,0,6,67,0,0,0, '', 'Horde: Conquest Hold');
/*
worldconfig
###################################################################################################################
#    PvP.Character.QuestId
#        This quest must be completed to make the character a PvP only char.
#        Default: 0 - Disable
#
#    PvP.Character.Vendor
#        Subname for PvP Vendors - if an NPC has this subtitle, then a PvP char gets everything for free
#        Default: empty
#
#    PvP.Character.AllowTrade
#        If you want to allow trade between PvP.Chars and PvE.Chars, then set this to 1
#        Default: 0 - PvE and PvP Chars are not allowed to trade
#
#    PvP.Character.AllowAuctionHouse
#        If you want that PvP.Chars can also use the auction house, then set this to 1
#        Default: 0 - PvP Chars are not allowed to use the auction house
#
#    PvP.Character.Money
#        Set this to the amount of money, that a PvP.Char should have.
#        Value is in copper - so 1000000 means 100 gold
#        Default: 0 - PvP Chars do not have money
#
###################################################################################################################
PvP.Character.QuestId = 30000
PvP.Character.Vendor = LoL BG Team
PvP.Character.AllowTrade = 0
PvP.Character.AllowAuctionHouse = 0
#PvP.Character.Money = 1000000
PvP.Character.Money = 50000
*/

-- Command changes
-- WAS: UPDATE command SET SECURITY = 3 WHERE `name` LIKE 'maxskill';
UPDATE command SET SECURITY = 0 WHERE `name` LIKE 'maxskill';
