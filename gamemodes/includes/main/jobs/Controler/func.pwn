#include <YSI\y_hooks>
#include <progress2>

func:RandomKey(playerid)
{
	new keyz[1280];
	new key = random(3);
	switch(key){
		case 0: keyz="H";
		case 1: keyz="Y";
		case 2: keyz="F";
		case 3: keyz="N";
		default: keyz="C";
	}
	SetPVarInt(playerid, "TypeKey", key);
	return keyz;
}
func:ReloadTextdraw(playerid,PlayerText:textid)
{
	PlayerTextDrawHide(playerid, textid);
	PlayerTextDrawShow(playerid, textid);
	return 1;
}
func:IsOpenController(playerid)
{
	if(ControllerOpening[playerid]) return 1;
	else return 0;
}
func:ProgressTime(playerid, time)
{
	ProgressTimeInfo[playerid][p_time_second] = (time/10)*1000;
	ProgressTimerZ[playerid] = SetTimerEx("ProgressStart", ProgressTimeInfo[playerid][p_time_second], 1, "i", playerid);
}
func:ShowController(playerid, controllerid, key[])
{
	if(!IsOpenController(playerid))
	{
		ControllerOpening[playerid] = true;

		ControlerInfo[playerid][c_id] = controllerid;
		PlayerTextDrawSetString(playerid, Fix[playerid][2], key);
		new c_string[1280];
		format(c_string, sizeof(c_string), "~r~Sai: %d/4",ControlerInfo[playerid][c_error_count]);
		PlayerTextDrawSetString(playerid, Fix[playerid][3], c_string);
		SetPlayerProgressBarValue(playerid, ProgressbarFix[playerid][0], 0.0);
		SetPVarInt(playerid, "Count_key", 10);
		for(new ctl = 0 ; ctl < 4 ; ctl++)
		{
			PlayerTextDrawShow(playerid,Fix[playerid][ctl]);
		}
		ShowPlayerProgressBar(playerid, ProgressbarFix[playerid][0]);
		Controller_Timer[playerid] = SetTimerEx("ControllerTimer_", 1000, 1, "i", playerid);
		TogglePlayerControllable(playerid, 0);
	}
	return 1;
}
func:HideController(playerid)
{
	if(IsOpenController(playerid))
	{
		ControllerOpening[playerid] = false;
		for(new ctl = 0 ; ctl < 4 ; ctl++)
		{
			PlayerTextDrawHide(playerid,Fix[playerid][ctl]);
		}
		HidePlayerProgressBar(playerid, ProgressbarFix[playerid][0]);
		ControlerInfo[playerid][c_success_count] = 0;
		ControlerInfo[playerid][c_error_count] = 0;
		TogglePlayerControllable(playerid, 2);
	}
	return 1;
}
forward ControllerTimer_(playerid);
public ControllerTimer_(playerid)
{
	if(GetPVarInt(playerid, "Count_key") > 0){

		SetPVarInt(playerid, "Count_key", GetPVarInt(playerid, "Count_key")-1);
		PlayerTextDrawSetString(playerid, Fix[playerid][2], RandomKey(playerid));
		ReloadTextdraw(playerid, Fix[playerid][2]);
		ProgressTime(playerid, 1);
		new c_string[1280];
		format(c_string, sizeof(c_string), "~r~Sai: %d/4",ControlerInfo[playerid][c_error_count]);
		PlayerTextDrawSetString(playerid, Fix[playerid][3], c_string);
	}else{
		KillTimer(Controller_Timer[playerid]);
		CallRemoteFunction("OnPlayerController", "iiii", playerid,ControlerInfo[playerid][c_id], ControlerInfo[playerid][c_success_count],ControlerInfo[playerid][c_error_count]);
	}
}

forward ProgressStart(playerid);
public ProgressStart(playerid)
{
	if(ProgressTimeInfo[playerid][p_value] < 101)
	{
		ProgressTimeInfo[playerid][p_value]+=10;
		SetPlayerProgressBarValue(playerid, ProgressbarFix[playerid][0], ProgressTimeInfo[playerid][p_value]);
		HidePlayerProgressBar(playerid, ProgressbarFix[playerid][0]);
		ShowPlayerProgressBar(playerid, ProgressbarFix[playerid][0]);
	}
	else {
		KillTimer(ProgressTimerZ[playerid]);
		ProgressTimeInfo[playerid][p_value] = 0;
		ProgressTimeInfo[playerid][p_time_second] = 0;
	}
}
