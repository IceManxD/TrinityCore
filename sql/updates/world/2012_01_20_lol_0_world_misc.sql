DELETE FROM `script_texts` WHERE `entry` IN (-1603105,-1603106);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(32906,-1603105,'Allies of Nature have appeared!',NULL,NULL,'Verbündete der Natur erscheinen!',NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Freya EMOTE_ALLIES'),
(32906,-1603106,'A |cFF00FFFFLifebinder\'s Gift|R begins to grow!',NULL,NULL,'Ein |cFF00FFFFGeschenk der Lebensbinderin|R fängt an zu wachsen!',NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Freya EMOTE_GIFT');

-- Iron Roots
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `unit_flags`=`unit_flags`|0x4, `AIName`='' WHERE `entry` IN (33088,33168,33396,33397);
UPDATE `creature_template` SET `difficulty_entry_1`=33396 WHERE `entry`=33088;
UPDATE `creature_template` SET `difficulty_entry_1`=33397 WHERE `entry`=33168;
