create table emp_area(
	area_id INT(2),
    emp_id INT(5),
    a_s_time TIME,
    a_e_time TIME NOT NULL,
    primary key (area_id, emp_id, a_s_time),
    foreign key (area_id) references area(area_id),
    foreign key (emp_id) references employee(emp_id)
    
);

-- DESCRIPTION: There are 48 employee-area relationships. Please view them all.
	select count(*) from emp_area;

-- FUNCTIONALITIES
	-- See Entire work schedule, with name of employee. (Function):
select area_loc, employee.emp_id, employee.name, job_name,a_s_time as start_time, a_e_time as end_time, timediff(a_e_time,a_s_time) as "time of work"
from emp_area, employee, area
where emp_area.emp_id=employee.emp_id and emp_area.area_id=area.area_id and job_name='Cleaning'
order by emp_area.area_id;

	-- View average salary of employees working in different areas. (Keep 2 decimal digits.):
select area_loc 'Area',concat("$",cast(avg(salary) as decimal(38,2))) "average salary"
from emp_area, employee, area
where emp_area.emp_id=employee.emp_id and emp_area.area_id=area.area_id
group by emp_area.area_id;

	-- View average salary for counter clerk. (Keep 2 decimal digits.):
select concat("$",cast(avg(salary) as decimal(38,2))) "AVG salary of Counter Clerk"
from employee, emp_area
where job_name="Counter Clerk" and employee.emp_id=emp_area.emp_id and area_id=0;



-- VALUES INSERTION
	-- Area 00 (A0)
		-- Area Manager:
insert into emp_area values(0,7,"9:00:00","20:59:59");
		-- Porters:
insert into emp_area values(0,14,"9:00:00","14:59:59");
		-- Securities: None. Areas doesn't need security.
        -- Counter Clerk: (Special: Area 00 (A0) is counter area.)
insert into emp_area values(0,35,"9:00:00","11:59:59");
insert into emp_area values(0,36,"9:00:00","11:59:59");
insert into emp_area values(0,37,"12:00:00","16:59:59");
insert into emp_area values(0,38,"12:00:00","16:59:59");
insert into emp_area values(0,35,"17:00:00","20:59:59");
insert into emp_area values(0,36,"17:00:00","20:59:59");
insert into emp_area values(0,39,"17:00:00","20:59:59");
		-- Salesman: None. It is not needed in counter area.
        -- Cleaning:
insert into emp_area values(0,46,"9:00:00","10:00:00");
	-- <update> update emp_area set a_e_time="10:59:59" where emp_id=46;
insert into emp_area values(0,46,"12:00:00","13:59:59");
insert into emp_area values(0,46,"20:00:00","21:59:59");

	-- Area 01 (A1)
		-- Area Manager:
insert into emp_area values(1,8,"9:00:00","21:59:59");
		-- Porters:
insert into emp_area values(1,15,"9:00:00","14:59:59");
		-- Securities: 
        -- Counter Clerk: None.
        -- Salesman: None.
		-- Cleaning:
insert into emp_area values(1,47,"9:00:00","10:59:59");
insert into emp_area values(1,47,"12:00:00","13:59:59");
insert into emp_area values(1,47,"20:00:00","21:59:59");

	-- Area 02 (A2)
		-- Area Manager:
insert into emp_area values(2,9,"9:00:00","21:59:59");
		-- Porters:
insert into emp_area values(2,16,"9:00:00","14:59:59");
		-- Securities: None
        -- Counter Clerk: None
        -- Salesman: 
insert into emp_area values(2,40,"15:00:00","17:59:59");
		-- Cleaning:
insert into emp_area values(2,48,"9:00:00","10:59:59");
insert into emp_area values(2,48,"12:00:00","13:59:59");
insert into emp_area values(2,48,"20:00:00","21:59:59");
        
        

	-- Area 03 (A3)
		-- Area Manager
insert into emp_area values(3,10,"9:00:00","21:59:59");
		-- Porters
insert into emp_area values(3,17,"9:00:00","14:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: 
insert into emp_area values(3,41,"15:00:00","17:59:59");
		-- Cleaning:
insert into emp_area values(3,49,"9:00:00","10:59:59");
insert into emp_area values(3,49,"12:00:00","13:59:59");
insert into emp_area values(3,49,"20:00:00","21:59:59");


	-- Area 04 (B1)
		-- Area Manager
insert into emp_area values(4,11,"9:00:00","21:59:59");
		-- Porters
insert into emp_area values(4,18,"9:00:00","14:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: 
insert into emp_area values(4,42,"15:00:00","17:59:59");
		-- Cleaning:
insert into emp_area values(4,50,"9:00:00","10:59:59");
insert into emp_area values(4,50,"12:00:00","13:59:59");
insert into emp_area values(4,50,"20:00:00","21:59:59");

	-- Area 05 (B2)
		-- Area Manager
insert into emp_area values(5,12,"9:00:00","21:59:59");
		-- Porters
insert into emp_area values(5,19,"9:00:00","14:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: 
insert into emp_area values(5,43,"15:00:00","17:59:59");
		-- Cleaning:
insert into emp_area values(5,51,"9:00:00","10:59:59");
insert into emp_area values(5,51,"12:00:00","13:59:59");
insert into emp_area values(5,51,"20:00:00","21:59:59");

	-- Area 06 (B3)
		-- Area Manager:
insert into emp_area values(6,13,"9:00:00","21:59:59");
		-- Porters:
insert into emp_area values(6,20,"9:00:00","14:59:59");
		-- Securities: None.
        -- Counter Clerk: None.
		-- Salesman: 
insert into emp_area values(6,44,"9:00:00","14:59:59");
insert into emp_area values(6,44,"15:00:00","17:59:59");
		-- Cleaning:
insert into emp_area values(6,54,"9:00:00","10:59:59");
insert into emp_area values(6,54,"12:00:00","13:59:59");
insert into emp_area values(6,54,"20:00:00","21:59:59");

	-- Area 07 (B4)
		-- Area Manager:
insert into emp_area values(7,61,"9:00:00","21:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: None 
		-- Cleaning:
insert into emp_area values(7,56,"9:00:00","10:59:59");

	-- Area 08 (B5)
		-- Area Manager:
insert into emp_area values(8,62,"9:00:00","21:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: None
		-- Cleaning:
insert into emp_area values(8,57,"9:00:00","10:59:59");

	-- Area 09 (B4)
		-- Area Manager:
insert into emp_area values(9,63,"9:00:00","21:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: None
		-- Cleaning:
insert into emp_area values(9,58,"9:00:00","10:59:59");

	-- Area 10 (B5)
		-- Area Manager:
insert into emp_area values(10,64,"9:00:00","21:59:59");
		-- Securities: None
        -- Counter Clerk: None
		-- Salesman: None
		-- Cleaning:
insert into emp_area values(10,59,"9:00:00","10:59:59");
