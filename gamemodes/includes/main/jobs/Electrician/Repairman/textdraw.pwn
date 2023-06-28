#include <YSI\y_hooks>

hook OnPlayerConnect(playerid)
{
	ElectricMenu[playerid][0] = CreatePlayerTextDraw(playerid, 324.000000, 169.000000, "_");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][0], 0.600000, 16.999988);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][0], 343.500000, 183.500000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][0], 2);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][0], 0);

	ElectricMenu[playerid][1] = CreatePlayerTextDraw(playerid, 234.000000, 314.000000, "~r~ERROR: 80/100");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][1], 0.216665, 0.699998);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][1], 1);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][1], 0);

	ElectricMenu[playerid][2] = CreatePlayerTextDraw(playerid, 282.000000, 172.000000, "ELECTRIC MENU");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][2], 0.308333, 1.549998);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][2], 1);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][2], 0);

	ElectricMenu[playerid][3] = CreatePlayerTextDraw(playerid, 226.000000, 194.000000, " 1 ~n~ 2 ~n~ 3 ~n~ 4 ~n~ 5");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][3], 0.462500, 1.600000);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][3], 1);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][3], 0);

	ElectricMenu[playerid][4] = CreatePlayerTextDraw(playerid, 323.000000, 270.000000, "HU HONG DAY DIEN SO 5");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][4], 0.258332, 1.049998);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][4], 16.500000, 150.500000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][4], 2);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][4], 200);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][4], 0);

	ElectricMenu[playerid][5] = CreatePlayerTextDraw(playerid, 321.000000, 292.000000, "sua chua");
	PlayerTextDrawFont(playerid, ElectricMenu[playerid][5], 3);
	PlayerTextDrawLetterSize(playerid, ElectricMenu[playerid][5], 0.395832, 1.750000);
	PlayerTextDrawTextSize(playerid, ElectricMenu[playerid][5], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, ElectricMenu[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ElectricMenu[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, ElectricMenu[playerid][5], 2);
	PlayerTextDrawColor(playerid, ElectricMenu[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, ElectricMenu[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, ElectricMenu[playerid][5], 255);
	PlayerTextDrawUseBox(playerid, ElectricMenu[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, ElectricMenu[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ElectricMenu[playerid][5], 1);

	ElectricProgress[playerid][0] = CreatePlayerProgressBar(playerid, 248.000000, 200.000000, 155.000000, 4.000000, -1, 100.000000);
	SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][0], 100.000000);

	ElectricProgress[playerid][1] = CreatePlayerProgressBar(playerid, 248.000000, 215.000000, 155.000000, 4.000000, 16711935, 100.000000);
	SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][1], 100.000000);

	ElectricProgress[playerid][2] = CreatePlayerProgressBar(playerid, 248.000000, 229.000000, 155.000000, 4.000000, 65535, 100.000000);
	SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][2], 100.000000);

	ElectricProgress[playerid][3] = CreatePlayerProgressBar(playerid, 248.000000, 244.000000, 155.000000, 4.000000, -2686721, 100.000000);
	SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][3], 100.000000);

	ElectricProgress[playerid][4] = CreatePlayerProgressBar(playerid, 248.000000, 259.000000, 155.000000, 4.000000, -16776961, 100.000000);
	SetPlayerProgressBarValue(playerid, ElectricProgress[playerid][4], 100.000000);
	return 1;
}