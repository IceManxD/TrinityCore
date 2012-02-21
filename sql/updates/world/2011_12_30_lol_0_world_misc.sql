UPDATE `creature_template` SET `gossip_menu_id`=9618,`AIName`='',`npcflag`=`npcflag`|1,`ScriptName`='npc_taxi' WHERE `entry`=27930;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9618;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27930;
DELETE FROM `conditions` WHERE `SourceGroup`=9618 AND `SourceTypeOrReferenceId`=15;