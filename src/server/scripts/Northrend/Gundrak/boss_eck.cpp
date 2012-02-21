/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptPCH.h"
#include "gundrak.h"

enum Spells
{
    SPELL_ECK_BERSERK                             = 55816, //Eck goes berserk, increasing his attack speed by 150% and all damage he deals by 500%.
    SPELL_ECK_BITE                                = 55813, //Eck bites down hard, inflicting 150% of his normal damage to an enemy.
    SPELL_ECK_SPIT                                = 55814, //Eck spits toxic bile at enemies in a cone in front of him, inflicting 2970 Nature damage and draining 220 mana every 1 sec for 3 sec.
    SPELL_ECK_SPRING                              = 55815, //Eck leaps at a distant target.  --> Drops aggro and charges a random player. Tank can simply taunt him back.

    // ruins dweller spells
    SPELL_REGURGITATE                             = 55643,
    SPELL_SPRING                                  = 55652
};

class boss_eck : public CreatureScript
{
    public:
        boss_eck() : CreatureScript("boss_eck") { }

        struct boss_eckAI : public ScriptedAI
        {
            boss_eckAI(Creature* c) : ScriptedAI(c)
            {
                instance = c->GetInstanceScript();
            }

            void Reset()
            {
                _berserkTimer = 90*IN_MILLISECONDS;
                _biteTimer = 5*IN_MILLISECONDS;
                _spitTimer = 7*IN_MILLISECONDS;
                _springTimer = 12*IN_MILLISECONDS;
                _berserk = false;

                if (instance)
                    instance->SetData(DATA_ECK_THE_FEROCIOUS_EVENT, NOT_STARTED);
            }

            void EnterCombat(Unit* /*who*/)
            {
                if (instance)
                    instance->SetData(DATA_ECK_THE_FEROCIOUS_EVENT, IN_PROGRESS);
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (!_berserk)
                {
                    if (_berserkTimer <= diff)
                    {
                        DoCast(me, SPELL_ECK_BERSERK, true);
                        _berserk = true;
                    }
                    else
                        _berserkTimer -= diff;
                }

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if (_biteTimer <= diff)
                {
                    DoCastVictim(SPELL_ECK_BITE);
                    _biteTimer = urand(8, 12) *IN_MILLISECONDS;
                }
                else
                    _biteTimer -= diff;

                if (_spitTimer <= diff)
                {
                    DoCast(SPELL_ECK_SPIT);
                    _spitTimer = urand(11, 20) *IN_MILLISECONDS;
                }
                else
                    _spitTimer -= diff;

                if (_springTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 35.0f, true))
                    {
                        DoCast(target, SPELL_ECK_SPRING);
                        _springTimer = urand(9, 15) *IN_MILLISECONDS;
                        DoResetThreat();
                        DoZoneInCombat();
                        me->AddThreat(target, 1000);
                    }
                }
                else
                    _springTimer -= diff;

                DoMeleeAttackIfReady();
            }

            void JustDied(Unit* /*killer*/)
            {
                if (instance)
                    instance->SetData(DATA_ECK_THE_FEROCIOUS_EVENT, DONE);
            }

        private:
            InstanceScript* instance;
            uint32 _berserkTimer;
            uint32 _biteTimer;
            uint32 _spitTimer;
            uint32 _springTimer;
            bool _berserk;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_eckAI(creature);
        }
};

class npc_ruins_dweller : public CreatureScript
{
    public:
        npc_ruins_dweller() : CreatureScript("npc_ruins_dweller") { }

        struct npc_ruins_dwellerAI : public ScriptedAI
        {
            npc_ruins_dwellerAI(Creature* c) : ScriptedAI(c)
            {
                instance = c->GetInstanceScript();
            }

            void Reset()
            {
                _regurgitateTimer = urand(3, 6) *IN_MILLISECONDS;
                _springTimer = urand(7, 10) *IN_MILLISECONDS;
            }

            void JustDied(Unit* /*who*/)
            {
                if (instance)
                    instance->SetData(DATA_RUIN_DWELLER_DIED, 1);
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (_regurgitateTimer <= diff)
                {
                    DoCastVictim(SPELL_REGURGITATE);
                    _regurgitateTimer = urand(7, 18) *IN_MILLISECONDS;
                }
                else
                    _regurgitateTimer -= diff;

                if (_springTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 30.0f, true))
                        if (me->GetDistance(target) > 5.0f)
                        {
                            DoCast(target, SPELL_SPRING);
                            _springTimer = urand(12, 20) *IN_MILLISECONDS;
                            DoResetThreat();
                            DoZoneInCombat();
                            me->AddThreat(target, 1000);
                        }
                }
                else
                    _springTimer -= diff;

                DoMeleeAttackIfReady();
            }

        private:
            InstanceScript* instance;
            uint32 _springTimer;
            uint32 _regurgitateTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ruins_dwellerAI(creature);
        }
};

void AddSC_boss_eck()
{
    new boss_eck();
    new npc_ruins_dweller();
}
