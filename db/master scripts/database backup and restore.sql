/*
	Generic command
mysqldump --opt -u [uname] -p[pass] [dbname] > [backupfile.sql]
*/

C:\>cd C:\wamp\www\com\kalpdham\db\backup

C:\wamp\www\com\kalpdham\db\backup>mysqldump -u db_admin -pkalpdham123 kalpdham > kalpdham_20151222.sql

/*
	Using windows task scheduler for scheduing this process
	
	I.	Make sure you logged on as an administrator or you have the same access as an administrator.
	II.	Start->Control Panel->System and Security->Administrative Tools->Task Scheduler
	III.Action->Create Basic Task->Type a name and Click Next
	IV.	Follow through the wizard.

	
	(ref: http://stackoverflow.com/questions/7195503/setting-up-a-cron-job-in-windows)
*/