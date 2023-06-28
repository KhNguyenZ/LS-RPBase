#include <progress2>

new ListKey[4][] = {
	{KEY_CTRL_BACK},
	{KEY_NO},
	{KEY_YES},
	{KEY_FIRE}
};

new bool:ControllerOpening[MAX_PLAYERS];

enum Controler_E{
	c_key,
	c_id,
	c_result,
	c_error_count,
	c_time,
	c_success_count
}

new ControlerInfo[MAX_PLAYERS][Controler_E];

enum Progress_Enum{
	p_count,
	p_time_second,
	p_value
};
new ProgressTimeInfo[MAX_PLAYERS][Progress_Enum];

new PlayerText:Fix[MAX_PLAYERS][4];
new PlayerBar:ProgressbarFix[MAX_PLAYERS][1];
new PlayerText:ElectricMenu[MAX_PLAYERS][6];
new PlayerBar:ElectricProgress[MAX_PLAYERS][5];

#define  			func:%0(%1)  				stock %0(%1)

new ProgressTimerZ[MAX_PLAYERS];
new Controller_Timer[MAX_PLAYERS];