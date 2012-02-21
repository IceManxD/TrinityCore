-- << Stefan Vadu >>
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_stefan_vadu' WHERE `entry`=28518;
-- remove old custom code
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9709;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28518;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup`=9709;

-- << Raelorasz >>
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_raelorasz' WHERE `entry`=26117;
-- remove old custom code
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9253;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26117;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup`=9253;

-- << Wildlord Antelarion >>
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_antelarion' WHERE `entry`=22127;
-- remove old custom code
DELETE FROM `gossip_menu_option` WHERE `menu_id`=22127;
DELETE FROM `smart_scripts` WHERE `entryorguid`=22127;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup`=22127;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=22127;

-- << Chief Apothecary Hildagard & Zorus the Judicator >>
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_item_spectrecles' WHERE `entry` IN (21772,21774);
-- remove old custom code
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (21772,21774);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (21772,21774);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` IN (21772,21774);
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` IN (21772,21774);

-- << Overlord Or'barokh & Thane Yoregar >>
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_item_path_of_conquest' WHERE `entry` IN (21769,21773);
-- remove old custom code
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (21769,21773);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (21769,21773);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` IN (21769,21773);
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` IN (21769,21773);
