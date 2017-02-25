mysql> create database kalpdham;
Query OK, 1 row affected (0.07 sec)

mysql> grant all on kalpdham.* to 'db_admin'@localhost identified by 'kalpdham123';
Query OK, 0 rows affected (0.05 sec)

mysql> exit
Bye

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

C:\Users\ankur>d:

D:\>cd D:\wamp\bin\mysql\mysql5.1.53\bin
The system cannot find the path specified.

D:\>cd wamp
The system cannot find the path specified.

D:\>c:

C:\Users\ankur>cd c:
C:\Users\ankur

C:\Users\ankur>cd ../..

C:\>cd wamp

C:\wamp>cd bin\mysql\

C:\wamp\bin\mysql>cd mysql5.6.17

C:\wamp\bin\mysql\mysql5.6.17>cd bin

C:\wamp\bin\mysql\mysql5.6.17\bin>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.6.17 MySQL Community Server (GPL)

Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input stateme

mysql> exit
Bye

C:\wamp\bin\mysql\mysql5.6.17\bin>mysql -u db_admin -pkalpdham123
Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.6.17 MySQL Community Server (GPL)

Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input stateme

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| kalpdham           |
| test               |
+--------------------+
3 rows in set (0.00 sec)

mysql> use kalpdham;
Database changed
mysql>


------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------


/*
	Table structure for kalpdham projects.
*/
CREATE TABLE IF NOT EXISTS kalp_projects (
	id 					INT UNSIGNED NOT NULL AUTO_INCREMENT,
	project_name		VARCHAR(100) NOT NULL,
	project_url			VARCHAR(1000),
	project_type		VARCHAR(100),
	CONSTRAINT pk_kalp_projects	PRIMARY KEY (id)
)
	ENGINE = InnoDB
;

/*
	Table structure for real estate project units.
	Unit means individual houses or plots. One unit can be a combintion of more than one plot.
	
	Broadly speaking one unit means one property deal with one or many customers.
	
	plot_numbers:- If unit has only one plot then plot_number will be same as defined in T&CP approved map. If unit has more than one plot then plot_number will be comma seperated values of all T&CP approved plot numbers involving in that deal.
	
	unit_dimension_imperial :- lenght and width of plot or group of plots which will constitute one unit. For exaple 22'8"x60'8". Unit used will be imperial i.e. foot and inches.
*/

CREATE TABLE IF NOT EXISTS kalp_project_units (
	id 							INT UNSIGNED NOT NULL AUTO_INCREMENT,
	project_id 					INT UNSIGNED NOT NULL,
	plot_numbers				VARCHAR(100) NOT NULL,
	unit_dimension_imperial		VARCHAR(100) NOT NULL,
	unit_area_imperial			INT UNSIGNED NOT NULL,
	unit_type					VARCHAR(100) CHECK (unit_type in ('PLOT','SINGLEX','DUPLEX','MULTI-STORY')),
	north_direction_desc		VARCHAR(100),
	south_direction_desc		VARCHAR(100),
	east_direction_desc			VARCHAR(100),
	west_direction_desc			VARCHAR(100),
	CONSTRAINT pk_kalp_project_units	PRIMARY KEY (id),
	CONSTRAINT kalp_project_units_fk1 FOREIGN KEY (project_id) REFERENCES kalp_projects(id)
)
	ENGINE = InnoDB
;

/*
	Table structure for kalpdham sub projects.
	Right now project and sub projects and not linked. This is because we not using AJAX or some other real time data retrival techniques. Ideal scenario would be user selects a project and we will display sub projects that are relevant to that selected project only, no other sub project will be displayed.
	Right now we are not doing this. Also as we dont have many projects and sub projects right now, so it is not a big issue.
*/
CREATE TABLE IF NOT EXISTS kalp_subprojects (
	id 					INT UNSIGNED NOT NULL AUTO_INCREMENT,
	subproject_name		VARCHAR(100) NOT NULL,
	subproject_desc		VARCHAR(4000),
	CONSTRAINT pk_kalp_subprojects	PRIMARY KEY (id)
)
	ENGINE = InnoDB
;

/*
	Alter table
*/
ALTER TABLE kalp_subprojects ADD COLUMN color_name VARCHAR(100);
ALTER TABLE kalp_subprojects ADD COLUMN color_code VARCHAR(100);


/*
	kalp_subprojects_mapping
	
	this will provide mapping b/w projects and subprojects.
*/
CREATE TABLE IF NOT EXISTS kalp_subprojects_mapping (
	project_id			INT UNSIGNED NOT NULL,
	subproject_id		INT UNSIGNED NOT NULL,
	CONSTRAINT pk_kalp_subprojects_mapping	PRIMARY KEY (project_id, subproject_id),
	CONSTRAINT kalp_subprojects_mapping_fk1 FOREIGN KEY (project_id) REFERENCES kalp_projects(id),
	CONSTRAINT kalp_subprojects_mapping_fk2 FOREIGN KEY (subproject_id) REFERENCES kalp_subprojects(id)
)
	ENGINE = InnoDB
;

/*
	alter table to add comments column.
*/
ALTER TABLE kalp_subprojects_mapping ADD COLUMN remark VARCHAR(4000);



/*
	Table structure for kalpdham expense categories.
	Categories can be broad head of expenses like labour payment, govt approvals etc.
	
	There will be another linked table for sub categories.
	Sub categories are finer categorization of expenses like different type of labours etc.
*/
CREATE TABLE IF NOT EXISTS kalp_exp_category (
	id 					INT UNSIGNED NOT NULL AUTO_INCREMENT,
	category_name		VARCHAR(1000) NOT NULL,
	category_desc		VARCHAR(4000),
	CONSTRAINT pk_kalp_exp_category	PRIMARY KEY (id)
)
	ENGINE = InnoDB
;

/*
	Alter table -- add color.
*/
ALTER TABLE kalp_exp_category ADD COLUMN color_name VARCHAR(100);
ALTER TABLE kalp_exp_category ADD COLUMN color_code VARCHAR(100);

UPDATE kalp_exp_category
SET color_name = 'red', color_code = '#ff0000'
WHERE id = 1;

UPDATE kalp_exp_category
SET color_name = 'green', color_code = '#00ff00'
WHERE id = 2;

UPDATE kalp_exp_category
SET color_name = 'blue', color_code = '#0000ff'
WHERE id = 7;

UPDATE kalp_exp_category
SET color_code = '#ffff00'
WHERE id = 3;

UPDATE kalp_exp_category
SET color_code = '#ff00ff'
WHERE id = 4;

UPDATE kalp_exp_category
SET color_code = '#fff44f'
WHERE id = 5;

UPDATE kalp_exp_category
SET color_code = '#00ffff'
WHERE id = 6;

UPDATE kalp_exp_category
SET color_code = '#7700ff'
WHERE id = 8;

UPDATE kalp_exp_category
SET color_code = '#ff77ff'
WHERE id = 9;

UPDATE kalp_exp_category
SET color_code = '#0068ff'
WHERE id = 10;


UPDATE kalp_exp_category
SET color_code = '#d6d6c2'
WHERE id = 11;
/*
	Table structure for kalpdham expense sub categories.
*/
CREATE TABLE IF NOT EXISTS kalp_exp_subcategory (
	id 					INT UNSIGNED NOT NULL AUTO_INCREMENT,
	category_id			INT UNSIGNED NOT NULL,
	subcategory_name	VARCHAR(1000) NOT NULL,
	subcategory_desc	VARCHAR(4000),
	CONSTRAINT pk_kalp_exp_category	PRIMARY KEY (id),
	CONSTRAINT kalp_exp_subcategory_fk1 FOREIGN KEY (category_id) REFERENCES kalp_exp_category(id)
)
	ENGINE = InnoDB
;

/*
	Alter table -- add color.
*/
ALTER TABLE kalp_exp_subcategory ADD COLUMN color_name VARCHAR(100);
ALTER TABLE kalp_exp_subcategory ADD COLUMN color_code VARCHAR(100);

/*
	master table to list all beneficiary.
*/
CREATE TABLE IF NOT EXISTS kalp_exp_beneficiary (
	id 					INT UNSIGNED NOT NULL AUTO_INCREMENT,
	beneficiary_name	VARCHAR(1000) NOT NULL,
	beneficiary_desc	VARCHAR(4000),
	beneficiary_type	VARCHAR(100),
	CONSTRAINT pk_kalp_exp_beneficiary	PRIMARY KEY (id)
)
	ENGINE = InnoDB
;

/*
	mapping table b/w a beneficiary and a subcategory.
*/
CREATE TABLE IF NOT EXISTS kalp_exp_benef_subcat_map (
	id								INT UNSIGNED NOT NULL AUTO_INCREMENT,
	beneficiary_id 					INT UNSIGNED NOT NULL,
	subcategory_id 					INT UNSIGNED NOT NULL,
	CONSTRAINT pk_kalp_exp_beneficiary	PRIMARY KEY (id),
	CONSTRAINT uq_kalp_exp_beneficiary	UNIQUE (beneficiary_id,subcategory_id),
	CONSTRAINT kalp_exp_benef_subcat_map_fk1 FOREIGN KEY (beneficiary_id) REFERENCES kalp_exp_beneficiary(id),
	CONSTRAINT kalp_exp_benef_subcat_map_fk2 FOREIGN KEY (subcategory_id) REFERENCES kalp_exp_subcategory(id)
)
	ENGINE = InnoDB
;

--sample query
SELECT kalp_exp_beneficiary.id AS beneficiary_id, kalp_exp_beneficiary.beneficiary_name, kalp_exp_beneficiary.beneficiary_desc, kalp_exp_beneficiary.beneficiary_type, kalp_exp_category.category_name,   kalp_exp_subcategory.subcategory_name
FROM kalp_exp_beneficiary
	INNER JOIN kalp_exp_benef_subcat_map
		ON kalp_exp_beneficiary.id = kalp_exp_benef_subcat_map.beneficiary_id
	INNER JOIN kalp_exp_subcategory
		ON kalp_exp_subcategory.id = kalp_exp_benef_subcat_map.subcategory_id
	INNER JOIN 	kalp_exp_category
		ON kalp_exp_category.id = kalp_exp_subcategory.category_id;

/*
	Not in use rt now.
	Not created into DB.
*/
CREATE TABLE IF NOT EXISTS kalp_exp_subcategory_unit_map (
	id 						INT UNSIGNED NOT NULL AUTO_INCREMENT,
	subcategory_id			INT UNSIGNED NOT NULL,
	unit_name				VARCHAR(1000) NOT NULL,
	unit_desc				VARCHAR(4000),
	CONSTRAINT pk_kalp_exp_subcategory_unit_map	PRIMARY KEY (id),
	CONSTRAINT kalp_exp_subcategory_unit_map_fk1 FOREIGN KEY (subcategory_id) REFERENCES kalp_exp_subcategory(id)
)
	ENGINE = InnoDB
;

INSERT INTO kalp_exp_category(category_name)
VALUES ('labour - internal');
	
	INSERT INTO kalp_exp_subcategory(category_id, subcategory_name)
	SELECT  LAST_INSERT_ID(), 'only labours'
	UNION 
	SELECT  LAST_INSERT_ID(), 'only mistri'
	UNION 
	SELECT  LAST_INSERT_ID(), 'labour and mistri'
	UNION 
	SELECT  LAST_INSERT_ID(), 'field supervisor'
	UNION 
	SELECT  LAST_INSERT_ID(), 'security guard'
	UNION 
	SELECT  LAST_INSERT_ID(), 'office employee'
	UNION 
	SELECT  LAST_INSERT_ID(), 'firm partners';


INSERT INTO kalp_exp_category(category_name)
VALUES ('labour - contractors');
	
	INSERT INTO kalp_exp_subcategory(category_id, subcategory_name)
	SELECT  LAST_INSERT_ID(), 'fundation'
	UNION 
	SELECT  LAST_INSERT_ID(), 'structure'
	UNION 
	SELECT  LAST_INSERT_ID(), 'plaster'
	UNION 
	SELECT  LAST_INSERT_ID(), 'electricity'
	UNION 
	SELECT  LAST_INSERT_ID(), 'plumbing'
	UNION 
	SELECT  LAST_INSERT_ID(), 'senting'
	UNION 
	SELECT  LAST_INSERT_ID(), 'loha bandhai'
	UNION 
	SELECT  LAST_INSERT_ID(), 'slab dhalai'
	UNION 
	SELECT  LAST_INSERT_ID(), 'putty paints'
	UNION 
	SELECT  LAST_INSERT_ID(), 'tiles stone work';

INSERT INTO kalp_exp_category(category_name)
VALUES ('others');
	
	INSERT INTO kalp_exp_subcategory(category_id, subcategory_name)
	SELECT  LAST_INSERT_ID(), 'others';

/*
	Tables to keep usage stats of different categories.
	
*/	
CREATE TABLE IF NOT EXISTS kalp_exp_category_stats (
	category_id 		INT UNSIGNED NOT NULL,
	category_name		VARCHAR(1000) NOT NULL,
	category_usage		BIGINT UNSIGNED,
	last_use_date		DATETIME,
	CONSTRAINT pk_kalp_exp_category_stats	PRIMARY KEY (category_id),
	CONSTRAINT kalp_exp_category_stats_fk1 FOREIGN KEY (category_id) REFERENCES kalp_exp_category(id)
)
	ENGINE = InnoDB
;
	/*Some sample DML*/
	INSERT INTO kalp_exp_category_stats (category_id,category_name,category_usage)
	SELECT id, category_name, 0
	FROM kalp_exp_category;
	
	UPDATE kalp_exp_category_stats
	SET category_usage = category_usage + 1,
		last_use_date = CURDATE()
	WHERE category_id = 3;
	
	--display category information.
	SELECT category_id, category_name, category_usage, last_use_date
	FROM kalp_exp_category_stats
	ORDER BY category_usage DESC;

CREATE TABLE IF NOT EXISTS kalp_exp_subcategory_stats (
	subcategory_id 		INT UNSIGNED NOT NULL,
	category_id			INT UNSIGNED NOT NULL,
	subcategory_name	VARCHAR(1000) NOT NULL,
	subcategory_usage	BIGINT UNSIGNED,
	last_use_date		DATETIME,
	CONSTRAINT pk_kalp_exp_subcategory_stats PRIMARY KEY (subcategory_id),
	CONSTRAINT kalp_exp_subcategory_stats_fk1 FOREIGN KEY (category_id) REFERENCES kalp_exp_category(id),
	CONSTRAINT kalp_exp_subcategory_stats_fk2 FOREIGN KEY (subcategory_id) REFERENCES kalp_exp_subcategory(id)
)
	ENGINE = InnoDB
;
	
	--display sub category information.
	SELECT subcategory_id, category_name, subcategory_name, subcategory_usage, last_use_date
	FROM kalp_exp_subcategory_stats
		INNER JOIN kalp_exp_category 
			ON kalp_exp_subcategory_stats.category_id = kalp_exp_category.id
	ORDER BY category_name, subcategory_usage DESC;


	/*Some sample DML*/
	INSERT INTO kalp_exp_subcategory_stats (subcategory_id, category_id,subcategory_name,subcategory_usage)
	SELECT id, category_id, subcategory_name, 0
	FROM kalp_exp_subcategory;
	
	UPDATE kalp_exp_subcategory_stats
	SET subcategory_usage = subcategory_usage + 1,
		last_use_date = CURDATE()
	WHERE subcategory_id = 23;
	
	--Query to get sub categories in the order of their usage.
	SELECT kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name , kalp_exp_subcategory.id, kalp_exp_subcategory_stats.subcategory_usage
	FROM kalp_exp_category
		INNER JOIN kalp_exp_subcategory
			ON kalp_exp_category.id = kalp_exp_subcategory.category_id
		INNER JOIN kalp_exp_subcategory_stats
			ON kalp_exp_subcategory.id = kalp_exp_subcategory_stats.subcategory_id
			AND kalp_exp_category.id = kalp_exp_subcategory_stats.category_id
	ORDER BY kalp_exp_subcategory_stats.subcategory_usage DESC;		

/*
	Table structure for kalpdham project wise expenses.
	This is a master table and will have references on various parent tables.
	
	Right now category_id is not relevant.
*/
CREATE TABLE IF NOT EXISTS kalp_project_exp_details (
	id 					BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	when_created		DATETIME,
	project_id			INT UNSIGNED NOT NULL,
	subproject_id		INT UNSIGNED NOT NULL,
	expense_date		DATETIME,
	--category_id			INT UNSIGNED NOT NULL,
	subcategory_id		INT UNSIGNED NOT NULL,
	amount				BIGINT UNSIGNED,
	remark				VARCHAR(4000),
	per_unit_cost		INT,
	CONSTRAINT pk_kalp_project_exp_details	PRIMARY KEY (id),
	CONSTRAINT kalp_project_exp_details_fk1 FOREIGN KEY (project_id) REFERENCES kalp_projects(id),
	CONSTRAINT kalp_project_exp_details_fk2 FOREIGN KEY (subproject_id) REFERENCES kalp_subprojects(id),
	--CONSTRAINT kalp_project_exp_details_fk3 FOREIGN KEY (category_id) REFERENCES kalp_exp_category(id),
	CONSTRAINT kalp_project_exp_details_fk4 FOREIGN KEY (subcategory_id) REFERENCES kalp_exp_subcategory(id)
)
	ENGINE = InnoDB
;

ALTER TABLE kalp_project_exp_details ADD COLUMN beneficiary_id INT UNSIGNED;
ALTER TABLE kalp_project_exp_details ADD CONSTRAINT kalp_project_exp_details_fk5 FOREIGN KEY (beneficiary_id) REFERENCES kalp_exp_beneficiary(id);

--Sample queries on expenses.
--Detailed expense report.
SELECT *
FROM kalp_project_exp_details 
	INNER JOIN kalp_projects 
		ON kalp_projects.id = kalp_project_exp_details.project_id
WHERE kalp_projects.project_name = 'Desai Residency';

SELECT kalp_project_exp_details.expense_date, kalp_subprojects.subproject_name, kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name, kalp_project_exp_details.amount, kalp_project_exp_details.remark
FROM kalp_project_exp_details 
		INNER JOIN kalp_subprojects
			ON kalp_project_exp_details.subproject_id = kalp_subprojects.id
		INNER JOIN kalp_exp_category
			ON kalp_project_exp_details.category_id = kalp_exp_category.id
		INNER JOIN kalp_exp_subcategory
			ON kalp_project_exp_details.subcategory_id = kalp_exp_subcategory.id	
			AND kalp_project_exp_details.category_id = kalp_exp_subcategory.category_id
WHERE kalp_project_exp_details.project_id = 2
ORDER BY expense_date;

--Subproject wise expense distribution.
SELECT kalp_subprojects.subproject_name, SUM( kalp_project_exp_details.amount)
FROM kalp_project_exp_details 
		INNER JOIN kalp_subprojects
			ON kalp_project_exp_details.subproject_id = kalp_subprojects.id
WHERE kalp_project_exp_details.project_id = 2
GROUP BY kalp_subprojects.subproject_name
ORDER BY kalp_subprojects.subproject_name;

--Total expense.
SELECT SUM( kalp_project_exp_details.amount)
FROM kalp_project_exp_details 
WHERE kalp_project_exp_details.project_id = 2;


--Category wise expense.
SELECT kalp_exp_category.category_name, SUM(kalp_project_exp_details.amount)
FROM kalp_project_exp_details 
		INNER JOIN kalp_exp_category
			ON kalp_project_exp_details.category_id = kalp_exp_category.id
WHERE kalp_project_exp_details.project_id = 2
GROUP BY kalp_exp_category.category_name
ORDER BY 2 DESC;

--subcategory wise expense.
SELECT kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name, SUM(kalp_project_exp_details.amount)
FROM kalp_project_exp_details 
		INNER JOIN kalp_exp_category
			ON kalp_project_exp_details.category_id = kalp_exp_category.id
		INNER JOIN kalp_exp_subcategory
			ON kalp_project_exp_details.subcategory_id = kalp_exp_subcategory.id	
			AND kalp_project_exp_details.category_id = kalp_exp_subcategory.category_id
WHERE kalp_project_exp_details.project_id = 2
GROUP BY kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name
ORDER BY 1,2 DESC;

-----------------------------------------------------------
--category details.
SELECT kalp_exp_category.id, kalp_exp_category.category_name, kalp_exp_category.category_desc, kalp_exp_category_stats.category_usage, kalp_exp_category_stats.last_use_date
FROM kalp_exp_category
	INNER JOIN kalp_exp_category_stats
		ON kalp_exp_category.id = kalp_exp_category_stats.category_id
WHERE kalp_exp_category.id = 2;		


-------------------------------------------------------------------------------
-----------------------------Knowledge solution--------------------------------

/*
	This table will keep master records of all file and folders.
	Folders will be treated as files.
	
*/
CREATE TABLE IF NOT EXISTS kalp_kb_file (
	id 					BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	parent_id			BIGINT UNSIGNED,
	file_name			VARCHAR(1000) NOT NULL,
	when_created		DATETIME,
	is_folder			TINYINT,
	content_type		VARCHAR(1000),
	CONSTRAINT pk_kalp_kb_file PRIMARY KEY (id),
	CONSTRAINT kalp_kb_file_fk1 FOREIGN KEY (parent_id) REFERENCES kalp_kb_file(id),
	CONSTRAINT kalp_kb_file_chk1 CHECK (is_folder in (0,1)),
	CONSTRAINT kalp_kb_file_chk2 CHECK (content_type in ('LINK','TEXT','IMAGE','PDF','WORD'))
)
	ENGINE = InnoDB
;

/*
	Table to save file details, attributes, parameters etc.
	Not in use right now.
*/
CREATE TABLE IF NOT EXISTS kalp_kb_file_details (

)
	ENGINE = InnoDB
;

/*
	This table is not necessary but will improve performace and reduce complexity but can be hard to maintain in a big database/ knowledge base.
	This table will have child ref. of each file/folder.
	
	here file_id will always be a folder (kalp_kb_file.is_folder = 1)
*/
CREATE TABLE IF NOT EXISTS kalp_kb_file_child (
	file_id 			BIGINT UNSIGNED ,
	child_id			BIGINT UNSIGNED,
	CONSTRAINT pk_kalp_kb_file_child PRIMARY KEY (file_id,child_id),
	CONSTRAINT kalp_kb_file_child_fk1 FOREIGN KEY (file_id) REFERENCES kalp_kb_file(id),
	CONSTRAINT kalp_kb_file_child_fk2 FOREIGN KEY (child_id) REFERENCES kalp_kb_file(id)
)
	ENGINE = InnoDB
;

/*
	this table will list all the related files of a given file. For example if one file is regarding T&CP act then its linked files will be related to all the amandments in that act.
	
	here file_id will always be a file (kalp_kb_file.is_folder = 0)
*/
CREATE TABLE IF NOT EXISTS kalp_kb_linked_files (
	file_id 			BIGINT UNSIGNED ,
	linked_file_id		BIGINT UNSIGNED,
	CONSTRAINT pk_kalp_kb_linked_files PRIMARY KEY (file_id,linked_file_id),
	CONSTRAINT kalp_kb_linked_files_fk1 FOREIGN KEY (file_id) REFERENCES kalp_kb_file(id),
	CONSTRAINT kalp_kb_linked_files_fk2 FOREIGN KEY (linked_file_id) REFERENCES kalp_kb_file(id)
)
	ENGINE = InnoDB
;


/*
	This table will hold the data of file.
	This should have versioning (but not now).
	We should create text indexes on content, content_desc, content_keywords columns
	here file_id will always be a file (kalp_kb_file.is_folder = 0)
*/
CREATE TABLE IF NOT EXISTS kalp_kb_file_content (
	file_id 			BIGINT UNSIGNED ,
	content_desc		TEXT,
	content_blob		BLOB,
	content_text		TEXT,
	content_keywords	TEXT,
	CONSTRAINT pk_kalp_kb_file_content PRIMARY KEY (file_id),
	CONSTRAINT kalp_kb_file_content_fk1 FOREIGN KEY (file_id) REFERENCES kalp_kb_file(id)
)
	ENGINE = InnoDB
;


/*Create root folder.*/

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (null,'kalp kb',NOW(),1,'LINK');

/*Create child of root folder.*/

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (1,'personal',NOW(),1,'LINK');
	
	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (1,LAST_INSERT_ID());
	
INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (1,'business',NOW(),1,'LINK');

	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (1,LAST_INSERT_ID());
	
INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (1,'common',NOW(),1,'LINK');

	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (1,LAST_INSERT_ID());

SELECT * FROM kalp_kb_file;

SELECT * FROM kalp_kb_file_child;


/*Create child of personal folder.*/

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (2,'ankur',NOW(),1,'LINK');
	
	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (2,LAST_INSERT_ID());

/*Create child of ankur folder.*/

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (5,'education',NOW(),1,'LINK');
	
	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (5,LAST_INSERT_ID());

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (5,'finance',NOW(),1,'LINK');
	
	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (5,LAST_INSERT_ID());

INSERT INTO kalp_kb_file (parent_id, file_name, when_created, is_folder, content_type)
VALUES (5,'health',NOW(),1,'LINK');
	
	INSERT INTO kalp_kb_file_child(file_id, child_id)
	VALUES (5,LAST_INSERT_ID());



/**************************************************************************************************
	Cost and Material Estimation Module.
**************************************************************************************************/
/*
	kalp_cost_config_concrete_mix
	
	This is configuration table for various type of concrete mix.
	Configurations are with respect to strength, weight, volume of concrete ingredients.
	
	Remember:-
	1 Bag of cement = 50 Kg = 0.2 cubic metre'
	Volume is in cubic meter and mass is in Kg.
	
	kg_mass_per_bag = kilogram mass per bag
	cum_vol_per_bag = cubic metre volume per bag
	kg_mass_per_cum = kilogram mass per cubic metre
	cum_vol_per_cum = cubic metre volume per cubic metre
	
*/
CREATE TABLE IF NOT EXISTS kalp_cost_config_concrete_mix (
	id 										BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	concrete_strength_28day_MPA				VARCHAR(4) NOT NULL,
	unit_mass_vol							VARCHAR(100) NOT NULL,
	halfstone_cement						DECIMAL(10,4),
	halfstone_sand							DECIMAL(10,4),
	halfstone_stone							DECIMAL(10,4),
	threeforthstone_cement					DECIMAL(10,4),
	threeforthstone_sand					DECIMAL(10,4),
	threeforthstone_stone					DECIMAL(10,4),
	remark									VARCHAR(1000),
	CONSTRAINT pk_kalp_cost_config_concr_mix 	PRIMARY KEY (id)
)
	ENGINE = InnoDB
;

INSERT INTO kalp_cost_config_concrete_mix (concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone)
VALUES (10, 'kg_mass_per_bag', 50, 238, 128, 50, 230, 196);


INSERT INTO kalp_cost_config_concrete_mix (concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone)
VALUES (10, 'cum_vol_per_bag', 0.2, 0.175, 0.095, 0.2, 0.170, 0.145);

INSERT INTO kalp_cost_config_concrete_mix (concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone)
VALUES (10, 'kg_mass_per_cum', 250, 1190, 640, 225, 1030, 890);

INSERT INTO kalp_cost_config_concrete_mix (concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone)
VALUES (10, 'cum_vol_per_cum', 1, 0.88, 0.47, 0.9, 0.76, 0.66);



/*
	kalp_cost_config_cc_material
	
	This table will hold cost related values/information of concrete (cc) ingredients like sand, stone, cement.
	material_name				=> a discriptive name of material which can also provide some value added info.
	material_category			=> like sand, cement etc.
	material_type				=> type of material. Like for cement type of cement i.e. gold or others.
	material_subtype			=> Extra parameters which can affect cost of material like trade or non trade etc.
	material_brand				=> for cement it can be like ACC, KJS etc.
	material_quality				
	material_unit				=> Units can be treditional units like bag, dumphar etc. or scientific units like cubic metre etc.
	material_unit_cost				
	material_id					=> this ID will be same for same type of material. same in the sence of name, type, subtype and quality. Only unit will be different. This can be used to interconvert material unit cost. for example in case of cement unit cost of 1 bag with respect to 1 cubic metre of cement.
	
	##NOTE## 
		This table is not final and will need lot or rework. We need proper planning for this. As of now it is just a placeholder.
		material_unit can be drived from another master table.
		material_category can also be FK.
*/
CREATE TABLE IF NOT EXISTS kalp_cost_config_cc_material (
	id 										BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	material_id								BIGINT UNSIGNED NOT NULL,
	material_name							VARCHAR(100) NOT NULL,
	material_category						VARCHAR(100) NOT NULL,
	material_type							VARCHAR(100),
	material_subtype						VARCHAR(100),
	material_brand							VARCHAR(100),
	material_quality						VARCHAR(100),
	material_unit							VARCHAR(100) NOT NULL,
	material_unit_cost						DECIMAL(10,4),
	start_date								DATETIME,
	end_date								DATETIME,
	is_current								TINYINT,
	remark									VARCHAR(1000),
	CONSTRAINT pk_cost_config_cc_material 	PRIMARY KEY (id),
	CONSTRAINT cost_config_cc_material_chk1 CHECK (is_current in (0,1))
)
	ENGINE = InnoDB
;

/* insert value for cement. remember here 1 beg = 50 kg = 0.2 cum (cubic metre)*/
INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (1, 'ACC_CEMENT_TRADE_NORMAL', 'cement', 'normal', 'trade', 'acc', 'normal', '1 bag', 310, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (1, 'ACC_CEMENT_TRADE_NORMAL', 'cement', 'normal', 'trade', 'acc', 'normal', '1 kg', 6.2, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (1, 'ACC_CEMENT_TRADE_NORMAL', 'cement', 'normal', 'trade', 'acc', 'normal', '1 cum', 1550, CURDATE(), null, 1);

/* insert value for sand. remember here 1 dumphar = 400 cuf (cubic feet) = 11.325 cum (cubic metre)*/
INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (2, 'CHATTARPUR_SAND_TRADE_NORMAL', 'sand', 'normal', 'trade', 'chattarpur', 'normal', '1 dmphar', 18000, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (2, 'CHATTARPUR_SAND_TRADE_NORMAL', 'sand', 'normal', 'trade', 'chattarpur', 'normal', '1 cuf', 45, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (2, 'CHATTARPUR_SAND_TRADE_NORMAL', 'sand', 'normal', 'trade', 'chattarpur', 'normal', '1 cum', 1589.40, CURDATE(), null, 1);

/* insert value for stone. remember here 1 dumphar = 400 cuf (cubic feet) = 11.325 cum (cubic metre)*/
INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (3, 'ASHOK_AADHA_PONA_STONE_TRADE_NORMAL', 'stone', 'normal', 'trade', 'ashok', 'normal', '1 dmphar', 6500, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (3, 'ASHOK_AADHA_PONA_STONE_TRADE_NORMAL', 'stone', 'normal', 'trade', 'ashok', 'normal', '1 cuf', 16.25, CURDATE(), null, 1);

INSERT INTO kalp_cost_config_cc_material (material_id, material_name, material_category, material_type, material_subtype, material_brand, material_quality, material_unit, material_unit_cost, start_date, end_date, is_current)
VALUES (3, 'ASHOK_AADHA_PONA_STONE_TRADE_NORMAL', 'stone', 'normal', 'trade', 'ashok', 'normal', '1 cum', 573.95, CURDATE(), null, 1);
















































































































































































