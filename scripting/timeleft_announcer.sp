/*
    Originally by Tantan in the GOKZ Discord server.

    Announces the time remaining on a map with set intervals.
*/

#include <sourcemod>
#include <cstrike>

public Plugin:myinfo =
{
    name = "Timeleft Announcer",
    author = "Tantan (Modified by Walliski)",
    description = "Displays time remaining in chat",
    version = "1.0",
    url = "https://github.com/walliski/random-sm"
}

#define PREFIX "[Map] "

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
            case 1800: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 30 minutes");
            case 1200: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 20 minutes");
            case 600: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 10 minutes");
            case 300: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 5 minutes");
            case 120: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 2 minutes");
            case 60: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 1 minute");
            case 30: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 30 seconds");
            case 15: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 15 seconds");
            case 10: PrintToChatAll("%s%s", PREFIX, "Time Remaining: 10 seconds");
            case -1: PrintToChatAll("%s%s", PREFIX, "3..");
            case -2: PrintToChatAll("%s%s", PREFIX, "2..");
            case -3: PrintToChatAll("%s%s", PREFIX, "1..");
        }
    }
}

public Action:CS_OnTerminateRound(&Float:delay, &CSRoundEndReason:reason)
{
    return Plugin_Continue;
}
