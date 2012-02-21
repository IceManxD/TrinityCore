DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=50218;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,50218,0,18,1,27959,0,0,'','Spell only target this Creature');

/*
-- delete existing aura from all pets (Character DB)
DELETE FROM `pet_aura` WHERE `spell`=50218;
*/
