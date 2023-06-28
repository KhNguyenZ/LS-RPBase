stock GetJobName(jobid)
{
	new Name[1280];
	switch(jobid)
	{
		case 1: Name="Tho Dien";
		default: Name="Khong co cong viec";
	}
	return Name;
}

stock SetPlayerJob(playerid, jobid)
{
	if(PlayerInfo[playerid][pJob] == 0) {
		PlayerInfo[playerid][pJob] = jobid;
		new job_string[1280];
		format(job_string, sizeof(job_string), "*** Ban da nhan cong viec %s vao slot cong viec 1", GetJobName(jobid));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, job_string);
	} else if(PlayerInfo[playerid][pJob2] == 0) {
		PlayerInfo[playerid][pJob2] = jobid;
		new job_string[1280];
		format(job_string, sizeof(job_string), "*** Ban da nhan cong viec %s vao slot cong viec 2", GetJobName(jobid));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, job_string);
	} else if(PlayerInfo[playerid][pJob3] == 0) {
		PlayerInfo[playerid][pJob3] = jobid;
		new job_string[1280];
		format(job_string, sizeof(job_string), "*** Ban da nhan cong viec %s vao slot cong viec 3", GetJobName(jobid));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, job_string);
	}
	return 1;
}
