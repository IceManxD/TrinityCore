-- Desecration Stalker
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2|128 WHERE `entry`=35614;
-- Fountain of Light
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|4, `flags_extra`=`flags_extra`|2 WHERE `entry`=35311;

DELETE FROM `creature_template_addon` WHERE `entry` IN (35614,35311);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(35614,0,0,0,0,0,'67782'), -- Desecration Stalker (Desecration)
(35311,0,0,0,0,0,'67196'); -- Fountain of Light (Light Rain)

DELETE FROM `spell_script_names` WHERE `spell_id`=66515;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(66515, 'spell_paletress_reflective_shield');
