/*
##    ## ##     ##    ##    ##  ######   ##     ## ##    ## ######## ##    ## 
##   ##  ##     ##    ###   ## ##    ##  ##     ##  ##  ##  ##       ###   ## 
##  ##   ##     ##    ####  ## ##        ##     ##   ####   ##       ####  ## 
#####    #########    ## ## ## ##   #### ##     ##    ##    ######   ## ## ## 
##  ##   ##     ##    ##  #### ##    ##  ##     ##    ##    ##       ##  #### 
##   ##  ##     ##    ##   ### ##    ##  ##     ##    ##    ##       ##   ### 
##    ## ##     ##    ##    ##  ######    #######     ##    ######## ##    ## 
			Viet hoa boi Nhat Nam & Phat trien boi Khoi Nguyen	

//--------------------------------[MAIN NGRP.PWN]--------------------------------

							Next Generation Gaming, LLC
				(created by Next Generation Gaming Development Team)

				Current Developers:
								*** Director of SA:MP Development:
								    KhNguyenZ

 *
 * Copyright (c) 2014, Next Generation Gaming, LLC

  * PHAN MEM NAY DUOC CUNG CAP BOI CAC NGUOI GIU BAN QUYEN VA CAC CONG TAC VIEN
  * "NGUYEN TRANG" VA BAT KY BAO DAM NAO RO RANG HAY NGU Y, BAO GOM NHUNG KHONG
  * GIOI HAN, CAC BAO DAM NGU Y VE KHA NANG BAN DUOC VA SU PHU HOP CHO
  * MOT MUC DICH CU THE DUOC TU CHOI. TRONG MOI TRUONG HOP SO HUU BAN QUYEN HOAC
  * CONG TAC VIEN CHIU TRACH NHIEM PHAP LY VE MOI SU KIEN TRUC TIEP, GIAN TIEP, NGAU NHIEN, DAC BIET,
  * THIET HAI MAU HOAC HAU QUA (BAO GOM NHUNG KHONG GIOI HAN O,
  * MUA SAM HANG HOA HOAC DICH VU THAY THE; MAT SU DUNG, DU LIEU HOAC
  * LOI NHUAN; HOAC GIAN DOAN KINH DOANH) TUY NHIEN NGUYEN NHAN VA TREN BAT KY LY THUYET NAO
  * TRACH NHIEM PHAP LY, DU TRONG HOP DONG, TRACH NHIEM PHAP LY NGHIEM NGAT HAY NGOAI TE (BAO GOM
  * SO SUAT HAY CACH NAO) PHAT SINH TRONG BAT KY CACH NAO NGOAI VIEC SU DUNG NAY
  * PHAN MEM, NGAY CA KHI DUOC TU VAN VE KHA NANG THIET HAI DO.
 */

 #include <a_samp>
enum eFurniture {
	fhouseids,
	slotids,
	fModelss,
	Float:Fposx,
	Float:Fposy,
	Float:Fposz,
	Float:Fposxs,
	Float:Fposys,
	Float:Fposzs,
	texts0,
	texts1,
	texts2,
	texts3,
	texts4,
	cols0,
	cols1,
	cols2,
	cols3,
	cols4
}
enum epp{
 Float:ppx,
 Float:ppy,
 Float:ppz,
 Float:pprotz,
 ppvw,
 ppint
}
new arrFurnitures[100000][eFurniture];
new arrPayphone[1000000][epp];
enum furnitureEnum
{
	fCategory[24],
    fName[32],
    fModel,
    fPrice
};
#define SERVER_GM_TEXT "SA:RP v1.0.1"
#pragma warning disable 208, 217, 219
#pragma disablerecursion

#undef  MAX_PLAYERS
#define MAX_PLAYERS (500)
#include <a_mysql>  
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <sscanf2>
#include <crashdetect>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <mSelection>
#include <gvar>
#include <geo_ip>
#include <easyDialog>
#include <callbacks>
#include <attachments>

#if defined SOCKET_ENABLED
#include <socket>
#endif

#include "./includes/main/notice.pwn"
#include "./includes/main/progress.pwn"

#include "./includes/main/defines.pwn"
#include "./includes/main/enums.pwn"
#include "./includes/main/variables.pwn"
#include "./includes/main/wrappers.pwn"
#include "./includes/main/timers.pwn"
#include "./includes/main/functions.pwn"
#include "./includes/main/mysql.pwn"
#include "./includes/main/OnPlayerLoad.pwn" 
#include "./includes/main/callbacks.pwn"
#include "./includes/main/textdraws.pwn"
#include "./includes/main/streamer.pwn"
#include "./includes/main/OnDialogResponse.pwn"
#include "./includes/main/walkstyle.pwn"

#if defined AREA_DEBUG
#include "./includes/main/areadebug.pwn"
#endif

//streamer includes
#include "./includes/main/streamer/removebuildings.pwn"
#include "./includes/main/streamer/areas.pwn"
#include "./includes/main/streamer/buttons.pwn"
#include "./includes/main/streamer/objects.pwn"
#include "./includes/main/streamer/pickups.pwn"
#include "./includes/main/streamer/textlabels.pwn"
#include "./includes/main/streamer/vehicles.pwn"
#include "./includes/main/streamer/OnPlayerEditDynamicObject.pwn"

//admin includes
#include "./includes/main/admin/admin.pwn"
#include "./includes/main/admin/advisory.pwn"
#include "./includes/main/admin/auctionsystem.pwn"
#include "./includes/main/admin/bugreport.pwn"
#include "./includes/main/admin/flags.pwn"
#include "./includes/main/admin/gift.pwn"
#include "./includes/main/admin/reportsystem.pwn"
#include "./includes/main/admin/serveroffences.pwn"
#include "./includes/main/admin/vouchers.pwn"
#include "./includes/main/admin/watchdogs.pwn"
#include "./includes/main/admin/intlist.pwn"
#include "./includes/main/admin/anticheat.pwn"
#include "./includes/main/admin/spectate.pwn"
#include "./includes/main/admin/teleport.pwn"
#include "./includes/main/admin/watch.pwn"
#include "./includes/main/admin/newbie.pwn"
#include "./includes/main/admin/ban.pwn"
#include "./includes/main/admin/newstaffban.pwn"

//business includes
#include "./includes/main/business/247items.pwn"
#include "./includes/main/business/ammunation.pwn"
#include "./includes/main/business/businesscore.pwn"
#include "./includes/main/business/mailsystem.pwn"

//core includes
#include "./includes/main/core/acceptcancel.pwn"
#include "./includes/main/core/advertisements.pwn"
#include "./includes/main/core/banking.pwn"
#include "./includes/main/core/chat.pwn"
#include "./includes/main/core/fireworks.pwn"
#include "./includes/main/core/helpcmds.pwn"
#include "./includes/main/core/hospital.pwn"
#include "./includes/main/core/lotto.pwn"
#include "./includes/main/core/lselevator.pwn"
#include "./includes/main/core/marriage.pwn"
#include "./includes/main/core/namechange.pwn"
#include "./includes/main/core/phone.pwn"
#include "./includes/main/core/radio.pwn"
#include "./includes/main/core/service.pwn"
#include "./includes/main/core/storage.pwn"
#include "./includes/main/core/tutorial.pwn"
#include "./includes/main/core/upgrades.pwn"
#include "./includes/main/core/vactions.pwn"
#include "./includes/main/core/weapons.pwn"
#include "./includes/main/core/damage.pwn"
#include "./includes/main/core/health.pwn"
#include "./includes/main/core/teams.pwn"
#include "./includes/main/core/stats.pwn"
#include "./includes/main/core/timefuncs.pwn"
#include "./includes/main/core/camerafuncs.pwn"
#include "./includes/main/core/clearcheckpoint.pwn"
#include "./includes/main/core/maintenance.pwn"
#include "./includes/main/core/countrycheck.pwn"
#include "./includes/main/core/countdown.pwn"
#include "./includes/main/core/filehandle.pwn"
#include "./includes/main/core/initgamemode.pwn"
#include "./includes/main/core/login.pwn"
#include "./includes/main/core/miscload.pwn"
#include "./includes/main/core/proxdetector.pwn"
#include "./includes/main/core/setplayerspawn.pwn"
#include "./includes/main/core/stats.pwn"
#include "./includes/main/core/streamprep.pwn"
#include "./includes/main/core/emailcheck.pwn"
#include "./includes/main/core/AccountSettings.pwn"
#include "./includes/main/core/deluxegps.pwn"
#include "./includes/main/core/vending.pwn"

//dynamic core includes
#include "./includes/main/dynamic/doors.pwn"
#include "./includes/main/dynamic/garages.pwn"
#include "./includes/main/dynamic/gates.pwn"
#include "./includes/main/dynamic/houses.pwn"
#include "./includes/main/dynamic/mapicons.pwn"
#include "./includes/main/dynamic/motds.pwn"
#include "./includes/main/dynamic/paynsprays.pwn"
#include "./includes/main/dynamic/textlabels.pwn"
#include "./includes/main/dynamic/impound.pwn"
#include "./includes/main/dynamic/speedcamera.pwn"
#include "./includes/main/dynamic/arrestpoints.pwn"
#include "./includes/main/dynamic/dynsu.pwn"
#include "./includes/main/dynamic/housemarket.pwn"
#include "./includes/main/dynamic/ddsale.pwn"
#include "./includes/main/dynamic/parking.pwn"
#include "./includes/main/dynamic/MetalDetectors.pwn"
#include "./includes/main/dynamic/points.pwn"

//vehicle system includes
#include "./includes/main/vehsystem/vehiclecore.pwn"
#include "./includes/main/vehsystem/drivingtest.pwn"
#include "./includes/main/vehsystem/Server_DMV.pwn"
#include "./includes/main/vehsystem/speedo.pwn" 
#include "./includes/main/vehsystem/tow.pwn"
#include "./includes/main/vehsystem/VLP.pwn"
#include "./includes/main/vehsystem/helmet.pwn"
#include "./includes/main/vehsystem/groupvehs.pwn"
#include "./includes/main/vehsystem/playervehs.pwn"
#include "./includes/main/vehsystem/cratevehicles.pwn"

//event kernels includes
#include "./includes/main/events/event.pwn"
#include "./includes/main/events/eventpoints.pwn"
#include "./includes/main/events/fif.pwn"
#include "./includes/main/events/findtheflag.pwn"
#include "./includes/main/events/hungergames.pwn"
#include "./includes/main/events/paintball.pwn"
#include "./includes/main/events/rewardplay.pwn"
#include "./includes/main/events/rfl.pwn"
#include "./includes/main/events/xmas.pwn"
#include "./includes/main/events/zombies.pwn"
#include "./includes/main/events/valentine.pwn"


//dynamic group system includes
#include "./includes/main/group/citizenship.pwn"
//#include "./includes/main/group/contract.pwn"
#include "./includes/main/group/hitman.pwn"
//#include "./includes/main/group/fires.pwn"
#include "./includes/main/group/gov.pwn"
#include "./includes/main/group/groupcore.pwn"
#include "./includes/main/group/judicial.pwn"
#include "./includes/main/group/lea.pwn"
#include "./includes/main/group/medic.pwn"
#include "./includes/main/group/news.pwn"
#include "./includes/main/prison_system.pwn"
#include "./includes/main/group/racing.pwn"
#include "./includes/main/group/taxi.pwn"
#include "./includes/main/group/towing.pwn"
#include "./includes/main/group/turfs.pwn"
#include "./includes/main/group/cratesystem.pwn"
#include "./includes/main/group/callsystem.pwn"
#include "./includes/main/group/GovArms.pwn"
#include "./includes/main/group/grouppay.pwn"
#include "./includes/main/group/gangtags.pwn"
#include "./includes/main/group/GunLicense.pwn"
#include "./includes/main/group/sanews.pwn"
#include "./includes/main/group/casefile.pwn"
#include "./includes/main/group/groupweapons.pwn"


#include "./includes/main/jobs/Controler/var.pwn"
#include "./includes/main/jobs/Controler/textdraw.pwn"
#include "./includes/main/jobs/Controler/func.pwn"
#include "./includes/main/jobs/Controler/callback.pwn"
#include "./includes/main/jobs/Controler/main.pwn"


//perk system includes
#include "./includes/main/perks/boombox.pwn"
#include "./includes/main/perks/backpack.pwn"
#include "./includes/main/perks/dedicated.pwn"
#include "./includes/main/perks/famed.pwn"
#include "./includes/main/perks/poker.pwn"
#include "./includes/main/perks/shopcore.pwn"
#include "./includes/main/perks/tokens.pwn"
#include "./includes/main/perks/toys.pwn"
#include "./includes/main/perks/vipcore.pwn"
#include "./includes/main/perks/casino.pwn"
#include "./includes/main/perks/horsey.pwn"

#include "./includes/main/core/phone_new.pwn"
#include "./includes/main/core/payphones.pwn"
#include "./includes/main/group/rivalry.pwn"

// WIP
#include "./includes/main/core/ATMs.pwn"
#include "./includes/main/core/Banks.pwn"
#include "./includes/main/core/entexit.pwn"
#include "./includes/main/vehsystem/vehauto.pwn"
#include "./includes/main/DBLog.pwn"
#include "./includes/main/core/Player_Interact.pwn"


// Jingles WIP
#include "./includes/main/core/minigame.pwn"
#include "./includes/main/furnituretextures.pwn"
#include "./includes/main/furniture.pwn"
#include "./includes/main/group/elections.pwn"
// Other
//#include "./includes/main/task.pwn"
//#include "./includes/main/voice.pwn"

//Mechanic
//#include "./includes/main/Thongtinsuachua.pwn"


main(){}

public OnGameModeInit()
{
	print("Preparing the gamemode, please wait...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
	print("Exiting the gamemode, please wait...");
    g_mysql_Exit();
	return 1;
}

AntiDeAMX()
{
    new a[][] = {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
}
