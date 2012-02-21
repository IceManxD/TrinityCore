-- High Inquisitor Valroth is spawned by an Event
DELETE FROM `creature` WHERE `id`=29001;
-- Koltira Deathweaver - clear multiple Spawn
DELETE FROM `creature` WHERE `id`=28912 AND `guid` IN (410155,410375);
-- Koltira Deathweaver - reduce Respawn Time
UPDATE `creature` SET `spawntimesecs`=30 WHERE `guid`=130354;
