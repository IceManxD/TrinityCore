UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_item_branns_communicator' WHERE `entry` IN (29650,29937);

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=29695 AND `item`=40971;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=29695 AND `SourceEntry`=40971;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(1,29695,40971,1,9,12855),
(1,29695,40971,2,28,12855);

-- cleanup
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9929,29937);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (9929,29937);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29650,29937); 
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=29937;
