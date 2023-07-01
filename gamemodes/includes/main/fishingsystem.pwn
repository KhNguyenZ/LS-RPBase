/*

##    ## ##     ##    ##    ##  ######   ##     ## ##    ## ######## ##    ## 
##   ##  ##     ##    ###   ## ##    ##  ##     ##  ##  ##  ##       ###   ## 
##  ##   ##     ##    ####  ## ##        ##     ##   ####   ##       ####  ## 
#####    #########    ## ## ## ##   #### ##     ##    ##    ######   ## ## ## 
##  ##   ##     ##    ##  #### ##    ##  ##     ##    ##    ##       ##  #### 
##   ##  ##     ##    ##   ### ##    ##  ##     ##    ##    ##       ##   ### 
##    ## ##     ##    ##    ##  ######    #######     ##    ######## ##    ## 
			Viet hoa boi Nhat Nam & Phat trien boi Khoi Nguyen	

						Fishing Job System

				Next Generation Gaming, LLC
	(created by Next Generation Gaming Development Team)

	* Copyright (c) 2014, Next Generation Gaming, LLC
	*
	* All rights reserved.
	*
	* Redistribution and use in source and binary forms, with or without modification,
	* are not permitted in any case.
	*
	*
	* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
	* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
	* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// WINTERFIELD: VERSION .278 FISHING SYSTEM

#include <YSI\y_hooks>

hook OnPlayerEnterCheckpoint(playerid) {

    if(GetPVarInt(playerid, "pSellingFish"))
    {
        DisablePlayerCheckpoint(playerid);
        DeletePVar(playerid, "pSellingFish");
        SendClientMessageEx(playerid, COLOR_WHITE, "Ban da den dich. Dung /sellfish [so luong] de ban so ca cua ban.");
    }
    return 1;
}

IncreaseFishingLevel(playerid) {
    
    if(PlayerInfo[playerid][pDoubleEXP] > 0)
    {
        PlayerInfo[playerid][pFishingSkill] += 2;
        format(szMiscArray, sizeof(szMiscArray), "Ban da nhan duoc 2 diem ky nang cau ca thay vi 1. Ban %d gio con tren cai doi EXP ma thong bao.", PlayerInfo[playerid][pDoubleEXP]);
        SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
        // PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE * 2;
    }
    else
    {
        PlayerInfo[playerid][pFishingSkill] += 1;
        // PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE;
    }
    return 1;
}

CMD:fishhelp(playerid, params[])
{
	SetPVarInt(playerid, "HelpResultCat0", 5);
	Help_ListCat(playerid, DIALOG_HELPCATOTHER1);
	return 1;
}

CMD:ofishhelp(playerid, params[])
{
    SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
    SendClientMessageEx(playerid, COLOR_WHITE,"*** FISH HELP *** - go lenh de biet them thong tin.");
    SendClientMessageEx(playerid, COLOR_GRAD3,"*** FISHING *** /fish (Co gang bat mot con ca)   /myfish (Hien thi nhung con ca ban da bat duoc)");
    SendClientMessageEx(playerid, COLOR_GRAD3,"*** FISHING *** /sellfish (Ban ca cua ban)");
    return 1;
}

CMD:fish(playerid, params[]) {
    //if(PlayerInfo[playerid][pJob] == 70 || PlayerInfo[playerid][pJob2] == 70 || PlayerInfo[playerid][pJob3] == 70)
    {
        if(IsABoat(GetPlayerVehicleID(playerid)))
        {
            {
                if(PlayerInfo[playerid][pFishWeight] <= 1000)
                {
                    if(GetPVarInt(playerid, "pFishTime") < gettime())
                    {
						switch(PlayerInfo[playerid][pFishingSkill])
                        {
                            case 0 .. 49:
                            {
                         		switch(random(2))
                        		{
                        		    case 0:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da khong bat duoc gi!");
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 1:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot ca mang xanh!");
    									
    									PlayerInfo[playerid][pFishWeight] += 5;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 2:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca vuoc!");
    									
    									PlayerInfo[playerid][pFishWeight] += 7;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
								}
                            }
                            case 50 .. 99:
                            {
                         		switch(random(4))
                        		{
                        		    case 0:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da khong bat duoc gi!");
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 1:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot ca mang xanh!");

    									PlayerInfo[playerid][pFishWeight] += 5;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 2:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca vuoc!");

    									PlayerInfo[playerid][pFishWeight] += 7;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 3:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca tuyet!");

    									PlayerInfo[playerid][pFishWeight] += 14;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 4:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca da tron!");

    									PlayerInfo[playerid][pFishWeight] += 17;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
								}
                            }
                            case 100 .. 199:
                            {
                         		switch(random(8))
                        		{
                        		    case 0:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da khong bat duoc gi!");
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 1:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot ca mang xanh!");

    									PlayerInfo[playerid][pFishWeight] += 5;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 2:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca vuoc!");

    									PlayerInfo[playerid][pFishWeight] += 7;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 3:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca tuyet!");

    									PlayerInfo[playerid][pFishWeight] += 14;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 4:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca da tron!");

    									PlayerInfo[playerid][pFishWeight] += 17;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 5:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot pike!");

    									PlayerInfo[playerid][pFishWeight] += 24;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
                                        IncreaseFishingLevel(playerid);
									}
									case 6:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con zander!");

    									PlayerInfo[playerid][pFishWeight] += 30;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 7:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca thu!");

    									PlayerInfo[playerid][pFishWeight] += 35;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 8:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con molly!");

    									PlayerInfo[playerid][pFishWeight] += 40;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
								}
                            }
                            case 200 .. 399:
                            {
                         		switch(random(11))
                        		{
                        		    case 0:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da khong bat duoc gi!");
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 1:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot ca mang xanh!");

    									PlayerInfo[playerid][pFishWeight] += 5;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 2:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca vuoc!");

    									PlayerInfo[playerid][pFishWeight] += 7;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 3:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca tuyet!");

    									PlayerInfo[playerid][pFishWeight] += 14;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 4:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca da tron!");

    									PlayerInfo[playerid][pFishWeight] += 17;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 5:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot pike!");

    									PlayerInfo[playerid][pFishWeight] += 24;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 6:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con zander!");

    									PlayerInfo[playerid][pFishWeight] += 30;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 7:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca thu!");

    									PlayerInfo[playerid][pFishWeight] += 35;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 8:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con molly!");

    									PlayerInfo[playerid][pFishWeight] += 40;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 9:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca kiem!");

    									PlayerInfo[playerid][pFishWeight] += 70;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 10:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot tench!");

    									PlayerInfo[playerid][pFishWeight] += 71;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 11:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cau duoc mot con ca chem!");

    									PlayerInfo[playerid][pFishWeight] += 80;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
								}
                            }
							default:
							{
                         		switch(random(12))
                        		{
                        		    case 0:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da khong bat duoc gi!");
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 1:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot ca mang xanh!");

    									PlayerInfo[playerid][pFishWeight] += 5;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 2:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca vuoc!");

    									PlayerInfo[playerid][pFishWeight] += 7;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 3:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca tuyet!");

    									PlayerInfo[playerid][pFishWeight] += 14;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 4:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca da tron!");

    									PlayerInfo[playerid][pFishWeight] += 17;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 5:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot pike!");

    									PlayerInfo[playerid][pFishWeight] += 24;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 6:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con zander!");

    									PlayerInfo[playerid][pFishWeight] += 30;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 7:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca thu!");

    									PlayerInfo[playerid][pFishWeight] += 35;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 8:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con molly!");

    									PlayerInfo[playerid][pFishWeight] += 40;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 9:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con ca kiem!");

    									PlayerInfo[playerid][pFishWeight] += 70;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 10:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot tench!");

    									PlayerInfo[playerid][pFishWeight] += 71;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 11:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da cau duoc mot con ca chem!");

    									PlayerInfo[playerid][pFishWeight] += 80;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
									case 12:
                            		{
                						format(szMiscArray, sizeof szMiscArray, "{FF8000}* {C2A2DA}%s nem cay gay cua ho ra, quay no tro lai", GetPlayerNameEx(playerid));
    									SetPlayerChatBubble(playerid, szMiscArray, COLOR_PURPLE, 30.0, 4000);
    									SendClientMessageEx(playerid, COLOR_PURPLE, szMiscArray);

    									SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Ban da bat duoc mot con kraken!");

    									PlayerInfo[playerid][pFishWeight] += 200;
    									
    									SetPVarInt(playerid, "pFishTime", gettime() + 10);
    									IncreaseFishingLevel(playerid);
									}
								}
							}
						}
					}
					else SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban phai doi them 10 giay truoc khi co the su dung lai!");
				}
				else SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban da dat den trong luong toi da cua ban. Dung /sellfish de kiem loi nhuan.");
            }
        }
        else return SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban khong o tren thuyen!");
    }
    //else SendClientMessageEx(playerid, COLOR_GRAD2, "  You are not a fisherman!");
	return 1;
}

CMD:myfish(playerid, params[]) {

	format(szMiscArray, sizeof(szMiscArray), "Fish: %d lbs.", PlayerInfo[playerid][pFishWeight]);
	SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
	return 1;
}

CMD:sellfish(playerid, params[]) {

	new amount;
    if(GetPVarInt(playerid, "pFishSellTime") < gettime())
    {
        if(PlayerInfo[playerid][pFishWeight] < 50) return SendClientMessageEx(playerid, COLOR_GREY, "Ban it nhat phai co nam muoi can ca de ban chung.");
        if(IsPlayerInRangeOfPoint(playerid, 30.0, 2161.0513,-98.5897,2.7893))
        {
        	if(sscanf(params, "d", amount))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /sellfish [So Luong]");
				format(szMiscArray, sizeof szMiscArray, "Fish: %d lbs.", PlayerInfo[playerid][pFishWeight]);
				return SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
			}
        
            if(amount < 50) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the ban hon 50 pound ca moi lan.");
        	if(PlayerInfo[playerid][pFishWeight] >= amount && PlayerInfo[playerid][pFishWeight] != 0)
       		{
   	    		new rand = random(100) + 100, money = amount * 40 + rand;
				PlayerInfo[playerid][pFishWeight] -= amount;
				GivePlayerCash(playerid, money);

                SetPVarInt(playerid, "pFishSellTime", gettime() + 120);
				
				format(szMiscArray, sizeof szMiscArray, "Ban da ban %d lbs cho $%s.", amount, number_format(money));
				SendClientMessageEx(playerid, COLOR_YELLOW, szMiscArray);
			}
			else return SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban khong co nhieu can nhu vay!");
		}
		else
		{
            if(CheckPointCheck(playerid)) cmd_killcheckpoint(playerid, params);

		    GameTextForPlayer(playerid, "~g~CHECKPOINT ~r~SET", 5000, 4);
            SetPVarInt(playerid, "pSellingFish", 1);
		    SetPlayerCheckpoint(playerid, 2161.0513,-98.5897,2.7893, 10.0);
			return SendClientMessageEx(playerid, COLOR_YELLOW, "Tim duong den tram kiem soat de ban ca cua ban.");
		}
    }
    else SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban phai doi hai phut truoc khi ban lai ca cua minh!");
	return 1;
}
