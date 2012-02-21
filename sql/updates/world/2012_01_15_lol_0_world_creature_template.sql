UPDATE `creature_template` SET `baseattacktime`=2400 WHERE `entry`=34657;

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`
|0x00000001 -- Charm
|0x00000002 -- Disoriented
|0x00000004 -- Disarm
|0x00000008 -- Distract
|0x00000010 -- Fear
|0x00000020 -- Grip
|0x00000040 -- Root
|0x00000080 -- Pacify
|0x00000100 -- Silence
|0x00000200 -- Sleep
|0x00000400 -- Snare
|0x00000800 -- Stun
|0x00001000 -- Freeze
|0x00002000 -- Knockout
|0x00010000 -- Polymorph
|0x00020000 -- Banish
|0x00080000 -- Shackle
|0x00400000 -- Turn
|0x00800000 -- Horror
|0x02000000 -- Interrupt
|0x04000000 -- Daze
|0x20000000 -- Sapped
WHERE `entry` IN (35119,35518,34928,35517,35451,35490); -- Eadric, Paletress, Black Knight

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`
|0x00000001 -- Charm
|0x00000002 -- Disoriented
|0x00000008 -- Distract
|0x00000010 -- Fear
|0x00000040 -- Root
|0x00000080 -- Pacify
|0x00000200 -- Sleep
|0x00000400 -- Snare
|0x00001000 -- Freeze
|0x00002000 -- Knockout
|0x00010000 -- Polymorph
|0x00020000 -- Banish
|0x00080000 -- Shackle
|0x00400000 -- Turn
|0x00800000 -- Horror
|0x04000000 -- Daze
|0x20000000 -- Sapped
WHERE `entry` IN (34705,36088,35572,36089,34702,36082,35569,36085,34701,36083,35571,36090,34657,36086,35570,36091,35617,36084,34703,36087); -- Champions
