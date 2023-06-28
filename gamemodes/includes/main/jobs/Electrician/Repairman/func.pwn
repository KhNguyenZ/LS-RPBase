#define 			CONTROLLER_ID			1
func:ShowElectricMenu(playerid) {
	if(GetPVarInt(playerid, "DaLeoLen_") == 1)
	{
		new daydien_huhong = random(4);
		new percent = random(90);
		SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][daydien_huhong], percent);

		new e_string[1280];
		format(e_string, sizeof(e_string), "HU HONG DAY DIEN SO %d", daydien_huhong+1);
		PlayerTextDrawSetString(playerid, ElectricMenu[playerid][4], e_string);

		format(e_string, sizeof(e_string), "~r~ERROR: %d/100", percent);
		PlayerTextDrawSetString(playerid, ElectricMenu[playerid][1], e_string);
	} else SendClientMessage(playerid, -1, "Ban chua leo len thang");
	return 1;
}
func:IsOpenElectricMenu(playerid)
{
	if(ElectricInfo[MAX_PLAYERS][e_open]) return 1;
	else return 0;
}
func:IsUnderRepair(playerid) {
	if(IsOpenElectricMenu(playerid))
	{

	}
}
func:SuaDayDien(playerid, daydienid) {

}

func:Electric_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid){
	if(IsOpenElectricMenu(playerid))
	{
		if(playertextid == ElectricMenu[playerid][5])
		{
			Controller_Show(playerid, CONTROLLER_ID);
		}
	}
	return 1;
}
