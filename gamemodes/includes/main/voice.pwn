#include <sampvoice>
#include <YSI\y_hooks>

new SV_GSTREAM:gstream = SV_NULL;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    if (keyid == 0x5A && gstream) SvAttachSpeakerToStream(gstream, playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    if (keyid == 0x5A && gstream) SvDetachSpeakerFromStream(gstream, playerid);
}

hook OnPlayerConnect(playerid)
{
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "Khong the tim thay plugin sampvoice.");
    }
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "Khong the tim thay micro.");
    }
    else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        SendClientMessage(playerid, -1, "Nhan Z de noi chuyen voi tro chuyen toan cau va B de noi chuyen voi tro chuyen cuc bo.");

        if (gstream) SvAttachListenerToStream(gstream, playerid);

        SvAddKey(playerid, 0x42);
        SvAddKey(playerid, 0x5A);
    }
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
}

hook OnGameModeInit()
{
    gstream = SvCreateGStream(0xffff0000, "Voice");
}

hook OnGameModeExit()
{
    if (gstream) SvDeleteStream(gstream);
}