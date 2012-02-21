UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_item_worg_disguise' WHERE `entry` IN (24186,24273);

-- cleanup - moved all to hardcode
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8908,8918);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (8908,8918);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (24186,24273);
