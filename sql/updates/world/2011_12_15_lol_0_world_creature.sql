-- Eck and Dwellers
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=29932;
UPDATE `creature` SET `position_x`=1630.57, `position_y`=916.17, `position_z`=106.43, `orientation`=0.886765 WHERE `id`=29932;
UPDATE `creature` SET `spawnMask`=2, `spawntimesecs`=86400, `spawndist`=5, `MovementType`=1 WHERE `id`=29920;

-- Rhino Spirit
UPDATE `creature_template` SET `minlevel`=81, `maxlevel`=82, `ScriptName`='' WHERE `entry`=29791;
