#include <YSI\y_hooks>
#include <ZCMD>

CMD:controller(playerid, params[])
{
	ShowController(playerid, 1, RandomKey(playerid));
	return 1;
}