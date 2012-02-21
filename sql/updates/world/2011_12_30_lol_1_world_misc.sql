-- remove double spawn
DELETE FROM `creature` WHERE `guid` IN (410260,410261,410262);
-- correct Trapped Animal behavior
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~256|512|2,`flags_extra`=`flags_extra`|2 WHERE `entry`=24196;