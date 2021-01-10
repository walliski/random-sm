/* Kicks players when attempting to connect */

public bool OnClientConnect(int client, char[] rejectmsg, int maxlen)
{
    strcopy(rejectmsg, maxlen, "We have moved, check servers at <yoururlhere>");
    return false;
}
