UPDATE `quest_template` SET `RequiredRaces`=690,`RewardMailTemplateId`=108,`RewardMailDelay`=86400,`RewardFactionid1`=169,`RewardFactionValueId1`=3 WHERE `id`=6963;
DELETE FROM `mail_loot_template` WHERE `entry`=108;
INSERT INTO `mail_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(108,17712,100,1,0,1,1);