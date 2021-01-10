/*
    Taken from https://forums.alliedmods.net/showthread.php?t=165126 originally, written by Bacardi.

    Creates a sm_extend command that allows you to add/remove minutes from timelimit.
*/

public Plugin:myinfo =
{
    name = "SM Extend",
    author = "Bacardi (MOdified by Walliski)",
    description = "Extend map time with sm_extend command.",
    version = "1.0",
    url = "https://github.com/walliski/random-sm"
}

new Handle:mp_timelimit = INVALID_HANDLE;
new timelimit;

public OnPluginStart()
{
    RegAdminCmd("sm_extend", admcmd_extend, ADMFLAG_CHANGEMAP, "sm_extend <minutes> - Extend map time or shorten with negative number.");

    mp_timelimit = FindConVar("mp_timelimit");
    timelimit = GetConVarInt(mp_timelimit);
    HookConVarChange(mp_timelimit, ConVarChanged);
}

public ConVarChanged(Handle:convar, const String:oldValue[], const String:newValue[])
{
    timelimit = GetConVarInt(mp_timelimit);
}

public Action:admcmd_extend(client, args)
{
    if (args < 1)
    {
        ReplyToCommand(client, "[SM] Usage: sm_extend <minutes> - Extend map time or shorten with negative number.");
        return Plugin_Handled;
    }

    new String:arg[10];
    GetCmdArg(1, arg, sizeof(arg));

    decl time;
    time = 0;

    if((time = StringToInt(arg)) != 0)
    {
        SetConVarInt(mp_timelimit, timelimit + time);

        if(time > 0)
        {
            ShowActivity2(client, "[SM] ", "Extended map time by %i minutes", time);
            LogAction(client, -1, "\"%L\" Extend map time", client, time);
        }
        else
        {
            ShowActivity2(client, "[SM] ", "Shortened map time by %i minutes", time);
            LogAction(client, -1, "\"%L\" Shorten map time", client, time);
        }
    }

    return Plugin_Handled;
}
