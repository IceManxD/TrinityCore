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
#include "naxxramas.h"

// Stalagg
enum StalaggYells
{
    SAY_STAL_AGGRO          = -1533023, //not used
    SAY_STAL_SLAY           = -1533024, //not used
    SAY_STAL_DEATH          = -1533025  //not used
};

enum StalagSpells
{
    SPELL_POWERSURGE        = 28134,
    H_SPELL_POWERSURGE      = 54529,
    SPELL_MAGNETIC_PULL     = 28338,
    SPELL_STALAGG_TESLA     = 28097
};

// Feugen
enum FeugenYells
{
    SAY_FEUG_AGGRO          = -1533026, //not used
    SAY_FEUG_SLAY           = -1533027, //not used
    SAY_FEUG_DEATH          = -1533028 //not used
};

enum FeugenSpells
{
    SPELL_STATICFIELD       = 28135,
    H_SPELL_STATICFIELD     = 54528,
    SPELL_FEUGEN_TESLA      = 28109
};

// Thaddius DoAction
enum ThaddiusActions
{
    ACTION_FEUGEN_RESET,
    ACTION_FEUGEN_DIED,
    ACTION_STALAGG_RESET,
    ACTION_STALAGG_DIED
};

// generic
#define C_TESLA_COIL            16218           //the coils (emotes "Tesla Coil overloads!")

// Thaddius
enum ThaddiusYells
{
    SAY_GREET               = -1533029, //not used
    SAY_AGGRO_1             = -1533030,
    SAY_AGGRO_2             = -1533031,
    SAY_AGGRO_3             = -1533032,
    SAY_SLAY                = -1533033,
    SAY_ELECT               = -1533034, //not used
    SAY_DEATH               = -1533035,
    SAY_SCREAM1             = -1533036, //not used
    SAY_SCREAM2             = -1533037, //not used
    SAY_SCREAM3             = -1533038, //not used
    SAY_SCREAM4             = -1533039 //not used
};

enum ThaddiusSpells
{
    SPELL_POLARITY_SHIFT        = 28089,
    SPELL_POSITIVE_CHARGE       = 28059,
    SPELL_NEGATIVE_CHARGE       = 28084,
    SPELL_BALL_LIGHTNING        = 28299,
    SPELL_CHAIN_LIGHTNING       = 28167,
    H_SPELL_CHAIN_LIGHTNING     = 54531,
    SPELL_BERSERK               = 27680,
    SPELL_POSITIVE_CHARGE_AURA  = 28062,
    SPELL_POSITIVE_CHARGE_STACK = 29659,
    SPELL_NEGATIVE_CHARGE_AURA  = 28085,
    SPELL_NEGATIVE_CHARGE_STACK = 29660
};

enum Events
{
    EVENT_NONE,
    EVENT_SHIFT,
    EVENT_CHAIN,
    EVENT_BERSERK,
};

enum Achievement
{
    DATA_SHOCKING = 76047605
};

class boss_thaddius : public CreatureScript
{
public:
    boss_thaddius() : CreatureScript("boss_thaddius") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_thaddiusAI(creature);
    }

    struct boss_thaddiusAI : public BossAI
    {
        boss_thaddiusAI(Creature* c) : BossAI(c, BOSS_THADDIUS)
        {
            // init is a bit tricky because thaddius shall track the life of both adds, but not if there was a wipe
            // and, in particular, if there was a crash after both adds were killed (should not respawn)

            // Moreover, the adds may not yet be spawn. So just track down the status if mob is spawn
            // and each mob will send its status at reset (meaning that it is alive)
            checkFeugenAlive = false;
            if (Creature* Feugen = me->GetCreature(*me, instance ? instance->GetData64(DATA_FEUGEN) : 0))
                checkFeugenAlive = Feugen->isAlive();

            checkStalaggAlive = false;
            if (Creature* Stalagg = me->GetCreature(*me, instance ? instance->GetData64(DATA_STALAGG) : 0))
                checkStalaggAlive = Stalagg->isAlive();

            if (!checkFeugenAlive && !checkStalaggAlive)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_AGGRESSIVE);
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_PASSIVE);
            }
        }

        bool checkStalaggAlive;
        bool checkFeugenAlive;
        bool shocking;
        uint32 addsTimer;

        void Reset()
        {
            _Reset();
            shocking = true;

            if (Creature* Feugen = me->GetCreature(*me, instance ? instance->GetData64(DATA_FEUGEN) : 0))
            {
                Feugen->Respawn(true);
                checkFeugenAlive = Feugen->isAlive();
            }

            if (Creature* Stalagg = me->GetCreature(*me, instance ? instance->GetData64(DATA_STALAGG) : 0))
            {
                Stalagg->Respawn(true);
                checkStalaggAlive = Stalagg->isAlive();
            }

            if (!checkFeugenAlive && !checkStalaggAlive)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_AGGRESSIVE);
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_PASSIVE);
            }
        }

        void KilledUnit(Unit* /*victim*/)
        {
            if (!(rand()%5))
                DoScriptText(SAY_SLAY, me);
        }

        void JustDied(Unit* /*killer*/)
        {
            _JustDied();
            DoScriptText(SAY_DEATH, me);

            if (instance)
            {
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_POSITIVE_CHARGE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_NEGATIVE_CHARGE);
            }
        }

        void DoAction(int32 const action)
        {
            switch (action)
            {
                case ACTION_FEUGEN_RESET:
                    checkFeugenAlive = true;
                    break;
                case ACTION_FEUGEN_DIED:
                    checkFeugenAlive = false;
                    break;
                case ACTION_STALAGG_RESET:
                    checkStalaggAlive = true;
                    break;
                case ACTION_STALAGG_DIED:
                    checkStalaggAlive = false;
                    break;
            }

            if (!checkFeugenAlive && !checkStalaggAlive)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                // REACT_AGGRESSIVE only reset when he takes damage.
                DoZoneInCombat();
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_PASSIVE);
            }
        }

        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            DoScriptText(RAND(SAY_AGGRO_1, SAY_AGGRO_2, SAY_AGGRO_3), me);
            events.ScheduleEvent(EVENT_SHIFT, 30000);
            events.ScheduleEvent(EVENT_CHAIN, urand(10000, 20000));
            events.ScheduleEvent(EVENT_BERSERK, 360000);
        }

        void DamageTaken(Unit* /*attacker*/, uint32 & /*damage*/)
        {
            me->SetReactState(REACT_AGGRESSIVE);
        }

        void SetData(uint32 id, uint32 data)
        {
            if (id == DATA_SHOCKING)
                shocking = false;
        }

        uint32 GetData(uint32 id)
        {
            if (id != DATA_SHOCKING)
                return 0;

            return uint32(shocking);
        }

        void UpdateAI(uint32 const diff)
        {
            if (checkFeugenAlive && checkStalaggAlive)
                addsTimer = 0;

            if (checkStalaggAlive != checkFeugenAlive)
            {
                addsTimer += diff;
                if (addsTimer > 5000)
                {
                    if (!checkStalaggAlive)
                    {
                        if (Creature* Stalagg = me->GetCreature(*me, instance ? instance->GetData64(DATA_STALAGG) : 0))
                            Stalagg->Respawn();
                    }
                    else
                    {
                        if (Creature* Feugen = me->GetCreature(*me, instance ? instance->GetData64(DATA_FEUGEN) : 0))
                            Feugen->Respawn();
                    }
                }
            }

            if (!UpdateVictim())
                return;

            _DoAggroPulse(diff);
            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SHIFT:
                        DoCastAOE(SPELL_POLARITY_SHIFT);
                        events.ScheduleEvent(EVENT_SHIFT, 30000);
                        events.RescheduleEvent(EVENT_CHAIN, 6000);
                        return;
                    case EVENT_CHAIN:
                        DoCastVictim(RAID_MODE(SPELL_CHAIN_LIGHTNING, H_SPELL_CHAIN_LIGHTNING));
                        events.ScheduleEvent(EVENT_CHAIN, urand(10000, 20000));
                        return;
                    case EVENT_BERSERK:
                        me->InterruptNonMeleeSpells(false);
                        DoCast(me, SPELL_BERSERK);
                        return;
                }
            }

            if (events.GetTimer() > 15000 && !SelectTarget(SELECT_TARGET_RANDOM, 0, me->GetMeleeReach(), true))
                DoCastVictim(SPELL_BALL_LIGHTNING);
            else
                DoMeleeAttackIfReady();
        }
    };
};

class mob_stalagg : public CreatureScript
{
public:
    mob_stalagg() : CreatureScript("mob_stalagg") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_stalaggAI(creature);
    }

    struct mob_stalaggAI : public ScriptedAI
    {
        mob_stalaggAI(Creature* c) : ScriptedAI(c)
        {
            instance = c->GetInstanceScript();
        }

        InstanceScript* instance;

        uint32 powerSurgeTimer;
        uint32 magneticPullTimer;

        void Reset()
        {
            if (Creature* Thaddius = me->GetCreature(*me, instance ? instance->GetData64(DATA_THADDIUS) : 0))
                if (Thaddius->AI())
                    Thaddius->AI()->DoAction(ACTION_STALAGG_RESET);
            powerSurgeTimer = urand(20000, 25000);
            magneticPullTimer = 20000;
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoCast(SPELL_STALAGG_TESLA);
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Creature* Thaddius = me->GetCreature(*me, instance ? instance->GetData64(DATA_THADDIUS) : 0))
                if (Thaddius->AI())
                    Thaddius->AI()->DoAction(ACTION_STALAGG_DIED);
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (magneticPullTimer <= diff)
            {
                if (Creature* Feugen = me->GetCreature(*me, instance ? instance->GetData64(DATA_FEUGEN) : 0))
                {
                    Unit* StalaggVictim = me->getVictim();
                    Unit* FeugenVictim = Feugen->getVictim();

                    if (FeugenVictim && StalaggVictim)
                    {
                        // magnetic pull is not working. So just jump.

                        // reset aggro to be sure that feugen will not follow the jump
                        Feugen->getThreatManager().addThreat(StalaggVictim, Feugen->getThreatManager().getThreat(FeugenVictim));
                        me->getThreatManager().addThreat(FeugenVictim, me->getThreatManager().getThreat(StalaggVictim));
                        Feugen->getThreatManager().modifyThreatPercent(FeugenVictim, -100);
                        me->getThreatManager().modifyThreatPercent(StalaggVictim, -100);

                        FeugenVictim->JumpTo(me, 0.3f);
                        StalaggVictim->JumpTo(Feugen, 0.3f);

                        me->GetMotionMaster()->MoveDistract(2500);
                        Feugen->GetMotionMaster()->MoveDistract(2500);
                    }
                }

                magneticPullTimer = 20000;
            }
            else
                magneticPullTimer -= diff;

            if (powerSurgeTimer <= diff)
            {
                DoCast(me, RAID_MODE(SPELL_POWERSURGE, H_SPELL_POWERSURGE));
                powerSurgeTimer = urand(15000, 20000);
            }
            else
                powerSurgeTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class mob_feugen : public CreatureScript
{
public:
    mob_feugen() : CreatureScript("mob_feugen") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_feugenAI(creature);
    }

    struct mob_feugenAI : public ScriptedAI
    {
        mob_feugenAI(Creature* c) : ScriptedAI(c)
        {
            instance = c->GetInstanceScript();
        }

        InstanceScript* instance;

        uint32 staticFieldTimer;

        void Reset()
        {
            if (Creature* Thaddius = me->GetCreature(*me, instance ? instance->GetData64(DATA_THADDIUS) : 0))
                if (Thaddius->AI())
                    Thaddius->AI()->DoAction(ACTION_FEUGEN_RESET);
            staticFieldTimer = 5000;
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoCast(SPELL_FEUGEN_TESLA);
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Creature* Thaddius = me->GetCreature(*me, instance ? instance->GetData64(DATA_THADDIUS) : 0))
                if (Thaddius->AI())
                    Thaddius->AI()->DoAction(ACTION_FEUGEN_DIED);
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (staticFieldTimer <= diff)
            {
                DoCast(me, RAID_MODE(SPELL_STATICFIELD, H_SPELL_STATICFIELD));
                staticFieldTimer = 5000;
            }
            else
                staticFieldTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class spell_thaddius_pos_neg_charge : public SpellScriptLoader
{
    public:
        spell_thaddius_pos_neg_charge() : SpellScriptLoader("spell_thaddius_pos_neg_charge") { }

        class spell_thaddius_pos_neg_charge_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_thaddius_pos_neg_charge_SpellScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_CHARGE_AURA))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_CHARGE_STACK))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_CHARGE_AURA))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_NEGATIVE_CHARGE_STACK))
                    return false;
                return true;
            }

            bool Load()
            {
                return GetOriginalCaster()->GetTypeId() == TYPEID_UNIT;
            }

            void HandleTargets(std::list<Unit*>& targetList)
            {
                uint8 count = 0;
                for (std::list<Unit*>::iterator ihit = targetList.begin(); ihit != targetList.end(); ++ihit)
                    if ((*ihit)->GetGUID() != GetCaster()->GetGUID())
                        if (Player* target = (*ihit)->ToPlayer())
                            if (target->HasAura(GetTriggeringSpell()->Id))
                                ++count;

                if (count)
                {
                    uint32 spellId = 0;

                    if (GetSpellInfo()->Id == SPELL_POSITIVE_CHARGE_AURA)
                        spellId = SPELL_POSITIVE_CHARGE_STACK;
                    else // if (GetSpellInfo()->Id == SPELL_NEGATIVE_CHARGE)
                        spellId = SPELL_NEGATIVE_CHARGE_STACK;

                    GetCaster()->SetAuraStack(spellId, GetCaster(), count);
                }
            }

            void HandleDamage(SpellEffIndex /*effIndex*/)
            {
                if (!GetTriggeringSpell())
                    return;

                Unit* target = GetHitUnit();
                Unit* caster = GetOriginalCaster();

                if (target->HasAura(GetTriggeringSpell()->Id))
                    SetHitDamage(0);
                else
                {
                    if (target->GetTypeId() == TYPEID_PLAYER && caster->IsAIEnabled)
                        caster->ToCreature()->AI()->SetData(DATA_SHOCKING, 0);
                }
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_thaddius_pos_neg_charge_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_thaddius_pos_neg_charge_SpellScript::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ALLY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_thaddius_pos_neg_charge_SpellScript();
        }
};

class achievement_shocking : public AchievementCriteriaScript
{
    public:
        achievement_shocking() : AchievementCriteriaScript("achievement_shocking") { }

        bool OnCheck(Player* /*source*/, Unit* target)
        {
            return target && target->GetAI()->GetData(DATA_SHOCKING);
        }
};

void AddSC_boss_thaddius()
{
    new boss_thaddius();
    new mob_stalagg();
    new mob_feugen();
    new spell_thaddius_pos_neg_charge();
    new achievement_shocking();
}
