#include <YSI\y_hooks>


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsOpenController(playerid))
	{
		switch(GetPVarInt(playerid,"TypeKey"))
		{
			case 0:
			{
				printf("Key:H, Type:%d",GetPVarInt(playerid,"TypeKey"));
				if(newkeys == KEY_CTRL_BACK)
				{
					ControlerInfo[playerid][c_success_count]+=1;
				} 
				else ControlerInfo[playerid][c_error_count]+=1;
			}
			case 1:
			{
				printf("Key:Y, Type:%d",GetPVarInt(playerid,"TypeKey"));
				if(newkeys == KEY_YES)
				{
					ControlerInfo[playerid][c_success_count]+=1;
				} 
				else ControlerInfo[playerid][c_error_count]+=1;
			}
			case 2:
			{
				printf("Key:F, Type:%d",GetPVarInt(playerid,"TypeKey"));
				if(newkeys == KEY_FIRE)
				{
					ControlerInfo[playerid][c_success_count]+=1;
				} 
				else ControlerInfo[playerid][c_error_count]+=1;
			}
			case 3:
			{
				printf("Key:N, Type:%d",GetPVarInt(playerid,"TypeKey"));
				if(newkeys == KEY_NO)
				{
					ControlerInfo[playerid][c_success_count]+=1;
				} 
				else ControlerInfo[playerid][c_error_count]+=1;
			}
		}
	}
	return 1;
}

forward OnPlayerController(playerid, controllerid, success, error);
public OnPlayerController(playerid, controllerid, success, error)
{
	HideController(playerid);
	printf("Name: %s, ID Controller: %d, Success:%d, Error: %d",GetPlayerNameEx(playerid), controllerid, success, error);
	return 1;
}