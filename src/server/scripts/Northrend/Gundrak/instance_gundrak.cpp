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

#define MAX_ENCOUNTER     5
#define MAX_DWELLER       6

/* GunDrak encounters:
0 - Slad'Ran
1 - Moorabi
2 - Drakkari Colossus
3 - Gal'Darah
4 - Eck the Ferocious
*/

class instance_gundrak : public InstanceMapScript
{
public:
    instance_gundrak() : InstanceMapScript("instance_gundrak", 604) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_gundrak_InstanceMapScript(map);
    }

    struct instance_gundrak_InstanceMapScript : public InstanceScript
    {
        instance_gundrak_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            heroicMode = map->IsHeroic();
        }

        bool heroicMode;
        bool spawnSupport;

        uint8 aliveDweller;
        uint32 timer;
        uint32 phase;
        uint64 toActivate;

        uint64 SladRan;
        uint64 Moorabi;
        uint64 DrakkariColossus;
        uint64 GalDarah;
        uint64 EckTheFerocious;

        uint64 SladRanAltar;
        uint64 MoorabiAltar;
        uint64 DrakkariColossusAltar;
        uint64 SladRanStatue;
        uint64 MoorabiStatue;
        uint64 DrakkariColossusStatue;
        uint64 GalDarahStatue;
        uint64 EckTheFerociousDoor;
        uint64 EckTheFerociousDoorBehind;
        uint64 GalDarahDoor1;
        uint64 GalDarahDoor2;
        uint64 GalDarahDoor3;
        uint64 Bridge;
        uint64 Collision;

        uint32 m_auiEncounter[MAX_ENCOUNTER];

        GOState SladRanStatueState;
        GOState MoorabiStatueState;
        GOState DrakkariColossusStatueState;
        GOState GalDarahStatueState;
        GOState BridgeState;
        GOState CollisionState;

        std::string str_data;

        void Initialize()
        {
            spawnSupport = false;
            aliveDweller = MAX_DWELLER;

            timer = 0;
            phase = 0;
            toActivate = 0;

            SladRan = 0;
            Moorabi = 0;
            DrakkariColossus = 0;
            GalDarah = 0;
            EckTheFerocious = 0;

            SladRanAltar = 0;
            MoorabiAltar = 0;
            DrakkariColossusAltar = 0;

            SladRanStatue = 0;
            MoorabiStatue = 0;
            DrakkariColossusStatue = 0;
            GalDarahStatue = 0;

            EckTheFerociousDoor = 0;
            EckTheFerociousDoorBehind = 0;
            GalDarahDoor1 = 0;
            GalDarahDoor2 = 0;
            GalDarahDoor3 = 0;

            Bridge = 0;
            Collision = 0;

            SladRanStatueState = GO_STATE_ACTIVE;
            MoorabiStatueState = GO_STATE_ACTIVE;
            DrakkariColossusStatueState = GO_STATE_ACTIVE;
            GalDarahStatueState = GO_STATE_READY;
            BridgeState = GO_STATE_ACTIVE;
            CollisionState = GO_STATE_READY;

            memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        }

       bool IsEncounterInProgress() const
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (m_auiEncounter[i] == IN_PROGRESS) return true;

            return false;
        }

        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
                case CREATURE_SLAD_RAN:
                    SladRan = creature->GetGUID();
                    break;
                case CREATURE_MOORABI:
                    Moorabi = creature->GetGUID();
                    break;
                case CREATURE_GALDARAH:
                    GalDarah = creature->GetGUID();
                    break;
                case CREATURE_DRAKKARICOLOSSUS:
                    DrakkariColossus = creature->GetGUID();
                    break;
                case CREATURE_ECK:
                    EckTheFerocious = creature->GetGUID();
                    creature->SetVisible((aliveDweller > 0) ? false : true);
                    break;
                case CREATURE_RUIN_DWELLER:
                    if (creature->isDead())
                        SetData(DATA_RUIN_DWELLER_DIED, 1);
                    break;
            }
        }

        void OnGameObjectCreate(GameObject* go)
        {
            switch (go->GetEntry())
            {
                case 192518:
                    SladRanAltar = go->GetGUID();
                    // Make sure that they start out as unusuable
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    if (m_auiEncounter[0] == DONE)
                    {
                        if (SladRanStatueState == GO_STATE_ACTIVE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        else
                        {
                            ++phase;
                            go->SetGoState(GO_STATE_ACTIVE);
                        }
                    }
                    break;
                case 192519:
                    MoorabiAltar = go->GetGUID();
                    // Make sure that they start out as unusuable
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    if (m_auiEncounter[0] == DONE)
                    {
                        if (MoorabiStatueState == GO_STATE_ACTIVE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        else
                        {
                            ++phase;
                            go->SetGoState(GO_STATE_ACTIVE);
                        }
                    }
                    break;
                case 192520:
                    DrakkariColossusAltar = go->GetGUID();
                    // Make sure that they start out as unusuable
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    if (m_auiEncounter[0] == DONE)
                    {
                        if (DrakkariColossusStatueState == GO_STATE_ACTIVE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        else
                        {
                            ++phase;
                            go->SetGoState(GO_STATE_ACTIVE);
                        }
                    }
                    break;
                case 192564:
                    SladRanStatue = go->GetGUID();
                    go->SetGoState(SladRanStatueState);
                    break;
                case 192565:
                    MoorabiStatue = go->GetGUID();
                    go->SetGoState(MoorabiStatueState);
                    break;
                case 192566:
                    GalDarahStatue = go->GetGUID();
                    go->SetGoState(GalDarahStatueState);
                    break;
                case 192567:
                    DrakkariColossusStatue = go->GetGUID();
                    go->SetGoState(DrakkariColossusStatueState);
                    break;
                case 192632:
                    EckTheFerociousDoor = go->GetGUID();
                    if (heroicMode && m_auiEncounter[1] == DONE)
                        HandleGameObject(0, true, go);
                    break;
                case 192569:
                    EckTheFerociousDoorBehind = go->GetGUID();
                    if (heroicMode && m_auiEncounter[4] == DONE)
                        HandleGameObject(0, true, go);
                case 193208:
                    GalDarahDoor1 = go->GetGUID();
                    if (m_auiEncounter[3] == DONE)
                        HandleGameObject(0, true, go);
                    break;
                case 193209:
                    GalDarahDoor2 = go->GetGUID();
                    if (m_auiEncounter[3] == DONE)
                        HandleGameObject(0, true, go);
                    break;
                case 192568:
                    GalDarahDoor3 = go->GetGUID();
                    break;
                case 193188:
                    Bridge = go->GetGUID();
                    go->SetGoState(BridgeState);
                    break;
                case 192633:
                    Collision = go->GetGUID();
                    go->SetGoState(CollisionState);

                    // Can't spawn here with SpawnGameObject because go isn't added to world yet...
                    if (CollisionState == GO_STATE_ACTIVE_ALTERNATIVE)
                        spawnSupport = true;
                    break;
            }
        }

        void SetData(uint32 type, uint32 data)
        {
            switch (type)
            {
                case DATA_SLAD_RAN_EVENT:
                    m_auiEncounter[0] = data;
                    if (data == DONE)
                    {
                        if (GameObject* go = instance->GetGameObject(SladRanAltar))
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    }
                    break;
                case DATA_MOORABI_EVENT:
                    m_auiEncounter[1] = data;
                    if (data == DONE)
                    {
                        if (GameObject* go = instance->GetGameObject(MoorabiAltar))
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        if (heroicMode)
                            HandleGameObject(EckTheFerociousDoor, true);
                    }
                    break;
                case DATA_DRAKKARI_COLOSSUS_EVENT:
                    m_auiEncounter[2] = data;
                    if (data == DONE)
                    {
                        if (GameObject* go = instance->GetGameObject(DrakkariColossusAltar))
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    }
                    break;
                case DATA_GAL_DARAH_EVENT:
                    m_auiEncounter[3] = data;
                    if (data == DONE)
                    {
                        HandleGameObject(GalDarahDoor1, true);
                        HandleGameObject(GalDarahDoor2, true);
                    }
                    HandleGameObject(GalDarahDoor3, data != IN_PROGRESS);
                    break;
                case DATA_ECK_THE_FEROCIOUS_EVENT:
                    m_auiEncounter[4] = data;
                    if (heroicMode && data == DONE)
                        HandleGameObject(EckTheFerociousDoorBehind, true);
                    break;
                case DATA_RUIN_DWELLER_DIED:
                    --aliveDweller;
                    if (!aliveDweller)
                        if (Creature* eck = instance->GetCreature(EckTheFerocious))
                            eck->SetVisible(true);
                    break;
            }

            if (data == DONE)
                SaveToDB();
        }

        void SetData64(uint32 type, uint64 data)
        {
            if (type == DATA_STATUE_ACTIVATE)
            {
                toActivate = data;
                timer = 3500;
                ++phase;
            }
        }

        uint32 GetData(uint32 type)
        {
            switch (type)
            {
                case DATA_SLAD_RAN_EVENT:
                    return m_auiEncounter[0];
                case DATA_MOORABI_EVENT:
                    return m_auiEncounter[1];
                case DATA_GAL_DARAH_EVENT:
                    return m_auiEncounter[2];
                case DATA_DRAKKARI_COLOSSUS_EVENT:
                    return m_auiEncounter[3];
                case DATA_ECK_THE_FEROCIOUS_EVENT:
                    return m_auiEncounter[4];
            }

            return 0;
        }

        uint64 GetData64(uint32 type)
        {
            switch (type)
            {
                case DATA_SLAD_RAN_ALTAR:
                    return SladRanAltar;
                case DATA_MOORABI_ALTAR:
                    return MoorabiAltar;
                case DATA_DRAKKARI_COLOSSUS_ALTAR:
                    return DrakkariColossusAltar;
                case DATA_SLAD_RAN_STATUE:
                    return SladRanStatue;
                case DATA_MOORABI_STATUE:
                    return MoorabiStatue;
                case DATA_DRAKKARI_COLOSSUS_STATUE:
                    return DrakkariColossusStatue;
                case DATA_DRAKKARI_COLOSSUS:
                    return DrakkariColossus;
                case DATA_STATUE_ACTIVATE:
                    return toActivate;
            }

            return 0;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << "G D " << m_auiEncounter[0] << ' ' << m_auiEncounter[1] << ' '
                 << m_auiEncounter[2] << ' ' << m_auiEncounter[3] << ' ' << m_auiEncounter[4] << ' '
                 << (SladRanStatue ? GetObjState(SladRanStatue) : GO_STATE_ACTIVE) << ' ' << (MoorabiStatue ? GetObjState(MoorabiStatue) : GO_STATE_ACTIVE) << ' '
                 << (DrakkariColossusStatue ? GetObjState(DrakkariColossusStatue) : GO_STATE_ACTIVE) << ' ' << (GalDarahStatue ? GetObjState(GalDarahStatue) : GO_STATE_READY) << ' '
                 << (Bridge ? GetObjState(Bridge) : GO_STATE_ACTIVE) << ' ' << (Collision ? GetObjState(Collision) : GO_STATE_READY);

            str_data = saveStream.str();

            OUT_SAVE_INST_DATA_COMPLETE;
            return str_data;
        }

        void Load(const char* in)
        {
            if (!in)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(in);

            char dataHead1, dataHead2;
            uint16 data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10;

            std::istringstream loadStream(in);
            loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3
                       >> data4 >> data5 >> data6 >> data7 >> data8 >> data9 >> data10;

            if (dataHead1 == 'G' && dataHead2 == 'D')
            {
                m_auiEncounter[0] = data0;
                m_auiEncounter[1] = data1;
                m_auiEncounter[2] = data2;
                m_auiEncounter[3] = data3;
                m_auiEncounter[4] = data4;
                SladRanStatueState            = GOState(data5);
                MoorabiStatueState            = GOState(data6);
                DrakkariColossusStatueState   = GOState(data7);
                GalDarahStatueState           = GOState(data8);
                BridgeState                   = GOState(data9);
                CollisionState                = GOState(data10);

                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    if (m_auiEncounter[i] == IN_PROGRESS)
                        m_auiEncounter[i] = NOT_STARTED;
            } else OUT_LOAD_INST_DATA_FAIL;

            OUT_LOAD_INST_DATA_COMPLETE;
        }

         void Update(uint32 diff)
         {
             // Spawn the support for the bridge if necessary
             if (spawnSupport)
             {
                 if (GameObject* collision = instance->GetGameObject(Collision))
                     collision->SummonGameObject(192743, collision->GetPositionX(), collision->GetPositionY(), collision->GetPositionZ(), collision->GetOrientation(), 0, 0, 0, 0, 0);
                 spawnSupport = false;
             }

             // If there is nothing to activate, then return
             if (!toActivate)
                 return;

             if (timer < diff)
             {
                 timer = 0;
                 if (toActivate == Bridge)
                 {
                     GameObject* bridge = instance->GetGameObject(Bridge);
                     GameObject* collision = instance->GetGameObject(Collision);
                     GameObject* sladRanStatue = instance->GetGameObject(SladRanStatue);
                     GameObject* moorabiStatue = instance->GetGameObject(MoorabiStatue);
                     GameObject* drakkariColossusStatue = instance->GetGameObject(DrakkariColossusStatue);
                     GameObject* galDarahStatue = instance->GetGameObject(GalDarahStatue);

                     toActivate = 0;

                     if (bridge && collision && sladRanStatue && moorabiStatue && drakkariColossusStatue && galDarahStatue)
                     {
                         bridge->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                         collision->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                         sladRanStatue->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                         moorabiStatue->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                         drakkariColossusStatue->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                         galDarahStatue->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);

                         // Add the GO that solidifies the bridge so you can walk on it
                         spawnSupport = true;
                         SaveToDB();
                     }
                 }
                 else
                 {
                     uint32 spell = 0;
                     GameObject* altar = NULL;
                     if (toActivate == SladRanStatue)
                     {
                         spell = 57071;
                         altar = instance->GetGameObject(SladRanAltar);
                     }
                     else if (toActivate == MoorabiStatue)
                     {
                         spell = 57068;
                         altar = instance->GetGameObject(MoorabiAltar);
                     }
                     else if (toActivate == DrakkariColossusStatue)
                     {
                         spell = 57072;
                         altar = instance->GetGameObject(DrakkariColossusAltar);
                     }

                     // This is a workaround to make the beam cast properly. The caster should be ID 30298 but since the spells
                     // all are with scripted target for that same ID, it will hit itself.
                     if (altar)
                         if (Creature* trigger = altar->SummonCreature(18721, altar->GetPositionX(), altar->GetPositionY(), altar->GetPositionZ() + 3, altar->GetOrientation(), TEMPSUMMON_CORPSE_DESPAWN, 5000))
                         {
                             // Set the trigger model to invisible
                             trigger->SetDisplayId(11686);
                             trigger->CastSpell(trigger, spell, false);
                         }

                     if (GameObject* statueGO = instance->GetGameObject(toActivate))
                         statueGO->SetGoState(GO_STATE_READY);

                     toActivate = 0;

                     if (phase == 3)
                         SetData64(DATA_STATUE_ACTIVATE, Bridge);
                     else
                         SaveToDB(); // Don't save in between last statue and bridge turning in case of crash leading to stuck instance
                }
            }
            else
                timer -= diff;
        }

         GOState GetObjState(uint64 guid)
         {
             if (GameObject* go = instance->GetGameObject(guid))
                 return go->GetGoState();
             return GO_STATE_ACTIVE;
         }
    };
};

class go_gundrak_altar : public GameObjectScript
{
    public:
        go_gundrak_altar() : GameObjectScript("go_gundrak_altar") { }

        bool OnGossipHello(Player* /*player*/, GameObject* go)
        {
            InstanceScript* instance = go->GetInstanceScript();
            uint64 statue = 0;

            go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
            go->SetGoState(GO_STATE_ACTIVE);

            if (instance)
            {
                switch (go->GetEntry())
                {
                    case 192518:
                        statue = instance->GetData64(DATA_SLAD_RAN_STATUE);
                        break;
                    case 192519:
                        statue = instance->GetData64(DATA_MOORABI_STATUE);
                        break;
                    case 192520:
                        statue = instance->GetData64(DATA_DRAKKARI_COLOSSUS_STATUE);
                        break;
                }

                if (!instance->GetData64(DATA_STATUE_ACTIVATE))
                {
                    instance->SetData64(DATA_STATUE_ACTIVATE, statue);
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    go->SetGoState(GO_STATE_ACTIVE);
                }
                return true;
            }
            return false;
        }
};

void AddSC_instance_gundrak()
{
    new instance_gundrak();
    new go_gundrak_altar();
}
