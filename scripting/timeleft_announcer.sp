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

#define PREFIX "{default}[{red}Map{default}] "

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
            case 1800: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 30 minutes");
            case 1200: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 20 minutes");
            case 600: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 10 minutes");
            case 300: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 5 minutes");
            case 120: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 2 minutes");
            case 60: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 1 minute");
            case 30: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 30 seconds");
            case 15: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 15 seconds");
            case 10: CPrintToChatAll("%s%s", PREFIX, "Time Remaining: 10 seconds");
            case -1: CPrintToChatAll("%s%s", PREFIX, "3..");
            case -2: CPrintToChatAll("%s%s", PREFIX, "2..");
            case -3: CPrintToChatAll("%s%s", PREFIX, "1..");
        }
    }
}

public Action:CS_OnTerminateRound(&Float:delay, &CSRoundEndReason:reason)
{
    return Plugin_Continue;
}
