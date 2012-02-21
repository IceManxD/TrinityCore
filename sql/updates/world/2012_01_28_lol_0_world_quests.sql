-- fix questchain of 12394 Candy Bucket, there should be no chain
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (12394);

-- fix questchain of 12935 The Amphitheater of Anguish: Tuskarrmageddon!
UPDATE `quest_template` SET `PrevQuestId`=12934, `NextQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (12935);

UPDATE creature_template SET ScriptName = 'npc_zeppit' WHERE entry=22484;

UPDATE `gameobject_template` SET `ScriptName` = 'go_scourge_cage', `AIName`='' WHERE `entry` IN
(187854, 187855, 187856, 187857, 187858, 187859, 187860, 187862, 187863, 187864, 187865, 187866,
187867, 187868, 187870, 187871, 187872, 187873, 187874, 187861);
