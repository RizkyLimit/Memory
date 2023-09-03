// generated by "sampctl package init"
#include <a_samp>
#include <a_mysql>
#include <discord-connector>
new MySQL:Database;

main() 
{
	// write code here and run "sampctl package build" to compile
	// then run "sampctl package run" to run it	
	new MySQLOpt:options = mysql_init_options();

	mysql_log(ALL);
    Database = mysql_connect_file();
    if(mysql_errno(Database) == 0)
	{
		printf("[MySQL] Connected to the database successfully (%d).",_:Database);
		mysql_set_charset("utf8mb4",Database);
		mysql_set_option(options,POOL_SIZE,2);
    }
	else
	{
		printf("[MySQL] Couldn't connect to the database (%d).",mysql_errno(Database));
        SendRconCommand("exit");
	}
	return 1;
}
public OnPlayerConnect(playerid)
{
	mysql_query(Database,"SELECT * FROM `mock_data` WHERE `gender`='male';",true);
	SendClientMessage(playerid,-1,"Selamat Datang");
	for(new i; i != 50; i++)
		mysql_query(Database,"SELECT * FROM `mock_data` WHERE `gender`='male';",true);
	return 1;
}
