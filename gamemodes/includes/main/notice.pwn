#include <a_samp>
#include <ZCMD>
#include <YSI\y_hooks>
new PlayerText:Green[MAX_PLAYERS];
new PlayerText:Green1[MAX_PLAYERS];
new PlayerText:Red[MAX_PLAYERS];
new PlayerText:Red1[MAX_PLAYERS];
new PlayerText:Orange[MAX_PLAYERS];
new PlayerText:Orange1[MAX_PLAYERS];
new PlayerText:icon[MAX_PLAYERS];
new PlayerText:icon1[MAX_PLAYERS];
new PlayerText:icon2[MAX_PLAYERS];
new PlayerText:msg_loading[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    Green[playerid] = CreatePlayerTextDraw(playerid, 501.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Green[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Green[playerid], 0.224999, 3.500000);
	PlayerTextDrawTextSize(playerid, Green[playerid], 225.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, Green[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Green[playerid], 0);
	PlayerTextDrawAlignment(playerid, Green[playerid], 2);
	PlayerTextDrawColor(playerid, Green[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Green[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Green[playerid], 9109759);
	PlayerTextDrawUseBox(playerid, Green[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Green[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Green[playerid], 0);

	Green1[playerid] = CreatePlayerTextDraw(playerid, 569.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Green1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Green1[playerid], 0.683332, 3.500000);
	PlayerTextDrawTextSize(playerid, Green1[playerid], 355.000000, 102.500000);
	PlayerTextDrawSetOutline(playerid, Green1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Green1[playerid], 0);
	PlayerTextDrawAlignment(playerid, Green1[playerid], 2);
	PlayerTextDrawColor(playerid, Green1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Green1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Green1[playerid], 16711935);
	PlayerTextDrawUseBox(playerid, Green1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Green1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Green1[playerid], 0);

	Red[playerid] = CreatePlayerTextDraw(playerid, 501.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Red[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Red[playerid], 0.224999, 3.500000);
	PlayerTextDrawTextSize(playerid, Red[playerid], 225.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, Red[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Red[playerid], 0);
	PlayerTextDrawAlignment(playerid, Red[playerid], 2);
	PlayerTextDrawColor(playerid, Red[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Red[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Red[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, Red[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Red[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Red[playerid], 0);

	Red1[playerid] = CreatePlayerTextDraw(playerid, 569.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Red1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Red1[playerid], 0.683332, 3.500000);
	PlayerTextDrawTextSize(playerid, Red1[playerid], 355.000000, 102.500000);
	PlayerTextDrawSetOutline(playerid, Red1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Red1[playerid], 0);
	PlayerTextDrawAlignment(playerid, Red1[playerid], 2);
	PlayerTextDrawColor(playerid, Red1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Red1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Red1[playerid], -16776961);
	PlayerTextDrawUseBox(playerid, Red1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Red1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Red1[playerid], 0);

	Orange[playerid] = CreatePlayerTextDraw(playerid, 501.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Orange[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Orange[playerid], 0.224999, 3.500000);
	PlayerTextDrawTextSize(playerid, Orange[playerid], 225.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, Orange[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Orange[playerid], 0);
	PlayerTextDrawAlignment(playerid, Orange[playerid], 2);
	PlayerTextDrawColor(playerid, Orange[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Orange[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Orange[playerid], -764862721);
	PlayerTextDrawUseBox(playerid, Orange[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Orange[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Orange[playerid], 0);

	Orange1[playerid] = CreatePlayerTextDraw(playerid, 569.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Orange1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Orange1[playerid], 0.683332, 3.500000);
	PlayerTextDrawTextSize(playerid, Orange1[playerid], 355.000000, 102.500000);
	PlayerTextDrawSetOutline(playerid, Orange1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Orange1[playerid], 0);
	PlayerTextDrawAlignment(playerid, Orange1[playerid], 2);
	PlayerTextDrawColor(playerid, Orange1[playerid], -2686721);
	PlayerTextDrawBackgroundColor(playerid, Orange1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Orange1[playerid], -2686721);
	PlayerTextDrawUseBox(playerid, Orange1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Orange1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Orange1[playerid], 0);

	icon[playerid] = CreatePlayerTextDraw(playerid, 494.000000, 115.000000, "X");
	PlayerTextDrawFont(playerid, icon[playerid], 1);
	PlayerTextDrawLetterSize(playerid, icon[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, icon[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, icon[playerid], 1);
	PlayerTextDrawSetShadow(playerid, icon[playerid], 0);
	PlayerTextDrawAlignment(playerid, icon[playerid], 1);
	PlayerTextDrawColor(playerid, icon[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, icon[playerid], 255);
	PlayerTextDrawBoxColor(playerid, icon[playerid], 50);
	PlayerTextDrawUseBox(playerid, icon[playerid], 0);
	PlayerTextDrawSetProportional(playerid, icon[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, icon[playerid], 0);

	icon1[playerid] = CreatePlayerTextDraw(playerid, 494.000000, 115.000000, "V");
	PlayerTextDrawFont(playerid, icon1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, icon1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, icon1[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, icon1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, icon1[playerid], 0);
	PlayerTextDrawAlignment(playerid, icon1[playerid], 1);
	PlayerTextDrawColor(playerid, icon1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, icon1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, icon1[playerid], 50);
	PlayerTextDrawUseBox(playerid, icon1[playerid], 0);
	PlayerTextDrawSetProportional(playerid, icon1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, icon1[playerid], 0);

	icon2[playerid] = CreatePlayerTextDraw(playerid, 498.000000, 115.000000, "!");
	PlayerTextDrawFont(playerid, icon2[playerid], 1);
	PlayerTextDrawLetterSize(playerid, icon2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, icon2[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, icon2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, icon2[playerid], 0);
	PlayerTextDrawAlignment(playerid, icon2[playerid], 1);
	PlayerTextDrawColor(playerid, icon2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, icon2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, icon2[playerid], 50);
	PlayerTextDrawUseBox(playerid, icon2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, icon2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, icon2[playerid], 0);

	msg_loading[playerid] = CreatePlayerTextDraw(playerid, 518.000000, 108.000000, "");
	PlayerTextDrawFont(playerid, msg_loading[playerid], 1);
	PlayerTextDrawLetterSize(playerid, msg_loading[playerid], 0.183333, 1.100000);
	PlayerTextDrawTextSize(playerid, msg_loading[playerid], 620.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, msg_loading[playerid], 0);
	PlayerTextDrawSetShadow(playerid, msg_loading[playerid], 0);
	PlayerTextDrawAlignment(playerid, msg_loading[playerid], 1);
	PlayerTextDrawColor(playerid, msg_loading[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, msg_loading[playerid], 255);
	PlayerTextDrawBoxColor(playerid, msg_loading[playerid], 50);
	PlayerTextDrawUseBox(playerid, msg_loading[playerid], 0);
	PlayerTextDrawSetProportional(playerid, msg_loading[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, msg_loading[playerid], 0);
}

stock Notice(playerid, type, text[], time) // 1: Success // 2:Error // 3:Warning
{
    switch(type)
    {
        case 1:
        {
            PlayerTextDrawShow(playerid, Green[playerid]);
            PlayerTextDrawShow(playerid, Green1[playerid]);
            PlayerTextDrawShow(playerid, icon1[playerid]);
        }
        case 2:
        {
            PlayerTextDrawShow(playerid, Red[playerid]);
            PlayerTextDrawShow(playerid, Red1[playerid]);
            PlayerTextDrawShow(playerid, icon[playerid]);
        }
        case 3:
        {
            PlayerTextDrawShow(playerid, Orange[playerid]);
            PlayerTextDrawShow(playerid, Orange1[playerid]);
            PlayerTextDrawShow(playerid, icon2[playerid]);
        }
    }
	if(strlen(text) <= 72)
    {
		PlayerTextDrawSetString(playerid, msg_loading[playerid], text);
    	PlayerTextDrawShow(playerid, msg_loading[playerid]);
	}
	else{

	}
    SetTimerEx("HideNotice",time*1000, 0, "i", playerid);
}


forward HideNotice(playerid);
public HideNotice(playerid)
{
    PlayerTextDrawHide(playerid, Green[playerid]);
    PlayerTextDrawHide(playerid, Green1[playerid]);
    PlayerTextDrawHide(playerid, Red[playerid]);
    PlayerTextDrawHide(playerid, Red1[playerid]);
    PlayerTextDrawHide(playerid, Orange[playerid]);
    PlayerTextDrawHide(playerid, Orange1[playerid]);
    PlayerTextDrawHide(playerid, icon[playerid]);
    PlayerTextDrawHide(playerid, icon1[playerid]);
    PlayerTextDrawHide(playerid, icon2[playerid]);
    PlayerTextDrawHide(playerid, msg_loading[playerid]);
}
CMD:test1(playerid, params[])
{
    Notice(playerid, 1,"Message Test", 5);
    return 1;
}

CMD:test2(playerid, params[])
{
    Notice(playerid, 2,"Message Test", 5);
    return 1;
}
CMD:test3(playerid, params[])
{
    Notice(playerid, 3,"Message Test", 5);
    return 1;
}