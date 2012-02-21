UPDATE `gameobject_template` SET `AIName`='' WHERE `entry`=188715;
DELETE FROM `smart_scripts` WHERE `entryorguid`=188715;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27692,27755,27756);
UPDATE `creature_template` SET `IconName`='' WHERE `entry` IN (27756,27755,27692);
UPDATE `creature_template` SET `ScriptName`='npc_oculus_mount' WHERE `ScriptName`='npc_oculus_drakes';

DELETE FROM `creature` WHERE `id`=28239;
