#include <YSI\y_hooks>

#define DIALOG_INPUTRUTTIEN (1993)
#define DIALOG_INPUTNAPTIEN (1994)
#define DIALOG_INPUTPLAYER (1995)
#define DIALOG_INPUTCHUYENTIEN (1996)

new Float:BankSpawns[2][4] = {
	{1496.0426,-1749.2876,15.4453,178.3618},
	{1929.2086,-1780.8439,13.5469,87.8284}
};

new idnguoichuyen,
	sotienchuyen;

stock ShowBankTD(playerid){
	new string[128];
	ATMTD[playerid][0] = CreatePlayerTextDraw(playerid, 35.893142, -21.166664, "mdl-2018:atm");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ATMTD[playerid][0], 584.000000, 425.000000);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][0], 0);

	ATMTD[playerid][1] = CreatePlayerTextDraw(playerid, 323.355651, 297.099945, "mdl-2019:Thoat");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ATMTD[playerid][1], 39.000000, 51.000000);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, ATMTD[playerid][1], true);

	ATMTD[playerid][2] = CreatePlayerTextDraw(playerid, 456.016204, 296.483215, "mdl-2020:chuyentien");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ATMTD[playerid][2], 40.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, ATMTD[playerid][2], true);

	ATMTD[playerid][3] = CreatePlayerTextDraw(playerid, 368.197387, 296.733123, "mdl-2021:naptien");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ATMTD[playerid][3], 40.000000, 51.000000);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, ATMTD[playerid][3], true);

	ATMTD[playerid][4] = CreatePlayerTextDraw(playerid, 412.343658, 295.900054, "mdl-2022:ruttien");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ATMTD[playerid][4], 40.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, ATMTD[playerid][4], true);

	ATMTD[playerid][5] = CreatePlayerTextDraw(playerid, 310.614898, 135.000015, "999999");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][5], 0.348931, 2.200829);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][5], 0);

	ATMTD[playerid][6] = CreatePlayerTextDraw(playerid, 416.632476, 60.299995, "Tyler_Pylon");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][6], 0.164333, 1.349166);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][6], 0);

	ATMTD[playerid][7] = CreatePlayerTextDraw(playerid, 153.860336, 256.966735, "0911776022");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][7], 0.148404, 1.261666);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][7], -2147483393);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][7], 0);

	ATMTD[playerid][8] = CreatePlayerTextDraw(playerid, 153.660324, 289.768737, "10000000");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][8], 0.148404, 1.261666);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][8], -2147483393);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][8], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][8], 0);

	ATMTD[playerid][9] = CreatePlayerTextDraw(playerid, 152.891784, 324.970916, "10000000");
	PlayerTextDrawLetterSize(playerid, ATMTD[playerid][9], 0.148404, 1.261666);
	PlayerTextDrawAlignment(playerid, ATMTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, ATMTD[playerid][9], -2147483393);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, ATMTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, ATMTD[playerid][9], 255);
	PlayerTextDrawFont(playerid, ATMTD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, ATMTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, ATMTD[playerid][9], 0);

	//Tien Ngan Hang
	format(string, sizeof(string), "%i",PlayerInfo[playerid][pAccount], string);
    PlayerTextDrawSetString(playerid, ATMTD[playerid][5] , string);

    //Tien Tiet Kiem
    format(string, sizeof(string), "%d",PlayerInfo[playerid][pDiemthuongbank], string);
    PlayerTextDrawSetString(playerid, ATMTD[playerid][8] , string);

    //Diem Thuong
    format(string, sizeof(string), "%d",PlayerInfo[playerid][pTientietkiembank], string);
    PlayerTextDrawSetString(playerid, ATMTD[playerid][9] , string);


	PlayerTextDrawShow(playerid, ATMTD[playerid][0]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][1]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][2]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][3]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][4]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][5]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][6]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][7]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][8]);
	PlayerTextDrawShow(playerid, ATMTD[playerid][9]);
	return 1;
}

stock HideBankTD(playerid){
	PlayerTextDrawHide(playerid, ATMTD[playerid][0]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][1]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][2]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][3]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][4]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][5]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][6]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][7]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][8]);
	PlayerTextDrawHide(playerid, ATMTD[playerid][9]);
	return 1;
}



CMD:nganhang(playerid, params[])
{
    for (new i = 0; i < sizeof(BankSpawns); i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 10.0, BankSpawns[i][0], BankSpawns[i][1], BankSpawns[i][2]))
        {
            ShowBankTD(playerid);
            SelectTextDraw(playerid, 0x808080AA);
            SendClientMessage(playerid, -1, "Banking: Bạn đang đứng trong vùng BankSpawns!");
            return 1;
        }
    }
    SendClientMessage(playerid, COLOR_RED, "He Thong: Ban khong dung gan cay atm nao ca!");
    return 0;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if(newkeys == KEY_YES){
		cmd_nganhang(playerid, "\1");
	}
	return 1;
}

hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid){
	//Thoat
	if(playertextid == ATMTD[playerid][1])
    {
    	HideBankTD(playerid);
   		CancelSelectTextDraw(playerid);
        return 1;
    }
    //Chuyentien
    if(playertextid == ATMTD[playerid][2]){
    	if(gettime()-GetPVarInt(playerid, "Chuyentien") < 10) return SendClientMessageEx(playerid, COLOR_GRAD2, "He Thong: Ban chi co the su dung giao dich 10 giay 1 lan, xin vui long doi!");
    	ShowPlayerDialog(playerid, DIALOG_INPUTPLAYER, DIALOG_STYLE_INPUT,"BANKING - Chuyen Tien", "Nhap dia chi nguoi can chuyen [ID]:","Dong y","Huy bo");
    }
   	//Naptien
   	if(playertextid == ATMTD[playerid][3]){
   		ShowPlayerDialog(playerid, DIALOG_INPUTNAPTIEN, DIALOG_STYLE_INPUT,"BANKING - NAP TIEN","Nhap so tien can nap:","Dong y","Huy bo");
   	}
   	//Rutien
   	if(playertextid == ATMTD[playerid][4]){
   		HideBankTD(playerid);
   		ShowPlayerDialog(playerid,DIALOG_INPUTRUTTIEN,DIALOG_STYLE_INPUT,"BANKING - RUT TIEN","Nhap so tien can rut:","Dong y","Huy bo");
   	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	if(dialogid == DIALOG_INPUTRUTTIEN){
		if(response){
			new sotienrut = strval(inputtext);
			new string[128];
			if(sotienrut < 0){
				SendClientMessage(playerid,COLOR_RED,"Banking: Ban khong the rut duoi 0$!");
			}
			if(sotienrut > PlayerInfo[playerid][pCash]){
				SendClientMessage(playerid,COLOR_RED,"Banking: tai khoan cua ban khong du!");
			}
			PlayerInfo[playerid][pCash] += sotienrut;
			PlayerInfo[playerid][pAccount] -= sotienrut;
			format(string,sizeof(string),"Banking: Ban vua rut ra khoi tai khoan ngan hang [%d]",sotienrut);
			SendClientMessage(playerid,-1,string);
		}
	}
	if(dialogid == DIALOG_INPUTNAPTIEN){
		if(response){
			new sotiennap = strval(inputtext);
			new string[128];
			if(sotiennap < 0){
				SendClientMessage(playerid,COLOR_RED,"Banking: Ban khong the nap duoi 0$!");
			}
			if(sotiennap > PlayerInfo[playerid][pCash]){
				SendClientMessage(playerid,COLOR_RED,"Banking: tai khoan cua ban khong du!");
			}
			PlayerInfo[playerid][pCash] -= sotiennap;
			PlayerInfo[playerid][pAccount] += sotiennap;
			format(string,sizeof(string),"Banking: Ban vua nap vao tai khoan ngan hang [%d]",sotiennap);
			SendClientMessage(playerid,-1,string);
		}
	}
	if(dialogid == DIALOG_INPUTPLAYER){
		if(response){
			idnguoichuyen = strval(inputtext);
			ShowPlayerDialog(playerid,DIALOG_INPUTCHUYENTIEN,DIALOG_STYLE_INPUT,"Banking - Chuyen Tien","Nhap so tien can chuyen:","Dong y","Huy bo");
		}
	}
	if(dialogid == DIALOG_INPUTCHUYENTIEN){
		if(response){
			sotienchuyen = strval(inputtext);
			new string[128];
			if (IsPlayerConnected(idnguoichuyen))
			{
				if(idnguoichuyen != INVALID_PLAYER_ID)
				{
					if(gPlayerLogged{idnguoichuyen} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "He Thong: Nguoi choi ma ban co gang chuyen tien khong dang nhap!");
					new playermoney = PlayerInfo[playerid][pAccount];
					if(sotienchuyen > 0 && playermoney >= sotienchuyen)
					{
						PlayerInfo[playerid][pAccount] -= sotienchuyen;
						PlayerInfo[idnguoichuyen][pAccount] += sotienchuyen;
						format(string, sizeof(string), "He Thong: Ban da chuyen $%s cho tai vao tai khoan %s's.", number_format(sotienchuyen), GetPlayerNameEx(idnguoichuyen),idnguoichuyen);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessageEx(playerid, COLOR_GRAD1, string);
						format(string, sizeof(string), "He Thong: Bam da nhan duoc $%s vao tai khoan %s.", number_format(sotienchuyen), GetPlayerNameEx(playerid), playerid);
						SendClientMessageEx(idnguoichuyen, COLOR_GRAD1, string);
						new ip[32], ipex[32];
						GetPlayerIp(playerid, ip, sizeof(ip));
						GetPlayerIp(idnguoichuyen, ipex, sizeof(ipex));
						format(string, sizeof(string), "[BANK] %s (IP:%s) da chuyen $%s den %s (IP:%s).", GetPlayerNameEx(playerid), ip, number_format(sotienchuyen), GetPlayerNameEx(idnguoichuyen), ipex);
						SetPVarInt(playerid, "Chuyentien", gettime());
					}
					else
					{
						SendClientMessageEx(playerid, COLOR_RED, "He Thong: So tien giao dich khong hop le.");
					}
				}
			}
			else SendClientMessageEx(playerid, COLOR_RED, "He Thong: Nguoi choi khong hop le.");
		}
	}
	return 1;
}


CMD:setbank(playerid,params[]){
	new string[1280];
	PlayerInfo[playerid][pAccount] += 100000;
	PlayerInfo[playerid][pTientietkiembank] += 10000;
	PlayerInfo[playerid][pDiemthuongbank] += 10000;
	format(string,sizeof(string),"Tien ngan hang %d, Tien tiet kiem %d , Diem thuong %d",PlayerInfo[playerid][pAccount],PlayerInfo[playerid][pTientietkiembank],PlayerInfo[playerid][pDiemthuongbank]);
	SendClientMessage(playerid,-1,string);
	return 1;
}
