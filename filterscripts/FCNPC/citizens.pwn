/* ---------------------------------
	 FCNPC Plugin citizens FS

- File: citizens.pwn
- Author: OrMisicL
- Contributor: ziggi
---------------------------------*/

#define FILTERSCRIPT

#include <a_samp>

#if !defined _FCNPC_included
	#tryinclude <FCNPC>
#endif

#if !defined _FCNPC_included
	#tryinclude "FCNPC"
#endif

#if !defined _FCNPC_included
	#tryinclude "../FCNPC"
#endif

#if !defined _FCNPC_included
	#error Add FCNPC.inc to your scripts directory
#endif

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_RED  0xB35959AA

#define LOS_SANTOS

forward Float:frandom(Float:max);

new
	gMaxCitizens,
	gCitizenID[MAX_PLAYERS] = {INVALID_PLAYER_ID, ...};
new Float:PosNPC[][4] = {
	{185.8267,-1400.2510,46.1739,326.9644},
	{171.8762,-1391.7059,47.8544,141.7069},
	{85.3542,-1519.5524,4.4142,166.2621},
	{109.2484,-1557.6169,7.2420,222.5634},
	{103.1040,-1524.1533,6.1406,50.5798},
	{216.9078,-1627.1790,13.6775,216.4812},
	{413.7880,-1695.4137,8.9830,272.7476},
	{379.4137,-1657.5133,32.4746,14.8500},
	{362.8653,-1659.3657,32.4451,189.8795},
	{361.7120,-2037.4329,7.4037,180.3475},
	{377.2819,-2044.6642,7.3986,230.0260},
	{395.3539,-2081.1743,7.3979,199.4885},
	{353.7886,-2085.0193,7.4004,79.1753},
	{377.1222,-1931.0717,7.3940,354.7322},
	{618.7460,-1669.4929,15.6808,320.3842},
	{618.9812,-1571.4397,15.5839,1.2680},
	{619.9070,-1422.1353,13.3234,0.6426},
	{619.5402,-1380.4364,13.4155,0.3685},
	{619.6262,-1330.2654,13.1732,359.5887},
	{653.1669,-1326.2118,13.0949,269.7559},
	{787.8340,-1327.2811,13.1113,269.6730},
	{847.2637,-1335.0555,13.1662,279.3029},
	{911.4812,-1334.3671,13.1124,268.8287},
	{927.3492,-1334.7495,13.1077,268.5605},
	{984.7519,-1333.8246,13.1096,273.6203},
	{1102.8369,-1386.6421,13.2822,284.6151},
	{1147.1008,-1388.4142,13.3995,271.1040},
	{1187.2914,-1381.0441,13.1267,125.6741},
	{1188.4080,-1331.5220,13.1248,353.4045},
	{1187.8826,-1294.3822,13.1154,344.0825},
	{1217.5908,-1287.9814,13.1443,255.6891},
	{1287.0051,-1289.0342,13.1070,270.4109},
	{1330.9960,-1288.7191,13.1112,270.4114},
	{1364.9777,-1281.3805,13.1118,159.6463},
	{1365.1331,-1382.0471,13.2300,178.2923},
	{1391.6213,-1418.9192,13.1177,219.9573},
	{1439.4990,-1446.1060,13.5547,261.2202},
	{1463.5510,-1446.9819,13.1144,249.3451},
	{1522.9924,-1448.4705,13.1027,271.7745},
	{1676.1597,-1446.4952,13.1490,267.1495},
	{1761.3177,-1451.8983,13.1110,261.7121},
	{1838.9197,-1469.6970,13.1336,256.1781},
	{1839.5089,-1447.6764,13.1188,12.7579},
	{1839.5460,-1271.0353,13.1103,0.0046},
	{1838.7410,-1191.7520,23.3161,1.5023},
	{1862.9019,-1186.8496,23.3917,299.5533},
	{1862.7246,-1348.5112,13.1228,264.3688},
	{1962.9279,-1347.7469,23.1092,269.7425},
	{1986.7546,-1334.9327,23.5475,297.5973},
	{1984.3063,-1291.8658,24.5814,66.1818},
	{1974.5686,-1299.9371,24.5796,172.5114},
	{1980.8344,-1312.7770,24.5826,249.7190},
	{1977.3291,-1451.9314,13.1206,171.8941},
	{1996.7650,-1454.0592,13.1249,282.7941},
	{2103.1853,-1455.3865,23.5648,267.2260},
	{2137.0371,-1394.5365,23.5669,1.0252},
	{2220.0256,-1391.7115,23.5686,267.7749},
	{2280.6907,-1390.6559,23.6528,271.7435},
	{2312.0161,-1375.9917,23.6014,336.2484},
	{2310.8950,-1310.8204,23.6052,359.3155},
	{2311.1179,-1288.4331,23.5643,353.3760},
	{2171.1189,-1744.6284,13.1061,53.1788},
	{2105.9519,-1757.8628,13.0515,176.0442},
	{2089.8806,-1786.5940,13.1104,162.4041},
	{2100.5999,-1805.4755,13.1220,180.5705},
	{2089.2415,-1835.0028,13.1194,185.9814},
	{2089.1250,-1886.4135,13.1127,180.7079},
	{2089.3586,-1905.3011,13.1149,180.7080},
	{2066.9153,-1924.4331,13.1092,64.1736},
	{1980.3469,-1925.7263,13.1114,90.9477},
	{1968.5334,-2006.7957,13.1340,193.8326},
	{1970.6794,-2050.8442,13.1119,180.8316},
	{1968.5177,-2106.3635,12.9948,172.5221},
	{1933.6193,-1787.9852,12.9513,59.2959},
	{1936.0118,-1765.5433,12.9394,327.0518},
	{1899.9391,-1759.0950,13.0877,83.6764},
	{1834.5891,-1761.2820,13.1113,93.3753},
	{1829.0039,-1854.8013,13.1426,180.5629},
	{1829.7349,-1919.1194,13.1084,180.6846},
	{1815.5812,-1940.0914,13.1141,125.4932},
	{1813.5585,-1866.2396,13.1350,0.8789},
	{1813.2327,-1845.0555,13.1868,0.8879},
	{1813.2771,-1735.3467,13.0574,358.2077},
	{1813.9125,-1624.9807,13.1116,0.1527},
	{1813.8438,-1598.6178,13.1083,0.1521},
	{1838.9608,-1473.3334,13.1280,2.0951},
	{1859.6926,-1482.0074,13.1055,204.7692},
	{1840.8580,-1543.6703,13.1129,156.5286},
	{1828.8770,-1584.0645,13.1047,186.2800},
	{1830.3855,-1603.4810,13.1110,184.4324},
	{1902.3748,-1620.8062,13.1114,268.6151},
	{1929.4408,-1619.8782,13.1077,268.5798},
	{1946.2205,-1644.3529,13.0225,159.9749},
	{1949.4452,-1743.0377,13.1147,53.2502},
	{1931.5433,-1744.2188,13.1096,101.0121}
};
public OnGameModeInit()
{
	FCNPC_UseMoveMode(FCNPC_MOVE_MODE_MAPANDREAS);
	FCNPC_UseMoveMode(FCNPC_MOVE_MODE_COLANDREAS);
}
public OnFilterScriptInit()
{
	//
	gMaxCitizens = GetConsoleVarAsInt("maxnpc");
	// Set the update rate
	FCNPC_SetUpdateRate(80);

	// Open all nodes
	for (new i = 0; i < FCNPC_MAX_NODES; i++) {
		if (!FCNPC_IsNodeOpen(i) && !FCNPC_OpenNode(i)) {
			printf("Error: Failed to open node %d from (scriptfiles/FCNPC/nodes/NODES%d.DAT)", i, i);
			return 0;
		}
	}
	new
		name[MAX_PLAYER_NAME + 1],
		npcid;

	for (new i = 0; i < gMaxCitizens; i++) {
		format(name, sizeof(name), "citizen_%d", i + 1);
		npcid = FCNPC_Create(name);
		if (npcid == INVALID_PLAYER_ID) {
			printf("Warning: Failed to create NPC ID %d (%s)", i, name);
			continue;
		}
		gCitizenID[i] = npcid;
		FCNPC_Spawn(npcid, random(299), 0, 0, 0);
	}
	return 1;
}

public OnFilterScriptExit()
{
	// Delete all NPCs
	for (new i = 0; i < MAX_PLAYERS; i++) {
		if (gCitizenID[i] != INVALID_PLAYER_ID) {
			FCNPC_Destroy(gCitizenID[i]);
			gCitizenID[i] = INVALID_PLAYER_ID;
		}
 	}
	for (new i = 0; i < FCNPC_MAX_NODES; i++) {
		if (FCNPC_IsNodeOpen(i)) {
			FCNPC_CloseNode(i);
		}
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp(cmdtext, "/citizen", true, 9) == 0) {
		new
			param[4],
			npcid;

		strmid(param, cmdtext, 10, strlen(cmdtext));
		if (strlen(param) == 0) {
			SendClientMessage(playerid, 0xB35959AA, "Usage: /citizen <ID>");
			return 1;
		}

		npcid = strval(param);

		if (!FCNPC_IsValid(npcid)) {
			SendClientMessage(playerid, 0xB35959AA, "Invalid citizen ID");
			return 1;
		}

		new Float:x, Float:y, Float:z;
		FCNPC_GetPosition(npcid, x, y, z);
		SetPlayerPos(playerid, x + 4, y + 4, z);
		return 1;
	}
	if (strcmp(cmdtext, "/pause", true, 6) == 0) {
		for (new i = 0; i < MAX_PLAYERS; i++) {
			if (gCitizenID[i] != INVALID_PLAYER_ID) {
				FCNPC_PausePlayingNode(gCitizenID[i]);
			}
		}
		return 1;
	}
	if (strcmp(cmdtext, "/resume", true, 7) == 0) {
		for (new i = 0; i < MAX_PLAYERS; i++) {
			if (gCitizenID[i] != INVALID_PLAYER_ID) {
				FCNPC_ResumePlayingNode(gCitizenID[i]);
			}
		}
		return 1;
	}
	return 0;
}

stock MoveNPC(npcid)
{
	new random_npc = random(sizeof(PosNPC));
	FCNPC_GoTo(npcid, PosNPC[random_npc][0], PosNPC[random_npc][1], PosNPC[random_npc][2],FCNPC_MOVE_TYPE_AUTO,FCNPC_MOVE_SPEED_AUTO,FCNPC_MOVE_MODE_COLANDREAS);
	return 1;
}
public FCNPC_OnSpawn(npcid)
{
	MoveNPC(npcid);
	printf("Citizen_%d da login vao may chu LSRP", npcid);
	return 1;
}

