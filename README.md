# Random Sourcemod plugins

A collection of small Sourcemod plugins for CS:GO, that I am too lazy to make own repositories for.

## Kick on Connect

Kicks players when they attempt to join the server, and shows a message as the disconnect reason. This is useful if you
for example are moving to a new IP, you can show the new IP in the disconnect message.

There could be smarter alternatives for this now, that would redirect players automatically maybe, since the redirects
are now possible, which they weren't when I used this last time.

## sm_extend

A small plugin that allows you to easily add or remove minutes from timelimit.

Usage: `sm_extend <minutes>`, where minutes is a positive or negative integer. Example:
* `sm_extend 10` adds 10 minutes to map time.
* `sm_extend -5` removes 5 minutes from map time.¨
