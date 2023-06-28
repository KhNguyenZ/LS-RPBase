#include <A_Controller>

CMD:getjoba(playerid, params[])
{
	SetPlayerJob(playerid, 1);
	return 1;
}

