UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_elder_harkek' WHERE `entry`=28138;

-- cleanup custumized code
DELETE FROM `gossip_menu_option` WHERE `menu_id`=28138;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=28138;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28138;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=28138;
