/*
    Originally by Tantan in the GOKZ Discord server.

    Announces the time remaining on a map with set intervals.
*/

#include <sourcemod>
#include <cstrike>

#include <sourcemod-colors>

public Plugin:myinfo =
{
    name = "Timeleft Announcer",
    author = "Tantan (Modified by Walliski)",
    description = "Displays time remaining in chat",
    version = "1.0",
    url = "https://github.com/walliski/random-sm"
}

#define PREFIX "{lime}MAP{grey} | "

public OnPluginStart()
{
    CreateTimer(1.0, CheckRemainingTime, INVALID_HANDLE, TIMER_REPEAT);
}

public Action:CheckRemainingTime(Handle:timer)
{
    new Handle:hTmp;
    hTmp = FindConVar("mp_timelimit");
    new iTimeLimit = GetConVarInt(hTmp);

    if (hTmp != INVALID_HANDLE)
        CloseHandle(hTmp);

    if (iTimeLimit > 0)
    {
        new timeleft;
        GetMapTimeLeft(timeleft);

        switch(timeleft)
        {
            case 1800: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}30 {grey}minutes");
            case 1200: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}20 {grey}minutes");
            case 600: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}10 {grey}minutes");
            case 300: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}5 {grey}minutes");
            case 120: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}2 {grey}minutes");
            case 60: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}1 {grey}minute");
            case 30: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}30 {grey}seconds");
            case 15: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}15 {grey}seconds");
            case 10: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: {blue}10 {grey}seconds");
            case -1: CPrintToChatAll("%s%s", PREFIX, "{blue}3{grey}...");
            case -2: CPrintToChatAll("%s%s", PREFIX, "{blue}2{grey}...");
            case -3: CPrintToChatAll("%s%s", PREFIX, "{blue}1{grey}...");
        }
    }
}

public Action:CS_OnTerminateRound(&Float:delay, &CSRoundEndReason:reason)
{
    return Plugin_Continue;
}
