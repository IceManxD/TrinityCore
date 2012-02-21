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

#ifndef _CHARACTERDATABASE_H
#define _CHARACTERDATABASE_H

#include "DatabaseWorkerPool.h"
#include "MySQLConnection.h"

class CharacterDatabaseConnection : public MySQLConnection
{
    public:
        //- Constructors for sync and async connections
        CharacterDatabaseConnection(MySQLConnectionInfo& connInfo) : MySQLConnection(connInfo) {}
        CharacterDatabaseConnection(ACE_Activation_Queue* q, MySQLConnectionInfo& connInfo) : MySQLConnection(q, connInfo) {}

        //- Loads database type specific prepared statements
        void DoPrepareStatements();
};

typedef DatabaseWorkerPool<CharacterDatabaseConnection> CharacterDatabaseWorkerPool;

enum CharacterDatabaseStatements
{
    /*  Naming standard for defines:
        {DB}_{SEL/INS/UPD/DEL/REP}_{Summary of data changed}
        When updating more than one field, consider looking at the calling function
        name for a suiting suffix.
    */

    CHAR_DEL_QUEST_POOL_SAVE,
    CHAR_INS_QUEST_POOL_SAVE,
    CHAR_DEL_NONEXISTENT_GUILD_BANK_ITEM,
    CHAR_DEL_EXPIRED_BANS,
    CHAR_SEL_GUID_BY_NAME,
    CHAR_SEL_CHECK_NAME,
    CHAR_SEL_SUM_CHARS,
    CHAR_SEL_CHAR_CREATE_INFO,
    CHAR_INS_CHARACTER_BAN,
    CHAR_UPD_CHARACTER_BAN,
    CHAR_SEL_BANINFO,
    CHAR_SEL_GUID_BY_NAME_FILTER,
    CHAR_SEL_BANINFO_LIST,
    CHAR_SEL_BANNED_NAME,
    CHAR_SEL_ENUM,
    CHAR_SEL_ENUM_DECLINED_NAME,
    CHAR_SEL_PET_SLOTS,
    CHAR_SEL_PET_SLOTS_DETAIL,
    CHAR_SEL_PET_ENTRY,
    CHAR_SEL_PET_SLOT_BY_ID,
    CHAR_SEL_FREE_NAME,
    CHAR_SEL_GUID_RACE_ACC_BY_NAME,
    CHAR_DEL_QUEST_STATUS_DAILY,
    CHAR_DEL_QUEST_STATUS_WEEKLY,
    CHAR_DEL_QUEST_STATUS_SEASONAL,
    CHAR_DEL_QUEST_STATUS_DAILY_CHAR,
    CHAR_DEL_QUEST_STATUS_WEEKLY_CHAR,
    CHAR_DEL_QUEST_STATUS_SEASONAL_CHAR,
    CHAR_DEL_BATTLEGROUND_RANDOM,
    CHAR_INS_BATTLEGROUND_RANDOM,

    CHAR_SEL_CHARACTER,
    CHAR_SEL_GROUP_MEMBER,
    CHAR_SEL_CHARACTER_INSTANCE,
    CHAR_SEL_CHARACTER_AURAS,
    CHAR_SEL_CHARACTER_SPELL,
    CHAR_SEL_CHARACTER_QUESTSTATUS,
    CHAR_SEL_CHARACTER_DAILYQUESTSTATUS,
    CHAR_SEL_CHARACTER_WEEKLYQUESTSTATUS,
    CHAR_SEL_CHARACTER_SEASONALQUESTSTATUS,
    CHAR_INS_CHARACTER_DAILYQUESTSTATUS,
    CHAR_INS_CHARACTER_WEEKLYQUESTSTATUS,
    CHAR_INS_CHARACTER_SEASONALQUESTSTATUS,
    CHAR_SEL_CHARACTER_REPUTATION,
    CHAR_SEL_CHARACTER_INVENTORY,
    CHAR_SEL_CHARACTER_ACTIONS,
    CHAR_SEL_CHARACTER_ACTIONS_SPEC,
    CHAR_SEL_CHARACTER_MAILCOUNT,
    CHAR_SEL_CHARACTER_MAILDATE,
    CHAR_SEL_CHARACTER_SOCIALLIST,
    CHAR_SEL_CHARACTER_HOMEBIND,
    CHAR_SEL_CHARACTER_SPELLCOOLDOWNS,
    CHAR_SEL_CHARACTER_DECLINEDNAMES,
    CHAR_SEL_GUILD_MEMBER,
    CHAR_SEL_CHARACTER_ARENAINFO,
    CHAR_SEL_CHARACTER_ACHIEVEMENTS,
    CHAR_SEL_CHARACTER_CRITERIAPROGRESS,
    CHAR_SEL_CHARACTER_EQUIPMENTSETS,
    CHAR_SEL_CHARACTER_BGDATA,
    CHAR_SEL_CHARACTER_GLYPHS,
    CHAR_SEL_CHARACTER_TALENTS,
    CHAR_SEL_CHARACTER_SKILLS,
    CHAR_SEL_CHARACTER_RANDOMBG,
    CHAR_SEL_CHARACTER_BANNED,
    CHAR_SEL_CHARACTER_QUESTSTATUSREW,
    CHAR_SEL_ACCOUNT_INSTANCELOCKTIMES,
    CHAR_SEL_MAILITEMS,
    CHAR_SEL_AUCTION_ITEMS,
    CHAR_INS_AUCTION,
    CHAR_DEL_AUCTION,
    CHAR_SEL_AUCTIONS,
    CHAR_INS_MAIL,
    CHAR_DEL_MAIL,
    CHAR_INS_MAIL_ITEM,
    CHAR_DEL_MAIL_ITEM,
    CHAR_DEL_INVALID_MAIL_ITEM,
    CHAR_DEL_EMPTY_EXPIRED_MAIL,
    CHAR_SEL_EXPIRED_MAIL,
    CHAR_SEL_EXPIRED_MAIL_ITEMS,
    CHAR_UPD_MAIL_RETURNED,
    CHAR_UPD_MAIL_ITEM_RECEIVER,
    CHAR_UPD_ITEM_OWNER,
    CHAR_SEL_ITEM_REFUNDS,
    CHAR_SEL_ITEM_BOP_TRADE,
    CHAR_DEL_ITEM_BOP_TRADE,
    CHAR_INS_ITEM_BOP_TRADE,
    CHAR_REP_INVENTORY_ITEM,
    CHAR_DEL_INVENTORY_ITEM,
    CHAR_REP_ITEM_INSTANCE,
    CHAR_UPD_ITEM_INSTANCE,
    CHAR_UPD_ITEM_INSTANCE_ON_LOAD,
    CHAR_DEL_ITEM_INSTANCE,
    CHAR_UPD_GIFT_OWNER,
    CHAR_DEL_GIFT,
    CHAR_SEL_ACCOUNT_BY_NAME,
    CHAR_DEL_ACCOUNT_INSTANCE_LOCK_TIMES,
    CHAR_INS_ACCOUNT_INSTANCE_LOCK_TIMES,
    CHAR_SEL_CHARACTER_NAME_CLASS,
    CHAR_SEL_MATCH_MAKER_RATING,
    CHAR_SEL_CHARACTER_COUNT,
    CHAR_UPD_NAME,
    CHAR_DEL_DECLINED_NAME,

    CHAR_INS_GUILD,
    CHAR_DEL_GUILD,
    CHAR_INS_GUILD_MEMBER,
    CHAR_DEL_GUILD_MEMBER,
    CHAR_DEL_GUILD_MEMBERS,
    CHAR_INS_GUILD_RANK,
    CHAR_DEL_GUILD_RANKS,
    CHAR_DEL_GUILD_LOWEST_RANK,
    CHAR_INS_GUILD_BANK_TAB,
    CHAR_DEL_GUILD_BANK_TAB,
    CHAR_DEL_GUILD_BANK_TABS,
    CHAR_INS_GUILD_BANK_ITEM,
    CHAR_DEL_GUILD_BANK_ITEM,
    CHAR_DEL_GUILD_BANK_ITEMS,
    CHAR_INS_GUILD_BANK_RIGHT_DEFAULT,
    CHAR_INS_GUILD_BANK_RIGHT,
    CHAR_DEL_GUILD_BANK_RIGHT,
    CHAR_DEL_GUILD_BANK_RIGHTS,
    CHAR_DEL_GUILD_BANK_RIGHTS_FOR_RANK,
    CHAR_INS_GUILD_BANK_EVENTLOG,
    CHAR_DEL_GUILD_BANK_EVENTLOG,
    CHAR_DEL_GUILD_BANK_EVENTLOGS,
    CHAR_INS_GUILD_EVENTLOG,
    CHAR_DEL_GUILD_EVENTLOG,
    CHAR_DEL_GUILD_EVENTLOGS,
    CHAR_UPD_GUILD_MEMBER_PNOTE,
    CHAR_UPD_GUILD_MEMBER_OFFNOTE,
    CHAR_UPD_GUILD_MEMBER_RANK,
    CHAR_UPD_GUILD_MOTD,
    CHAR_UPD_GUILD_INFO,
    CHAR_UPD_GUILD_LEADER,
    CHAR_UPD_GUILD_RANK_NAME,
    CHAR_UPD_GUILD_RANK_RIGHTS,
    CHAR_UPD_GUILD_EMBLEM_INFO,
    CHAR_UPD_GUILD_BANK_TAB_INFO,
    CHAR_UPD_GUILD_BANK_MONEY,
    CHAR_UPD_GUILD_BANK_EVENTLOG_TAB,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_MONEY,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_MONEY,
    CHAR_UPD_GUILD_RANK_BANK_RESET_TIME,
    CHAR_UPD_GUILD_RANK_BANK_MONEY,
    CHAR_UPD_GUILD_BANK_TAB_TEXT,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS0,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS1,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS2,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS3,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS4,
    CHAR_UPD_GUILD_MEMBER_BANK_TIME_REM_SLOTS5,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS0,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS1,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS2,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS3,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS4,
    CHAR_UPD_GUILD_MEMBER_BANK_REM_SLOTS5,
    CHAR_UPD_GUILD_RANK_BANK_TIME0,
    CHAR_UPD_GUILD_RANK_BANK_TIME1,
    CHAR_UPD_GUILD_RANK_BANK_TIME2,
    CHAR_UPD_GUILD_RANK_BANK_TIME3,
    CHAR_UPD_GUILD_RANK_BANK_TIME4,
    CHAR_UPD_GUILD_RANK_BANK_TIME5,
    CHAR_SEL_CHAR_DATA_FOR_GUILD,

    CHAR_SEL_CHANNEL,
    CHAR_INS_CHANNEL,
    CHAR_UPD_CHANNEL,
    CHAR_UPD_CHANNEL_USAGE,
    CHAR_UPD_CHANNEL_OWNERSHIP,
    CHAR_DEL_OLD_CHANNELS,

    CHAR_UPD_EQUIP_SET,
    CHAR_INS_EQUIP_SET,
    CHAR_DEL_EQUIP_SET,

    CHAR_DEL_AURA,
    CHAR_INS_AURA,

    CHAR_SEL_ACCOUNT_DATA,
    CHAR_REP_ACCOUNT_DATA,
    CHAR_DEL_ACCOUNT_DATA,
    CHAR_SEL_PLAYER_ACCOUNT_DATA,
    CHAR_REP_PLAYER_ACCOUNT_DATA,
    CHAR_DEL_PLAYER_ACCOUNT_DATA,

    CHAR_SEL_TUTORIALS,
    CHAR_SEL_HAS_TUTORIALS,
    CHAR_INS_TUTORIALS,
    CHAR_UPD_TUTORIALS,
    CHAR_DEL_TUTORIALS,

    CHAR_INS_INSTANCE_SAVE,
    CHAR_UPD_INSTANCE_DATA,

    CHAR_DEL_GAME_EVENT_SAVE,
    CHAR_INS_GAME_EVENT_SAVE,
    //CHAR_ANTICHEAT_SET_CHEATERS,
    //CHAR_ANTICHEAT_GET_CHEATERS,
    //CHAR_ANTICHEAT_SET_CHEAT_FIRST_REPORT,
    //CHAR_ANTICHEAT_GET_CHEAT_FIRST_REPORT,
    //CHAR_ANTICHEAT_GET_CHEATERS_AVERAGE,
    //CHAR_ANTICHEAT_DEL_CHEAT_FIRST_REPORT,
    //CHAR_ANTICHEAT_SET_CHEATERS_TEMP,
    //CHAR_ANTICHEAT_DEL_CHEATERS_TEMP,
    //CHAR_ANTICHEAT_DEL_CHEATERS,
    //CHAR_ANTICHEAT_CLEAN_CHEAT_FIRST_REPORT,
    //CHAR_ANTICHEAT_CLEAN_CHEATERS_TEMP,
    //CHAR_ANTICHEAT_CLEAN_CHEATERS,
    //CHAR_ANTICHEAT_GET_CHEATERS_AVERAGE_BY_GUID,
    //CHAR_ANTICHEAT_GET_CHEATERS_BY_GUID,
    //CHAR_ANTICHEAT_GET_REPORTS_TYPE_BY_GUID,

    // LoL CustomContent
    CHAR_ADD_CHATTICKER_MESSAGE,

    CHAR_GET_CODEBOX_ITEM,
    CHAR_GET_CODEBOX_ITEMGROUP,
    CHAR_SET_CODEBOX_CODE_USED,
    
    CHAR_DEL_ALL_GAME_EVENT_CONDITION_SAVE,
    CHAR_DEL_GAME_EVENT_CONDITION_SAVE,
    CHAR_INS_GAME_EVENT_CONDITION_SAVE,

    CHAR_INS_ARENA_TEAM,
    CHAR_INS_ARENA_TEAM_MEMBER,
    CHAR_DEL_ARENA_TEAM,
    CHAR_DEL_ARENA_TEAM_MEMBERS,
    CHAR_UPD_ARENA_TEAM_CAPTAIN,
    CHAR_DEL_ARENA_TEAM_MEMBER,
    CHAR_UPD_ARENA_TEAM_STATS,
    CHAR_UPD_ARENA_TEAM_MEMBER,
    CHAR_REP_CHARACTER_ARENA_STATS,
    CHAR_SEL_PLAYER_ARENA_TEAMS,

    CHAR_SEL_PETITION,
    CHAR_SEL_PETITION_SIGNATURE,
    CHAR_DEL_ALL_PETITION_SIGNATURES,
    CHAR_DEL_PETITION_SIGNATURE,

    CHAR_INS_PLAYER_BGDATA,
    CHAR_DEL_PLAYER_BGDATA,
    CHAR_UPD_PLAYERS_BGDATA,

    CHAR_INS_PLAYER_HOMEBIND,
    CHAR_UPD_PLAYER_HOMEBIND,
    CHAR_DEL_PLAYER_HOMEBIND,

    CHAR_SEL_CORPSES,
    CHAR_INS_CORPSE,
    CHAR_DEL_CORPSE,
    CHAR_DEL_PLAYER_CORPSES,
    CHAR_DEL_OLD_CORPSES,
    CHAR_UPD_NONEXISTENT_INSTANCE_FOR_CORPSES,

    CHAR_SEL_CREATURE_RESPAWNS,
    CHAR_REP_CREATURE_RESPAWN,
    CHAR_DEL_CREATURE_RESPAWN,
    CHAR_DEL_CREATURE_RESPAWN_BY_GUID,
    CHAR_DEL_CREATURE_RESPAWN_BY_INSTANCE,
    CHAR_SEL_MAX_CREATURE_RESPAWNS,
    CHAR_DEL_NONEXISTENT_INSTANCE_CREATURE_RESPAWNS,

    CHAR_SEL_GO_RESPAWNS,
    CHAR_REP_GO_RESPAWN,
    CHAR_DEL_GO_RESPAWN,
    CHAR_DEL_GO_RESPAWN_BY_INSTANCE,
    CHAR_DEL_EXPIRED_GO_RESPAWNS,
    CHAR_DEL_NONEXISTENT_INSTANCE_GO_RESPAWNS,

    CHAR_SEL_GM_TICKETS,
    CHAR_REP_GM_TICKET,
    CHAR_DEL_GM_TICKET,
    CHAR_DEL_ALL_GM_TICKETS,
    CHAR_DEL_PLAYER_GM_TICKETS,

    CHAR_INS_GM_SURVEY,
    CHAR_INS_GM_SUBSURVEY,
    CHAR_INS_LAG_REPORT,

    CHAR_SEL_EXPIRED_AUCTIONS,

    CHAR_INS_CHARACTER,
    CHAR_UPD_CHARACTER,

    CHAR_UPD_ADD_AT_LOGIN_FLAG,
    CHAR_UPD_REM_AT_LOGIN_FLAG,
    CHAR_UPD_ALL_AT_LOGIN_FLAGS,
    CHAR_INS_BUG_REPORT,
    CHAR_UPD_PETITION_NAME,
    CHAR_INS_PETITION_SIGNATURE,
    CHAR_UPD_ACCOUNT_ONLINE,
    CHAR_INS_GROUP,
    CHAR_INS_GROUP_MEMBER,
    CHAR_DEL_GROUP_MEMBER,
    CHAR_DEL_GROUP_INSTANCE_PERM_BINDING,
    CHAR_UPD_GROUP_LEADER,
    CHAR_UPD_GROUP_TYPE,
    CHAR_UPD_GROUP_MEMBER_SUBGROUP,
    CHAR_UPD_GROUP_MEMBER_FLAG,
    CHAR_UPD_GROUP_DIFFICULTY,
    CHAR_UPD_GROUP_RAID_DIFFICULTY,
    CHAR_DEL_INVALID_SPELL,
    CHAR_UPD_DELETE_INFO,
    CHAR_UDP_RESTORE_DELETE_INFO,
    CHAR_UPD_ZONE,
    CHAR_UPD_LEVEL,
    CHAR_DEL_INVALID_ACHIEV_PROGRESS_CRITERIA,
    CHAR_DEL_INVALID_ACHIEVMENT,
    CHAR_INS_ADDON,
    CHAR_DEL_INVALID_PET_SPELL,
    CHAR_DEL_GROUP_INSTANCE_BY_INSTANCE,
    CHAR_DEL_GROUP_INSTANCE_BY_GUID,
    CHAR_REP_GROUP_INSTANCE,
    CHAR_UPD_INSTANCE_RESETTIME,
    CHAR_UPD_GLOBAL_INSTANCE_RESETTIME,
    CHAR_UPD_CHAR_ONLINE,
    CHAR_UPD_CHAR_NAME_AT_LOGIN,
    CHAR_UPD_WORLDSTATE,
    CHAR_INS_WORLDSTATE,
    CHAR_DEL_CHAR_INSTANCE,
    CHAR_UPD_CHAR_INSTANCE,
    CHAR_INS_CHAR_INSTANCE,
    CHAR_UPD_GENDER_PLAYERBYTES,
    CHAR_DEL_CHARACTER_SKILL,
    CHAR_UPD_ADD_CHARACTER_SOCIAL_FLAGS,
    CHAR_UPD_REM_CHARACTER_SOCIAL_FLAGS,
    CHAR_INS_CHARACTER_SOCIAL,
    CHAR_DEL_CHARACTER_SOCIAL,
    CHAR_UPD_CHARACTER_SOCIAL_NOTE,
    CHAR_UPD_CHARACTER_POSITION,
    
    CHAR_INS_LFG_DATA,
    CHAR_DEL_LFG_DATA,

    MAX_CHARACTERDATABASE_STATEMENTS,
};

#endif
