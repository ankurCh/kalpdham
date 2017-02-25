SET BACKUP_LOCATION=C:\wamp\www\com\kalpdham\db\backup

cd %BACKUP_LOCATION%

mysqldump -u db_admin -pkalpdham123 kalpdham > kalpdham_scheduled_backup_%date%.sql