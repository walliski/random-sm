/* Checks if players has the reserved slot flag, if not, kick them with customizable message. */

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>

public Plugin myinfo = 
{
    name = "Kick none-VIP",
    author = "Walliski",
    description = "Kicks none-VIP players",
    version = "1.0.0",
    url = "https://github.com/walliski/random-sm"
};


public void OnPluginStart()
{
    LoadTranslations("kick-none-vip.phrases");
}

public void OnClientPostAdminCheck(int client)
{
    if (!client || IsFakeClient(client) || !IsClientInGame(client))
    {
        return;
    }

    if (!CheckCommandAccess(client, "nonevipkick_flag", ADMFLAG_RESERVATION))
    {
        KickClient(client, "%T", "Kick Message", client);
    }
}
