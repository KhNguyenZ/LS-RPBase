#include <a_samp>
#include <ZCMD>
#include <progress2>
#include <YSI\y_hooks>
//Download: https://github.com/Southclaws/progress2/releases

new PlayerText:Loading_Text[MAX_PLAYERS][1];
new PlayerBar:Progress_Loading[MAX_PLAYERS][1];
hook OnPlayerConnect(playerid)
{
    //DANG HAI CAN SA NE - 100%
    Loading_Text[playerid][0] = CreatePlayerTextDraw(playerid, 172.000000, 378.000000, "");
	PlayerTextDrawFont(playerid, Loading_Text[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Loading_Text[playerid][0], 0.562500, 0.950000);
	PlayerTextDrawTextSize(playerid, Loading_Text[playerid][0], 467.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Loading_Text[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, Loading_Text[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, Loading_Text[playerid][0], 1);
	PlayerTextDrawColor(playerid, Loading_Text[playerid][0], -2686721);
	PlayerTextDrawBackgroundColor(playerid, Loading_Text[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Loading_Text[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Loading_Text[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, Loading_Text[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Loading_Text[playerid][0], 0);

	Progress_Loading[playerid][0] = CreatePlayerProgressBar(playerid, 174.000000, 391.000000, 297.500000, 4.000000, 16711935, 100.000000);
	SetPlayerProgressBarValue(playerid, Progress_Loading[playerid][0], 1.000000);
    return 1;
}
enum Loading_Enum{
    Float:pr_value,
    Float:pr_time,
    Float:pr_vl_second,
    pr_loading
}
new ProgressData[MAX_PLAYERS][Loading_Enum];

stock StartProgress(playerid, time, text[], callbacks[]){
    PlayerTextDrawSetString(playerid,Loading_Text[playerid][0], text);
    PlayerTextDrawShow(playerid, Loading_Text[playerid][0]);

    SetPlayerProgressBarValue(playerid, Progress_Loading[playerid][0], 1.000000);
    ShowPlayerProgressBar(playerid, Progress_Loading[playerid][0]);
    ProgressData[playerid][pr_value] = 0;
    ProgressData[playerid][pr_time] = time;
    ProgressData[playerid][pr_loading] = 0;
    ProgressData[playerid][pr_vl_second] = (100/time);
    SetPVarString(playerid, "Callbacks_Loading", callbacks);
    SetTimerEx("LoadProgress_", (time/10)*1000, false, "i", playerid);
}

forward LoadProgress_(playerid);
public LoadProgress_(playerid)
{
    new 
        Float:time_loading = floatround(ProgressData[playerid][pr_time]);
    if(ProgressData[playerid][pr_value] < 100 && ProgressData[playerid][pr_loading] == 0) ProgressData[playerid][pr_value] += ProgressData[playerid][pr_vl_second];
    if(ProgressData[playerid][pr_value] < 100 && ProgressData[playerid][pr_loading] == 0) SetTimerEx("LoadProgress_", floatround((time_loading/10)*1000), false, "i", playerid);

    SetPlayerProgressBarValue(playerid, Progress_Loading[playerid][0], ProgressData[playerid][pr_value]);
    HidePlayerProgressBar(playerid, Progress_Loading[playerid][0]);
    ShowPlayerProgressBar(playerid, Progress_Loading[playerid][0]);

    // new sz_str[1280];
    // format(sz_str, sizeof(sz_str),"Time: %d , Value: %f , Value/Second: %f", ProgressData[playerid][pr_time],ProgressData[playerid][pr_value],ProgressData[playerid][pr_vl_second]);
    // SendClientMessage(playerid, -1, sz_str);

    if(ProgressData[playerid][pr_value] >= 100)
    {
        HidePlayerProgressBar(playerid, Progress_Loading[playerid][0]);
        PlayerTextDrawHide(playerid, Loading_Text[playerid][0]);

        ProgressData[playerid][pr_value] = 0;
        ProgressData[playerid][pr_time] = 0;
        ProgressData[playerid][pr_loading] = 1;
        ProgressData[playerid][pr_vl_second] = 0;
        new str_callbacks[1280];
        GetPVarString(playerid, "Callbacks_Loading", str_callbacks, sizeof(str_callbacks));
        SetTimerEx(str_callbacks, 500,0, "i", playerid);
    }
}

CMD:loading_test(playerid, params[])
{
    StartProgress(playerid,20, "DANG TEST", "Testing");
    return 1;
}
forward Testing(playerid);
public Testing(playerid)
{
    SendClientMessage(playerid, -1, "Success");
}
CMD:tpos(playerid, params[])
{
    SetPlayerPos(playerid, 10,10,10);
    return 1;
}