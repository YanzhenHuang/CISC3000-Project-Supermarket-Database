create table emp_invent (
	inv_id INT(5),
	emp_id INT(4),
    i_s_time TIME,
    i_e_time TIME NOT NULL,
    primary key (inv_id, emp_id, i_s_time),
    foreign key (inv_id) references inventory(inv_id),
    foreign key (emp_id) references employee(emp_id)
);


-- FUNCTIONALITIES
	-- See Entire Work Schedule (of a specific job, or entirely)
select emp_invent.inv_id,address, emp_invent.emp_id, name,job_name, i_s_time 'start time', i_e_time 'end time'
from emp_invent, employee, inventory
where emp_invent.emp_id=employee.emp_id and emp_invent.inv_id=inventory.inv_id and employee.job_name='Inventory Manager';

	-- View average salary of employees working in different inventories. (Keep 2 decimal digits.)
select emp_invent.inv_id, address, concat("$",cast(avg(salary) as decimal(38,2))) "average salary"
from emp_invent, employee, inventory
where emp_invent.emp_id=employee.emp_id and emp_invent.inv_id=inventory.inv_id
group by emp_invent.inv_id;


-- DESCRIPTION
	-- There are five Inventories, with inv_id ranging from 1 to 5.
	-- Certain Jobs is needed for every inventory:
		-- Inventory Manager: 1 for each inventory. Work Time: 09:00:00 ~ 13:59:59;
		-- Porters: 2 for each inventory, works in two time intervals respectively: 09:00:00 ~ 13:59:59, 14:00:00 ~ 15:59:59;
		-- Securities: 1 for each inventory. Work Time: 09:00:00 ~ 15:59:59.
    
-- VALUES INSERTION	
	-- Inventory 01 (inv_id=01)
		-- Inventory Manager
		insert into emp_invent values(1,1,"9:00:00","13:59:59");
		-- Porters
		insert into emp_invent values(1,21,"9:00:00","13:59:59");
		insert into emp_invent values(1,22,"14:00:00","15:59:59");
		-- Security
		insert into emp_invent values(1,30,"9:00:00","15:59:59");



	-- Inventory 02 (inv_id=02)
		-- Inventory Manager
        insert into emp_invent value(2,2,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent values(2,23,"9:00:00","13:59:59");
        insert into emp_invent value(2,24,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent values(2,31,"9:00:00","15:59:59");
        
        
	-- Inventory 03 (inv_id=03)
		-- Inventory Manager
        insert into emp_invent value(3,3,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(3,25,"9:00:00","13:59:59");
        insert into emp_invent value(3,26,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(3,32,"9:00:00","15:59:59");
        
        
	-- Inventory 04 (inv_id=04)
		-- Inventory Manager
        insert into emp_invent value(4,4,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(4,27,"9:00:00","13:59:59");
        insert into emp_invent value(4,28,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(4,33,"9:00:00","15:59:59");
        
        
	-- Inventory 05 (inv_id=05)
		-- Inventory Manager
        insert into emp_invent value(5,5,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(5,29,"9:00:00","13:59:59");
        insert into emp_invent value(5,30,"14:00:00","15:59:59");
        update emp_invent set emp_id=53 where emp_id=30;
        -- Security
        insert into emp_invent value(5,34,"9:00:00","15:59:59");
        
        
	-- Inventory 06 (inv_id=6)
		-- Inventory Manager
        insert into emp_invent value(6,65,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(6,52,"9:00:00","13:59:59");
        insert into emp_invent value(6,75,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(6,70,"9:00:00","15:59:59");
        
        
	-- Inventory 07 (inv_id=7)
		-- Inventory Manager
        insert into emp_invent value(7,66,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(7,76,"9:00:00","13:59:59");
        insert into emp_invent value(7,77,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(7,71,"9:00:00","15:59:59");
        
        
	-- Inventory 08 (inv_id=8)
		-- Inventory Manager
        insert into emp_invent value(8,67,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(8,78,"9:00:00","13:59:59");
        insert into emp_invent value(8,79,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(8,72,"9:00:00","15:59:59");
	
	-- Inventory 09 (inv_id=9)
		-- Inventory Manager
        insert into emp_invent value(9,68,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(9,80,"9:00:00","13:59:59");
        insert into emp_invent value(9,81,"14:00:00","15:59:59");
		-- Security
        insert into emp_invent value(9,73,"9:00:00","15:59:59");
        
	-- Inventory 10 (inv_id=10)
		-- Inventory Manager
        insert into emp_invent value(10,69,"9:00:00","13:59:59");
        -- Porters
        insert into emp_invent value(10,82,"9:00:00","13:59:59");
        insert into emp_invent value(10,83,"14:00:00","15:59:59");
        -- Security
        insert into emp_invent value(10,74,"9:00:00","15:59:59");
