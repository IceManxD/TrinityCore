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

// Spells
enum Spells
{
    SPELL_ENRAGE                                  = 55285,
    H_SPELL_ENRAGE                                = 59828,
    SPELL_IMPALING_CHARGE                         = 54956,
    H_SPELL_IMPALING_CHARGE                       = 59827,
    SPELL_STOMP                                   = 55292,
    H_SPELL_STOMP                                 = 59829,
    SPELL_PUNCTURE                                = 55276,
    H_SPELL_PUNCTURE                              = 59826,
    SPELL_STAMPEDE                                = 55218,
    SPELL_WHIRLING_SLASH                          = 55250,
    H_SPELL_WHIRLING_SLASH                        = 59824,
    SPELL_IMPALING_CHARGE_VEHICLE                 = 54958,
    // Rhino Spirit
    SPELL_STAMPEDE_DMG                            = 55220,
    H_SPELL_STAMPEDE_DMG                          = 59823
};

// Yells
enum Yells
{
    SAY_AGGRO                                     = -1604019,
    SAY_TRANSFORM_1                               = -1604020,
    SAY_TRANSFORM_2                               = -1604021,
    SAY_SUMMON_1                                  = -1604022,
    SAY_SUMMON_2                                  = -1604023,
    SAY_SUMMON_3                                  = -1604024,
    SAY_SLAY_1                                    = -1604025,
    SAY_SLAY_2                                    = -1604026,
    SAY_SLAY_3                                    = -1604027,
    SAY_DEATH                                     = -1604028

};

enum Achievements
{
    DATA_SHARE_THE_LOVE = 1
};

enum Displays
{
    DISPLAY_RHINO                                 = 26265,
    DISPLAY_TROLL                                 = 27061
};

enum CombatPhase
{
    TROLL,
    RHINO
};

class boss_gal_darah : public CreatureScript
{
public:
    boss_gal_darah() : CreatureScript("boss_gal_darah") { }

    struct boss_gal_darahAI : public ScriptedAI
    {
        boss_gal_darahAI(Creature* c) : ScriptedAI(c)
        {
            instance = c->GetInstanceScript();
        }

        uint32 uiStampedeTimer;
        uint32 uiWhirlingSlashTimer;
        uint32 uiPunctureTimer;
        uint32 uiEnrageTimer;
        uint32 uiImpalingChargeTimer;
        uint32 uiStompTimer;
        uint32 uiTransformationTimer;
        std::set<uint64> impaledPlayers;

        CombatPhase Phase;
        uint8 uiPhaseCounter;
        bool bStartOfTransformation;
        bool bTransformated;

        InstanceScript* instance;

        void Reset()
        {
            uiStampedeTimer = 10*IN_MILLISECONDS;
            uiWhirlingSlashTimer = 20*IN_MILLISECONDS;
            uiPunctureTimer = 5*IN_MILLISECONDS;
            uiEnrageTimer = 15*IN_MILLISECONDS;
            uiImpalingChargeTimer = 20*IN_MILLISECONDS;
            uiStompTimer = 10*IN_MILLISECONDS;
            uiTransformationTimer = 6*IN_MILLISECONDS;
            uiPhaseCounter = 0;

            impaledPlayers.clear();

            bStartOfTransformation = true;
            bTransformated = false;

            Phase = TROLL;
            me->SetDisplayId(DISPLAY_TROLL);

            if (instance)
                instance->SetData(DATA_GAL_DARAH_EVENT, NOT_STARTED);
        }

        void EnterEvadeMode()
        {
            me->ClearUnitState(UNIT_STATE_STUNNED | UNIT_STATE_ROOT);
            me->SetReactState(REACT_AGGRESSIVE);
            ScriptedAI::EnterEvadeMode();
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoScriptText(SAY_AGGRO, me);

            if (instance)
                instance->SetData(DATA_GAL_DARAH_EVENT, IN_PROGRESS);
        }

        uint32 GetData(uint32 type)
        {
            if (type == DATA_SHARE_THE_LOVE)
                return impaledPlayers.size();

            return 0;
        }

        void JustSummoned(Creature* summon)
        {
            summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
            summon->DespawnOrUnsummon(1500);

            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                summon->CastSpell(target, DUNGEON_MODE(SPELL_STAMPEDE_DMG, H_SPELL_STAMPEDE_DMG), true);
        }

        void KilledUnit(Unit* victim)
        {
            if (victim == me)
                return;

            DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2, SAY_SLAY_3), me);
        }

        void JustDied(Unit* /*killer*/)
        {
            DoScriptText(SAY_DEATH, me);

            if (instance)
                instance->SetData(DATA_GAL_DARAH_EVENT, DONE);
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (!bTransformated && HealthBelowPct(50)) // transform at least once at 50% health
            {
                bTransformated = true;
                uiPhaseCounter = 2;
            }

            switch (Phase)
            {
                case TROLL:
                    if (uiPhaseCounter >= 2)
                    {
                        if (uiTransformationTimer <= diff)
                        {
                            me->SetDisplayId(DISPLAY_RHINO);
                            Phase = RHINO;
                            uiPhaseCounter = 0;
                            DoScriptText(SAY_TRANSFORM_1, me);
                            uiTransformationTimer = 5*IN_MILLISECONDS;
                            bStartOfTransformation = true;
                            bTransformated = true;
                            me->ClearUnitState(UNIT_STATE_STUNNED|UNIT_STATE_ROOT);
                            me->SetReactState(REACT_AGGRESSIVE);
                        }
                        else
                        {
                            uiTransformationTimer -= diff;

                            if (bStartOfTransformation)
                            {
                                bStartOfTransformation = false;
                                me->AddUnitState(UNIT_STATE_STUNNED|UNIT_STATE_ROOT);
                                me->SetReactState(REACT_PASSIVE);
                            }
                        }
                    }
                    else
                    {
                        if (uiStampedeTimer <= diff)
                        {
                            DoCast(SPELL_STAMPEDE);
                            DoScriptText(RAND(SAY_SUMMON_1, SAY_SUMMON_2, SAY_SUMMON_3), me);
                            uiStampedeTimer = urand(10, 15) *IN_MILLISECONDS;
                        } else uiStampedeTimer -= diff;

                        if (uiWhirlingSlashTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_WHIRLING_SLASH, H_SPELL_WHIRLING_SLASH));
                            uiWhirlingSlashTimer = urand(18, 22) *IN_MILLISECONDS;
                            ++uiPhaseCounter;
                        } else uiWhirlingSlashTimer -= diff;
                    }
                    break;
                case RHINO:
                    if (uiPhaseCounter >= 2)
                    {
                        if (uiTransformationTimer <= diff)
                        {
                            me->SetDisplayId(DISPLAY_TROLL);
                            Phase = TROLL;
                            uiPhaseCounter = 0;
                            DoScriptText(SAY_TRANSFORM_2, me);
                            uiTransformationTimer = 6*IN_MILLISECONDS;
                            bStartOfTransformation = true;
                            me->ClearUnitState(UNIT_STATE_STUNNED|UNIT_STATE_ROOT);
                            me->SetReactState(REACT_AGGRESSIVE);
                        }
                        else
                        {
                            uiTransformationTimer -= diff;

                            if (bStartOfTransformation)
                            {
                                bStartOfTransformation = false;
                                me->AddUnitState(UNIT_STATE_STUNNED|UNIT_STATE_ROOT);
                                me->SetReactState(REACT_PASSIVE);
                            }
                        }
                    }
                    else
                    {
                        if (uiPunctureTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_PUNCTURE, H_SPELL_PUNCTURE));
                            uiPunctureTimer = 15*IN_MILLISECONDS;
                        } else uiPunctureTimer -= diff;

                        if (uiEnrageTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_ENRAGE, H_SPELL_ENRAGE));
                            uiEnrageTimer = 20*IN_MILLISECONDS;
                        } else uiEnrageTimer -= diff;

                        if (uiStompTimer <= diff)
                        {
                            DoCast(me->getVictim(), DUNGEON_MODE(SPELL_STOMP, H_SPELL_STOMP));
                            uiStompTimer = urand(10, 15) *IN_MILLISECONDS;
                        } else uiStompTimer -= diff;

                        if (uiImpalingChargeTimer <= diff)
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
                            {
                                DoCast(target, DUNGEON_MODE(SPELL_IMPALING_CHARGE, H_SPELL_IMPALING_CHARGE));
                                target->CastSpell(me, SPELL_IMPALING_CHARGE_VEHICLE, true);
                                impaledPlayers.insert(target->GetGUID());
                            }
                            uiImpalingChargeTimer = 20*IN_MILLISECONDS;
                            ++uiPhaseCounter;
                        } else uiImpalingChargeTimer -= diff;
                    }
                    break;
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_gal_darahAI(creature);
    }
};

class achievement_share_the_love : public AchievementCriteriaScript
{
    public:
        achievement_share_the_love() : AchievementCriteriaScript("achievement_share_the_love")
        {
        }

        bool OnCheck(Player* /*player*/, Unit* target)
        {
            if (!target)
                return false;

            if (Creature* GalDarah = target->ToCreature())
                if (GalDarah->AI()->GetData(DATA_SHARE_THE_LOVE) >= 5)
                    return true;

            return false;
        }
};

void AddSC_boss_gal_darah()
{
    new boss_gal_darah();
    new achievement_share_the_love();
}
