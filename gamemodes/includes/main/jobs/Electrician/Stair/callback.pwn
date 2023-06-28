hook OnPlayerEnterCheckpoint(playerid)
{
    if(Electric_Checkpoint[playerid] == 1)
    {
        StairInfo[playerid][lx] = 1844.7462, StairInfo[playerid][ly] = -1540.7643,StairInfo[playerid][lz] = 13.5157;
    }
    else if(Electric_Checkpoint[playerid] == 2)
    {
        StairInfo[playerid][lx] = 1879.5857, StairInfo[playerid][ly] = -1073.9650,StairInfo[playerid][lz] = 23.8401;
    }
    else if(Electric_Checkpoint[playerid] == 3)
    {
        StairInfo[playerid][lx] = 2223.6174, StairInfo[playerid][ly] = -1475.9095,StairInfo[playerid][lz] = 23.9735;
    }
    else if(Electric_Checkpoint[playerid] == 4)
    {
        StairInfo[playerid][lx] = 2331.7146, StairInfo[playerid][ly] = -1375.1556,StairInfo[playerid][lz] = 23.9999;
    }
    else if(Electric_Checkpoint[playerid] == 5)
    {
        StairInfo[playerid][lx] = 2404.8762, StairInfo[playerid][ly] = -1990.4016,StairInfo[playerid][lz] = 13.5469;
    }
    else if(Electric_Checkpoint[playerid] == 6)
    {
        StairInfo[playerid][lx] = 1073.6544, StairInfo[playerid][ly] = -1057.0197,StairInfo[playerid][lz] = 30.5346;
    }
    else if(Electric_Checkpoint[playerid] == 7)
    {
        StairInfo[playerid][lx] = 2037.2118, StairInfo[playerid][ly] = -1715.9128,StairInfo[playerid][lz] = 13.5469;
    }
    else if(Electric_Checkpoint[playerid] == 8)
    {
        StairInfo[playerid][lx] = 984.3871, StairInfo[playerid][ly] = -474.8675,StairInfo[playerid][lz] = 49.1033;
    }
    Electric_Checkpoint[playerid] = 0;
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SetPlayerPos(playerid, StairInfo[playerid][lx], StairInfo[playerid][ly]-0.5, StairInfo[playerid][lz]);
    SetPlayerFacingAngle( playerid, 0 );
    for(new i = 1 ; i < 5 ; i++) {
        StairInfo[playerid][lid][i] = CreateObject(1428, StairInfo[playerid][lx], StairInfo[playerid][ly], StairInfo[playerid][lz]+0.5, 0.0, 0.0, 0.0, 300.0);
    }
    SetPVarInt(playerid, "DatThang_", 1);
    ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0, 1, 0, 0, 1,16000, 1);
    MoveObject(StairInfo[playerid][lid][1], StairInfo[playerid][lx], StairInfo[playerid][ly]+0.67, StairInfo[playerid][lz]+3.0, 2.00);
    ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0, 1, 0, 0, 1,16000, 1);
    MoveObject(StairInfo[playerid][lid][2], StairInfo[playerid][lx], StairInfo[playerid][ly]+1.34, StairInfo[playerid][lz]+5.5, 2.00);
    ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0, 1, 0, 0, 1,16000, 1);
    MoveObject(StairInfo[playerid][lid][3], StairInfo[playerid][lx], StairInfo[playerid][ly]+2.01, StairInfo[playerid][lz]+8.0, 2.00);
    ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0, 1, 0, 0, 1,16000, 1);
    MoveObject(StairInfo[playerid][lid][4], StairInfo[playerid][lx], StairInfo[playerid][ly]+2.68, StairInfo[playerid][lz]+10.5, 2.00);
    DisablePlayerCheckpoint(playerid);
    ClearAnimations(playerid);
    SetTimerEx("DoiCauThang", 8000, false, "i", playerid);
    return 1;
}
forward DoiCauThang(playerid);
public DoiCauThang(playerid)
{
    SetTimerEx("LeoCauThang_", 2000, false, "i", playerid);
    TogglePlayerControllable(playerid,0);
}
forward LeoCauThang_(playerid);
public LeoCauThang_(playerid)
{
    SetPlayerPos(playerid, StairInfo[playerid][lx], StairInfo[playerid][ly]+1.5, StairInfo[playerid][lz]+9);
    ClearAnimations(playerid);
    SetPlayerFacingAngle( playerid, 0);
    SetPVarInt(playerid, "DaLeoLen_", 1);
    return 1;
}
hook OnPlayerConnect(playerid)
{
    Electric_Checkpoint[playerid] = 0;
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    Electric_Checkpoint[playerid] = 0;
    DestroyObject(StairInfo[playerid][lid][0]);
    DestroyObject(StairInfo[playerid][lid][1]);
    DestroyObject(StairInfo[playerid][lid][2]);
    DestroyObject(StairInfo[playerid][lid][3]);
    DestroyObject(StairInfo[playerid][lid][4]);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    DestroyObject(StairInfo[playerid][lid][0]);
    DestroyObject(StairInfo[playerid][lid][1]);
    DestroyObject(StairInfo[playerid][lid][2]);
    DestroyObject(StairInfo[playerid][lid][3]);
    DestroyObject(StairInfo[playerid][lid][4]);
    return 1;
}