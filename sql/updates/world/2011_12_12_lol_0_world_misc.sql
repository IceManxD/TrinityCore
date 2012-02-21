UPDATE `creature` SET `id`=27737, `modelid`=0, `spawntimesecs`=30, `spawndist`=5, `MovementType`=1 WHERE `id` IN (28167,28169);
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7180;
