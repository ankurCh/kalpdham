mysql> create database kalpdham;

mysql> grant all on kalpdham.* to 'db_admin'@localhost identified by 'kalpdham123';

mysql> exit

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

C:\>cd C:\wamp\bin\mysql\mysql5.6.17\bin

C:\wamp\bin\mysql\mysql5.6.17\bin>mysql -u db_admin -pkalpdham123

mysql> show databases;

mysql> use kalpdham;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

mysql -u social_db -pkalpdham123