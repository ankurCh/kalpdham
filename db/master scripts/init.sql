/*
	initilize the database tables.
	This will insert records into database tables.
	Data is related to projects, categories, etc.
	No transaction data will be created.
*/

/*
	kalp_projects
*/
INSERT INTO kalp_projects (project_name, project_type)
VALUE ('Girdhari Puram','colony');

INSERT INTO kalp_projects (project_name, project_type)
VALUE ('Desai Residency','colony');

INSERT INTO kalp_projects (project_name, project_type)
VALUE ('Parijaat','colony');

INSERT INTO kalp_projects (project_name)
VALUE ('Other');

INSERT INTO kalp_projects (project_name, project_type)
VALUE ('Mohan Enclave','colony');

/*
	Create some sample data for project units.
*/
INSERT INTO kalp_project_units (project_id, plot_numbers, unit_dimension_imperial, unit_area_imperial, unit_type, north_direction_desc, south_direction_desc, east_direction_desc, west_direction_desc)
VALUES (1, 99, "22'x50'", "1100", "SINGLEX", "plot # 100", "plot # 98", "Road 7.5M wide", "plot # 125");

INSERT INTO kalp_project_units (project_id, plot_numbers, unit_dimension_imperial, unit_area_imperial, unit_type, north_direction_desc, south_direction_desc, east_direction_desc, west_direction_desc)
VALUES (1, 30, "25'8\"x50'", "1280", "SINGLEX", "plot # 29", "plot # 31", "House # 33", "Road 7.5M wide");

/*
	kalp_subprojects
*/
INSERT INTO kalp_subprojects (subproject_name)
VALUE ('Colony -- Internal');

INSERT INTO kalp_subprojects (subproject_name)
VALUE ('Colony -- External');

INSERT INTO kalp_subprojects (subproject_name)
VALUE ('Houses');

INSERT INTO kalp_subprojects (subproject_name)
VALUE ('Others');

--update color
UPDATE kalp_subprojects
SET color_name = 'red', color_code = '#ff0000'
WHERE id = 1;

UPDATE kalp_subprojects
SET color_name = 'green', color_code = '#00ff00'
WHERE id = 2;

UPDATE kalp_subprojects
SET color_name = 'blue', color_code = '#0000ff'
WHERE id = 6;

UPDATE kalp_subprojects
SET color_code = '#00ffff'
WHERE id = 3;


/*
	kalp_subprojects_mapping
	
*/

--For girdhari puram
INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (1, 1);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (1, 3);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (1, 5);

--For desai residency
INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (2, 1);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (2, 2);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (2, 3);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (2, 5);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (2, 6);

--For parijaat
INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (3, 1);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (3, 3);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (3, 5);

--For Others
INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (5, 5);

--For kalpdham
INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (6, 7);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (6, 8);

INSERT INTO kalp_subprojects_mapping(project_id, subproject_id)
VALUES (6, 5);

--add comments.
update kalp_subprojects_mapping
set remark = 'This is complete colony development including internal and external development. No seperate project for external development.'
where project_id = 1 and subproject_id = 1;

update kalp_subprojects_mapping
set remark = 'This is complete colony development including internal and external development. No seperate project for external development.'
where project_id = 3 and subproject_id = 1;