// Area debugging
#include <YSI\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

	if(newkeys & KEY_YES) {

		new szAreas[10];
		GetPlayerDynamicAreas(playerid, szAreas, sizeof(szAreas));
		format(szMiscArray, sizeof(szMiscArray), "Khu vuc: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,",
			szAreas[0], szAreas[1], szAreas[2], szAreas[3], szAreas[4], szAreas[5], szAreas[6], szAreas[7], szAreas[8], szAreas[9]);
		SendClientMessage(playerid, COLOR_YELLOW, szMiscArray);

		if(szAreas[0] != INVALID_STREAMER_ID) {
			for(new i; i < MAX_GROUP_LOCKERS; ++i) {
				
				if(szAreas[0] == arrGroupLockers[PlayerInfo[playerid][pMember]][i][g_iLockerAreaID]) {
					cmd_locker(playerid, "");
					format(szMiscArray, sizeof(szMiscArray), "ID khu vuc: %d, Ma khu vuc tu khoa: %d", szAreas[0], arrGroupLockers[PlayerInfo[playerid][pMember]][i][g_iLockerAreaID]);
					SendClientMessage(playerid, COLOR_GRAD1, szMiscArray);
				}
			}
		}
	}
}

hook OnPlayerEnterDynamicArea(playerid, areaid)	{

	format(szMiscArray, sizeof(szMiscArray), "Khu vuc da nhap: %d", areaid);
	SendClientMessage(playerid, COLOR_YELLOW, szMiscArray);
}

hook OnPlayerLeaveDynamicArea(playerid, areaid)	{

	format(szMiscArray, sizeof(szMiscArray), "khu vuc ben trai: %d", areaid);
	SendClientMessage(playerid, COLOR_YELLOW, szMiscArray);
}
