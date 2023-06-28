#include <YSI\y_hooks>
#include <ZCMD>
#pragma disablerecursion


CMD:testz(playerid, params[])
{   
    TogglePlayerControllable(playerid, 1);
    switch(random(8))
    {
        case 0:
        {
            SetPlayerCheckpoint(playerid, 1844.7462,-1540.7643,13.5157, 0.8);
            SetPlayerPos(playerid, 1844.7462,-1540.7643-5,13.5157);
            Electric_Checkpoint[playerid] = 1;
        }
        case 1:
        {
            SetPlayerCheckpoint(playerid, 1879.5857,-1073.9650,23.8401, 0.8);
            SetPlayerPos(playerid,1879.5857,-1073.9650-5,23.8401);
            Electric_Checkpoint[playerid] = 2;
        }
        case 2:
        {
            SetPlayerCheckpoint(playerid, 2223.6174,-1475.9095,23.9735, 0.8);
            SetPlayerPos(playerid,2223.6174,-1475.9095-5,23.9735);
            Electric_Checkpoint[playerid] = 3;
        }
        case 3:
        {
            SetPlayerCheckpoint(playerid, 2331.7146,-1375.1556,23.9999, 0.8);
            SetPlayerPos(playerid,2331.7146,-1375.1556-5,23.9999);
            Electric_Checkpoint[playerid] = 4;
        }
        case 4:
        {
            SetPlayerCheckpoint(playerid, 2404.8762,-1990.4016,13.5469, 0.8);
            SetPlayerPos(playerid, 2404.8762,-1990.4016,13.5469);
            Electric_Checkpoint[playerid] = 5;
        }
        case 5:
        {
            SetPlayerCheckpoint(playerid, 1073.6544,-1057.0197,30.5346, 0.8);
            SetPlayerPos(playerid, 1073.6544,-1057.0197-5,30.5346);
            Electric_Checkpoint[playerid] = 6;
        }
        case 6:
        {
            SetPlayerCheckpoint(playerid, 2037.2118,-1715.9128,13.5469, 0.8);
            SetPlayerPos(playerid,2037.2118,-1715.9128-5,13.5469);
            Electric_Checkpoint[playerid] = 7;
        }
        case 7:
        {
            SetPlayerCheckpoint(playerid, 984.3871,-474.8675,49.1033, 0.8);
            SetPlayerPos(playerid,984.3871,-474.8675-5,49.1033);
            Electric_Checkpoint[playerid] = 8;
        }
    }
    return 1;
}


