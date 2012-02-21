-- spawn Defense System
SET @guid := 307192;
DELETE FROM `creature` WHERE `id`=30837;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,'30837','608','3','1','0','0','1890.94','803.352','64.479','3.15532','10','0','0','13945','0','0','0','0','0');

-- Defense System visual
DELETE FROM `creature_template_addon` WHERE `entry`=30837;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('30837','0','0','0','0','0','57887');

UPDATE `creature_template` SET `scale`=1, `InhabitType`=5, `ScriptName`='npc_defense_system' WHERE `entry`=30837;

-- update spell targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (58152,60038);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,58152,18,1,29321),
(13,58152,18,1,30660),
(13,58152,18,1,30661),
(13,58152,18,1,30662),
(13,58152,18,1,30663),
(13,58152,18,1,30664),
(13,58152,18,1,30666),
(13,58152,18,1,30667),
(13,58152,18,1,30668),
(13,58152,18,1,30695),
(13,58152,18,1,30918),
(13,58152,18,1,30961),
(13,58152,18,1,30962),
(13,58152,18,1,30963),
(13,58152,18,1,32191),
(13,60038,18,1,29321),
(13,60038,18,1,30660),
(13,60038,18,1,30661),
(13,60038,18,1,30662),
(13,60038,18,1,30663),
(13,60038,18,1,30664),
(13,60038,18,1,30666),
(13,60038,18,1,30667),
(13,60038,18,1,30668),
(13,60038,18,1,30695),
(13,60038,18,1,30918),
(13,60038,18,1,30961),
(13,60038,18,1,30962),
(13,60038,18,1,30963),
(13,60038,18,1,32191);
