stock ThuThang(playerid){
    if(GetPVarInt(playerid, "DaLeoLen_") == 0) {
        new Float:PlayerPosElectric[3];
        GetPlayerPos(playerid, PlayerPosElectric[0], PlayerPosElectric[1], PlayerPosElectric[2]);

        SetPlayerPos(playerid, PlayerPosElectric[0], PlayerPosElectric[1]-1.5, PlayerPosElectric[2]-9);

        MoveObject(StairInfo[playerid][lid][1], StairInfo[playerid][lx], StairInfo[playerid][ly], StairInfo[playerid][lz], 2.00);
        MoveObject(StairInfo[playerid][lid][2], StairInfo[playerid][lx], StairInfo[playerid][ly], StairInfo[playerid][lz], 2.00);
        MoveObject(StairInfo[playerid][lid][3], StairInfo[playerid][lx], StairInfo[playerid][ly], StairInfo[playerid][lz], 2.00);
        MoveObject(StairInfo[playerid][lid][4], StairInfo[playerid][lx], StairInfo[playerid][ly], StairInfo[playerid][lz], 2.00);

        DestroyObject(StairInfo[playerid][lid][1]);
        DestroyObject(StairInfo[playerid][lid][2]);
        DestroyObject(StairInfo[playerid][lid][3]);
        DestroyObject(StairInfo[playerid][lid][4]);
    }
    else SendClientMessage(playerid, -1,"Ban phai di xuong de co the thu chiec thang nay");
    return 1;
}


