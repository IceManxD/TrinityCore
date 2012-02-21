UPDATE `creature_template` SET `InhabitType`=5, `spell7`=60534 WHERE `entry` IN (30161,31752,30234,31748);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x100 WHERE `entry` IN (35451,35490);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x100 WHERE `entry` IN (32874,33162,32872,33149,32873,33148);
