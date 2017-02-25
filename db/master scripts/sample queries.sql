 --view expenses
select * from kalp_project_exp_details where when_created > '2015-12-16';
select sum(amount) from kalp_project_exp_details where id > 736;

update kalp_project_exp_details set expense_date = STR_TO_DATE('2013-06-28','%Y-%m-%d') where id in (396, 397);

SELECT kalp_projects.project_name, kalp_subprojects.subproject_name, kalp_subprojects_mapping.remark
FROM kalp_projects 
	INNER JOIN kalp_subprojects_mapping
		ON kalp_projects.id = kalp_subprojects_mapping.project_id
	INNER JOIN kalp_subprojects
		ON kalp_subprojects.id = kalp_subprojects_mapping.subproject_id
WHERE kalp_projects.id=1;

--Create checkbox.
"SELECT kalp_projects.project_name, kalp_subprojects.subproject_name, kalp_subprojects_mapping.remark,
CONCAT('<input type=\"checkbox\" name=\"sub_project_check[]\" value=\"',kalp_subprojects.id,'\"  checked >', kalp_subprojects.subproject_name,'<br>')
FROM kalp_projects 
	INNER JOIN kalp_subprojects_mapping
		ON kalp_projects.id = kalp_subprojects_mapping.project_id
	INNER JOIN kalp_subprojects
		ON kalp_subprojects.id = kalp_subprojects_mapping.subproject_id
WHERE kalp_projects.id = {$project_id}";


SELECT MIN(expense_date), MAX(expense_date)
FROM kalp_project_exp_details
WHERE project_id = 1;