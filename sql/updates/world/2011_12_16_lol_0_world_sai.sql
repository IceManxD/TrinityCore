UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27636,0,0,0,0,0,100,2,2000,4000,2000,4000,11,50705,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ley-Whelp - IC - cast Arcane Bolt'),
(27636,0,1,0,0,0,100,4,2000,4000,2000,4000,11,59210,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ley-Whelp - IC - cast Arcane Bolt H'),

(27633,0,0,0,0,0,100,0,3000,5000,6000,8000,11,50573,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Arcane Cleave'),
(27633,0,1,0,0,0,100,0,9000,10000,15000,20000,11,50690,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Immobilizing Field'),
(27633,0,2,0,9,0,100,2,5,30,3000,5000,11,51454,0,0,0,0,0,6,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Throw'),
(27633,0,3,0,9,0,100,4,5,30,3000,5000,11,59209,0,0,0,0,0,6,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Throw H'),

(27635,0,0,0,0,0,100,2,3000,5000,12000,14000,11,50702,0,0,0,0,0,1,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Arcane Volley '),
(27635,0,1,0,0,0,100,4,3000,5000,12000,14000,11,59212,0,0,0,0,0,1,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Arcane Volley H'),
(27635,0,2,0,0,0,100,2,7000,9000,15000,20000,11,50566,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Mind Warp'),
(27635,0,3,0,0,0,100,4,7000,9000,15000,20000,11,38047,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Mind Warp H'),
(27635,0,4,0,0,0,100,0,10000,13000,20000,25000,11,50572,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Power Sap'),

(27638,0,0,0,0,0,100,2,0,5000,6000,8000,11,49549,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ring Guardian - IC - cast Ice Beam'),
(27638,0,1,0,0,0,100,4,0,5000,6000,8000,11,59211,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ring Guardian - IC - cast Ice Beam H'),

(27641,0,0,0,25,0,100,0,0,0,0,0,75,69844,0,0,0,0,0,1,0,0,0,0,0,0,0,'Centrifuge Construct - On Reset - add Aura: Vertex Color Bright Red'),
(27641,0,1,0,4,0,100,0,0,0,0,0,28,69844,0,0,0,0,0,1,0,0,0,0,0,0,0,'Centrifuge Construct - On Aggro - remove Aura: Vertex Color Bright Red'),

(27640,0,0,0,23,0,100,2,50717,0,0,0,11,50717,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ring-Lord Conjurer - On missing Aura: Charged Skin - cast Charged Skin'),
(27640,0,1,0,23,0,100,4,59276,0,0,0,11,59276,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ring-Lord Conjurer - On missing Aura: Charged Skin H - cast Charged Skin H'),
-- may implement beam to misc Centrifuge Construct

(27639,0,0,0,0,0,100,2,5000,7000,12000,14000,11,50715,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Blizzard'),
(27639,0,1,0,0,0,100,4,5000,7000,12000,14000,11,59278,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Blizzard H'),
(27639,0,2,0,0,0,100,2,2000,4000,8000,10000,11,16102,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Flamestrike'),
(27639,0,3,0,0,0,100,4,2000,4000,8000,10000,11,61402,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Flamestrike H'),
-- may implement beam to misc Centrifuge Construct

(28276,0,0,0,0,0,100,2,2000,4000,2000,4000,11,50705,0,0,0,0,0,2,0,0,0,0,0,0,0,'Greater Ley-Whelp - IC - cast Arcane Bolt'),
(28276,0,1,0,0,0,100,4,2000,4000,2000,4000,11,59210,0,0,0,0,0,2,0,0,0,0,0,0,0,'Greater Ley-Whelp - IC - cast Arcane Bolt H'),

-- Mage-Lord Urom Adds
(27642,0,0,0,9,0,100,0,8,25,6000,8000,11,32323,0,0,0,0,0,6,0,0,0,0,0,0,0,'Phantasmal Mammoth - IC - cast Charge'),
(27642,0,1,0,0,0,100,0,4000,6000,10000,12000,11,51253,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Mammoth - IC - cast Trample'),

(27644,0,0,0,0,0,100,2,3000,6000,12000,14000,11,50728,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Furious Howl'),
(27644,0,1,0,0,0,100,4,3000,6000,12000,14000,11,59274,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Furious Howl H'),
(27644,0,2,0,0,0,100,2,5000,8000,14000,17000,11,50729,0,0,0,0,0,2,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Carnivorous Bite'),
(27644,0,3,0,0,0,100,4,5000,8000,14000,17000,11,59269,0,0,0,0,0,2,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Carnivorous Bite H'),

(27645,0,0,0,0,0,100,2,6000,8000,10000,12000,11,59220,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Chain Lightning'),
(27645,0,1,0,0,0,100,4,6000,8000,10000,12000,11,15588,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Chain Lightning H'),
(27645,0,2,0,0,0,100,2,2000,4000,12000,14000,11,15588,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Thunderclap'),
(27645,0,3,0,0,0,100,4,2000,4000,12000,14000,11,59217,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Thunderclap H'),

(27650,0,0,0,4,0,100,2,0,0,0,0,11,25020,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Air - On Aggro - cast Lightning Shield'),
(27650,0,1,0,4,0,100,4,0,0,0,0,11,20545,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Air - On Aggro - cast Lightning Shield H'),

(27651,0,0,0,0,0,100,2,3000,5000,5000,8000,11,50744,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Fire - IC - cast Blaze'),
(27651,0,1,0,0,0,100,4,3000,5000,5000,8000,11,59225,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Fire - IC - cast Blaze H'),

(27653,0,0,0,0,0,100,2,3000,5000,7000,9000,11,37924,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Water - IC - cast Water Bolt Volley'),
(27653,0,1,0,0,0,100,4,3000,5000,7000,9000,11,59266,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Water - IC - cast Water Bolt Volley H'),

(27647,0,0,0,0,0,100,0,2000,5000,7000,9000,11,50731,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Ogre - IC - cast Mace Smash'),
(27647,0,1,0,4,0,100,0,0,0,0,0,11,50730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Ogre - On Aggro - cast Bloodlust'),

(27648,0,0,0,0,0,100,2,3000,5000,8000,10000,11,50732,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Water Tomb'),
(27648,0,1,0,0,0,100,4,3000,5000,8000,10000,11,59261,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Water Tomb H'),
(27648,0,2,0,0,0,100,0,4000,6000,6000,8000,11,49711,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Hooked Net');