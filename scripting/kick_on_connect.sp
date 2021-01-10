/* Kicks players when attempting to connect */

public Plugin:myinfo =
{
    name = "Kick on connect",
    author = "Walliski",
    description = "Kicks everyone that joins, and shows them a message.",
    version = "1.0",
    url = "https://github.com/walliski/random-sm"
}

public bool OnClientConnect(int client, char[] rejectmsg, int maxlen)
{
    strcopy(rejectmsg, maxlen, "We have moved, check servers at <yoururlhere>");
    return false;
}
