/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Undercity
SD%Complete: 95
SDComment: Quest support: 6628, 9180(post-event).
SDCategory: Undercity
EndScriptData */

/* ContentData
npc_lady_sylvanas_windrunner
npc_highborne_lamenter
npc_parqual_fintallas
EndContentData */

#include "ScriptPCH.h"

/*######
## boss_lady_sylvanas_windrunner
######*/

enum SylvanasMisc
{
    QUEST_JOURNEY_TO_UNDERCITY  = 9180,
    SAY_LAMENT_END              = -1000196,
    EMOTE_LAMENT_END            = -1000197,

    SOUND_CREDIT                = 10896,
    ENTRY_HIGHBORNE_LAMENTER    = 21628,
    ENTRY_HIGHBORNE_BUNNY       = 21641,

    SPELL_HIGHBORNE_AURA        = 37090,
    SPELL_SYLVANAS_CAST         = 36568,
    SPELL_RIBBON_OF_SOULS       = 34432,                   //the real one to use might be 37099

    // abilities
    SPELL_FADE              = 20672,
    SPELL_BLACK_ARROW       = 59712,
    SPELL_MULTI_SHOT        = 59713,
    SPELL_SHOOT             = 59710,
    SPELL_SUMMON_SKELETON   = 59711,

    NPC_SKELETON            = 6412,

    SAY_AGGRO               = 1,
    SAY_DEATH               = 2
};

float HighborneLoc[4][3]=
{
    {1285.41f, 312.47f, 0.51f},
    {1286.96f, 310.40f, 1.00f},
    {1289.66f, 309.66f, 1.52f},
    {1292.51f, 310.50f, 1.99f},
};

#define HIGHBORNE_LOC_Y             -61.00f
#define HIGHBORNE_LOC_Y_NEW         -55.50f

class boss_lady_sylvanas_windrunner : public CreatureScript
{
public:
    boss_lady_sylvanas_windrunner() : CreatureScript("boss_lady_sylvanas_windrunner") { }

    bool OnQuestReward(Player* /*player*/, Creature* creature, const Quest *_Quest, uint32 /*slot*/)
    {
        if (_Quest->GetQuestId() == QUEST_JOURNEY_TO_UNDERCITY)
        {
            CAST_AI(boss_lady_sylvanas_windrunner::boss_lady_sylvanas_windrunnerAI, creature->AI())->LamentEvent = true;
            CAST_AI(boss_lady_sylvanas_windrunner::boss_lady_sylvanas_windrunnerAI, creature->AI())->DoPlaySoundToSet(creature, SOUND_CREDIT);
            creature->CastSpell(creature, SPELL_SYLVANAS_CAST, false);

            for (uint8 i = 0; i < 4; ++i)
                creature->SummonCreature(ENTRY_HIGHBORNE_LAMENTER, HighborneLoc[i][0], HighborneLoc[i][1], HIGHBORNE_LOC_Y, HighborneLoc[i][2], TEMPSUMMON_TIMED_DESPAWN, 160000);
        }

        return true;
    }

    struct boss_lady_sylvanas_windrunnerAI : public ScriptedAI
    {
        boss_lady_sylvanas_windrunnerAI(Creature* creature) : ScriptedAI(creature) , summons(me) {}

        uint32  LamentEvent_Timer;
        bool    LamentEvent;
        uint64  targetGUID;

        void Reset()
        {
            LamentEvent_Timer = 5000;
            LamentEvent = false;
            targetGUID = 0;

            _fadeTimer = 10 *IN_MILLISECONDS;
            _blackarrowTimer = urand(6, 8) *IN_MILLISECONDS;
            _multishotTimer = urand(4, 6) *IN_MILLISECONDS;
            _shootTimer = urand(2, 4) *IN_MILLISECONDS;
            _summonskeletonTimer = 0;

            summons.DespawnAll();
        }

        void EnterCombat(Unit* /*who*/)
        {
            Talk(SAY_AGGRO);
        }

        void JustSummoned(Creature* summoned)
        {
            if (summoned->GetEntry() == ENTRY_HIGHBORNE_BUNNY)
            {
                summons.Summon(summoned);

                if (Creature* target = Unit::GetCreature(*summoned, targetGUID))
                {
                    target->MonsterMoveWithSpeed(target->GetPositionX(), target->GetPositionY(), me->GetPositionZ()+15.0f, 0);
                    // target->SetPosition(target->GetPositionX(), target->GetPositionY(), me->GetPositionZ()+15.0f, 0.0f);
                    summoned->CastSpell(target, SPELL_RIBBON_OF_SOULS, false);
                }

                summoned->AddUnitMovementFlag(MOVEMENTFLAG_LEVITATING);
                targetGUID = summoned->GetGUID();
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (LamentEvent)
            {
                if (LamentEvent_Timer <= diff)
                {
                    DoSummon(ENTRY_HIGHBORNE_BUNNY, me, 10.0f, 3000, TEMPSUMMON_TIMED_DESPAWN);

                    LamentEvent_Timer = 2000;
                    if (!me->HasAura(SPELL_SYLVANAS_CAST))
                    {
                        DoScriptText(SAY_LAMENT_END, me);
                        DoScriptText(EMOTE_LAMENT_END, me);
                        LamentEvent = false;
                    }
                }
                else
                    LamentEvent_Timer -= diff;
            }

            if (!UpdateVictim())
                return;

            if (_fadeTimer <= diff)
            {
                DoCast(SPELL_FADE);
                _fadeTimer = 10 *IN_MILLISECONDS;
            }
            else
                _fadeTimer -= diff;

            if (_blackarrowTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0);
                if (target)
                {
                    DoCast(target, SPELL_BLACK_ARROW);
                    _blackarrowTimer = urand(12, 15) *IN_MILLISECONDS;
                }
            }
            else
                _blackarrowTimer -= diff;

            if (_multishotTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1);
                if (target)
                {
                    DoCast(target, SPELL_MULTI_SHOT);
                    _multishotTimer = urand(8, 10) *IN_MILLISECONDS;
                }
            }
            else
                _multishotTimer -= diff;

            if (_shootTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1);
                if (target)
                {
                    DoCast(target, SPELL_SHOOT);
                    _shootTimer = urand(2, 4) *IN_MILLISECONDS;
                }
            }
            else
                _shootTimer -= diff;

            if (_summonskeletonTimer <= diff)
            {
                DoCast(SPELL_SUMMON_SKELETON);
                _summonskeletonTimer = 10 *IN_MILLISECONDS;
            }
            else
                _summonskeletonTimer -= diff;

            DoMeleeAttackIfReady();
        }

        void KilledUnit (Unit* victim)
        {
            me->SummonCreature(NPC_SKELETON, victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 0);
        }

        void JustDied (Unit* /*victim*/)
        {
            summons.DespawnAll();
            Talk(SAY_DEATH);
        }

    private:
        SummonList summons;
        uint32  _fadeTimer;
        uint32  _blackarrowTimer;
        uint32  _multishotTimer;
        uint32  _shootTimer;
        uint32  _summonskeletonTimer;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_lady_sylvanas_windrunnerAI (creature);
    }

};

/*######
## npc_highborne_lamenter
######*/

class npc_highborne_lamenter : public CreatureScript
{
public:
    npc_highborne_lamenter() : CreatureScript("npc_highborne_lamenter") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_highborne_lamenterAI (creature);
    }

    struct npc_highborne_lamenterAI : public ScriptedAI
    {
        npc_highborne_lamenterAI(Creature* c) : ScriptedAI(c) {}

        uint32 EventMove_Timer;
        uint32 EventCast_Timer;
        bool EventMove;
        bool EventCast;

        void Reset()
        {
            EventMove_Timer = 10000;
            EventCast_Timer = 17500;
            EventMove = true;
            EventCast = true;
        }

        void EnterCombat(Unit* /*who*/) {}

        void UpdateAI(const uint32 diff)
        {
            if (EventMove)
            {
                if (EventMove_Timer <= diff)
                {
                    me->AddUnitMovementFlag(MOVEMENTFLAG_LEVITATING);
                    me->MonsterMoveWithSpeed(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW, me->GetDistance(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW) / (5000 * 0.001f));
                    me->SetPosition(me->GetPositionX(), me->GetPositionY(), HIGHBORNE_LOC_Y_NEW, me->GetOrientation());
                    EventMove = false;
                } else EventMove_Timer -= diff;
            }
            if (EventCast)
            {
                if (EventCast_Timer <= diff)
                {
                    DoCast(me, SPELL_HIGHBORNE_AURA);
                    EventCast = false;
                } else EventCast_Timer -= diff;
            }
        }
    };

};

/*######
## npc_parqual_fintallas
######*/

#define SPELL_MARK_OF_SHAME 6767

#define GOSSIP_HPF1 "Gul'dan"
#define GOSSIP_HPF2 "Kel'Thuzad"
#define GOSSIP_HPF3 "Ner'zhul"

class npc_parqual_fintallas : public CreatureScript
{
public:
    npc_parqual_fintallas() : CreatureScript("npc_parqual_fintallas") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player, SPELL_MARK_OF_SHAME, false);
        }
        if (uiAction == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();
            player->AreaExploredOrEventHappens(6628);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(6628) == QUEST_STATUS_INCOMPLETE && !player->HasAura(SPELL_MARK_OF_SHAME))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HPF1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HPF2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HPF3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(5822, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(5821, creature->GetGUID());

        return true;
    }

};

/*######
## AddSC
######*/

void AddSC_undercity()
{
    new boss_lady_sylvanas_windrunner();
    new npc_highborne_lamenter();
    new npc_parqual_fintallas();
}
