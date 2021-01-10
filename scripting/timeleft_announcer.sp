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
            case 1800: PrintToChatAll("Time Remaining: 30 minutes");
            case 1200: PrintToChatAll("Time Remaining: 20 minutes");
            case 600: PrintToChatAll("Time Remaining: 10 minutes");
            case 300: PrintToChatAll("Time Remaining: 5 minutes");
            case 120: PrintToChatAll("Time Remaining: 2 minutes");
            case 60: PrintToChatAll("Time Remaining: 1 minute");
            case 30: PrintToChatAll("Time Remaining: 30 seconds");
            case 15: PrintToChatAll("Time Remaining: 15 seconds");
            case 10: PrintToChatAll("Time Remaining: 10 seconds");
            case -1: PrintToChatAll("3..");
            case -2: PrintToChatAll("2..");
            case -3: PrintToChatAll("1..");
        }
    }
}

public Action:CS_OnTerminateRound(&Float:delay, &CSRoundEndReason:reason)
{
    return Plugin_Continue;
}
