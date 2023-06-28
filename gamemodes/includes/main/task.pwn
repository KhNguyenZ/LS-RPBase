#include <a_samp>
#include <a_mysql>
#include <YSI\y_hooks>

enum task_enum
{
    task_id,
    task_title[1280],
    task_amount,
    task_guide[1280]
}
new TaskInfo[MAX_PLAYERS][task_enum];

stock LoadTask(playerid,taskid)
{
    new 
    Cache:kncms_cache , kncms_format[1280];
    mysql_format(MainPipeline,kncms_format, sizeof(kncms_format), "SELECT * FROM `task` WHERE `id` = %d ", taskid);
    kncms_cache = mysql_query(MainPipeline, kncms_format);
    if(cache_num_rows()) {
        cache_get_value_name_int(0, "id", TaskInfo[playerid][task_id]);
        cache_get_value_name(0, "title", TaskInfo[playerid][task_title]);
        cache_get_value_name_int(0, "amount", TaskInfo[playerid][task_amount]);
        cache_get_value_name(0, "guide", TaskInfo[playerid][task_guide]);
        printf("Task ID %d Has Loaded By %s", taskid, GetPlayerNameEx(playerid));
    }
    cache_delete(kncms_cache);
}


CMD:nhiemvu(playerid, params[])
{
    ShowPlayerDialog(playerid,1005,DIALOG_STYLE_LIST, "Quan Li Nhiem Vu", "Xem Nhiem Vu \nHuong Dan Nhiem Vu", ">>", "<<");
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1005)
    {
        switch(listitem)
        {
            case 0: {
                new task_str[1280];
                if(TaskInfo[playerid][task_id] != -1)
                {
                    format(task_str, sizeof(task_str), 
                    "Nhiem Vu \tSo Luong\n\
                    {7fff00}%s{FFFFFF}\t{ee7621}%d/%d{FFFFFF}",TaskInfo[playerid][task_title],PlayerInfo[playerid][pTaskAmount], TaskInfo[playerid][task_amount]);
                }
                else format(task_str, sizeof(task_str), "Dang cap nhat");
                ShowPlayerDialog(playerid, 1006, DIALOG_STYLE_TABLIST_HEADERS, "Xem Nhiem Vu", task_str, "Thoat", "");
            }
            case 1:{
                ShowPlayerDialog(playerid, 1007, DIALOG_STYLE_MSGBOX, "Huong Dan Nhiem Vu",TaskInfo[playerid][task_guide], "Thoat", "");
            }
        }
    }
    return 1;
}
stock UpdateTask(playerid)
{
    if(PlayerInfo[playerid][pTaskAmount] == TaskInfo[playerid][task_amount])
    {
        switch(PlayerInfo[playerid][pTaskID])
        {
            case 0:{
                PlayerInfo[playerid][pCash] += 1000;
                SendClientMessage(playerid,COLOR_GREEN, "** Ban da hoan thanh nhiem vu so 1 **");
            }
            case 1:{
                PlayerInfo[playerid][pCash] += 1000;
                SendClientMessage(playerid,COLOR_GREEN, "** Ban da hoan thanh nhiem vu so 2 **");
            }
        }
        PlayerInfo[playerid][pTaskID] ++;
        PlayerInfo[playerid][pTaskAmount] = 0;
        LoadTask(playerid, PlayerInfo[playerid][pTaskID]);
    }
    else{
        PlayerInfo[playerid][pTaskAmount]++;        
    }
}
CMD:tasku(playerid, params[])
{
    UpdateTask(playerid);
    return 1;
}