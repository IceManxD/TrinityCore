#### NEXUS ####
-- Chaotic Rift's shouldn't kill each other 
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (26918,30522);
-- remove visual Death States
UPDATE `creature_template` SET `unit_flags`=0x00008040 WHERE `entry` IN (26737,30519, 26734,30516);
UPDATE `creature` SET `unit_flags`=0,`dynamicflags`=`dynamicflags`&~32 WHERE `id` IN (26734,30516,26735,30517,26736,30518,26737,30519,26746,30520,26761,30521);
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`&~32 WHERE `entry` IN (26734,30516,26735,30517,26736,30518,26737,30519,26746,30520,26761,30521);
-- remove Feign Death Aura
UPDATE `creature_addon` SET `auras`='' WHERE `guid` BETWEEN 126481 AND 126598;
-- improve Azure Skyrazor position
UPDATE `creature` SET 
`position_z`=-10,
`orientation`= 
    CASE `guid` 
        WHEN 126505 THEN 2.15 
        WHEN 126506 THEN 5.47
    END
WHERE `guid` IN (126505,126506);

#### DRAK THARON ####
-- Drakkari Guardian (not all creatures in the instance should be dead)
UPDATE `creature_template` SET 
	`faction_A`=1814,
	`faction_H`=1814,
	`unit_flags`=`unit_flags`&~33554432&~2,
	`dynamicflags`=`dynamicflags`&~32,
	`type_flags`=`type_flags`&~128,
	`flags_extra`=`flags_extra`&~2 
WHERE `entry` IN (26620,31339); 

-- define living and dead creatures
UPDATE `creature` SET 
	`unit_flags`= IF(`guid` IN (127589,127590,127580,127591,127579,127578,127582),0,(`unit_flags`|33554432|512|2)),
	`dynamicflags`= IF(`guid` IN (127589,127590,127580,127591,127579,127578,127582),0,(`dynamicflags`|32))
WHERE `id`=26620;

-- to avoid to kill each other
UPDATE `creature_template` SET `faction_A`=1814,`faction_H`=1814 WHERE `entry` IN 
(
26639,  -- Drakkari Shaman
31345,  -- Drakkari Shaman H
26830,  -- Risen Drakkari Death Knight
31352,  -- Risen Drakkari Death Knight H
27431,  -- Drakkari Commander
31338   -- Drakkari Commander H
);