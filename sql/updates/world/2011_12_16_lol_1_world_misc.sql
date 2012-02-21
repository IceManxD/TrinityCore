UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x100, `type_flags`=`type_flags`|0x4000000 WHERE `entry` IN (739,927,1182,1351,1444,5484,5489,5661,8140,12336,26044);
UPDATE `creature` SET `spawntimesecs`=20 WHERE `id` IN (739,927,1182,1351,1444,5484,5489,5661,8140,12336,26044);
UPDATE `item_template` SET `Flags`=0x40 WHERE `entry`=21519;
