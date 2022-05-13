create table employee (
	emp_id INT(4),
    name VARCHAR(20),
    salary DECIMAL(6,2),
    job_name VARCHAR(255),
    primary key(emp_id),
    foreign key(job_name) references job(job_name)
);
alter table employee modify salary decimal(8,2);
select * from employee;
-- DESCRIPTION:
	-- There are 56 employees
	select count(*) from employee;
	-- Note: We do not distinguish genders of employees because we promote gender equality. We also do not emphasize the subordinate relationships because it is bad for cooperating.

-- FUNCTIONALITIES:
	-- View Every Employee:
 select * from employee;
    -- View Employees, with his/her working place
    (select distinct employee.emp_id, name, concat("$",cast(salary as decimal(38,2))) "Salary", job_name 'Position', concat("Area ",area_loc) 'Work Place'
    from employee, emp_area, area
    where employee.emp_id=emp_area.emp_id and emp_area.area_id=area.area_id)
    union
    (select distinct employee.emp_id, name, concat("$",cast(salary as decimal(38,2))) "Salary", job_name 'Position', concat("Inventory at ",address) 'Work Place'
    from employee, emp_invent, inventory
    where employee.emp_id=emp_invent.emp_id and emp_invent.inv_id=inventory.inv_id)
    union
    (select distinct employee.emp_id, name, concat("$",cast(salary as decimal(38,2))) "Salary", job_name 'Position', 'Not Specified'
    from employee, emp_area
    where employee.emp_id not in((select emp_id from emp_area)union(select emp_id from emp_invent)))
    order by emp_id;
    
    -- View Employees that doesn't work in areas:
    select distinct employee.emp_id, name
    from employee, emp_area
    where employee.emp_id not in (select emp_id from emp_area)
    order by emp_id;


	-- View Spare Porters
	select distinct employee.emp_id, name
    from employee, emp_invent
    where employee.emp_id not in (select emp_id from emp_invent) and employee.emp_id not in (select emp_id from emp_area) and employee.job_name='Porter'; 
    

    
    
	-- Linguistic Searches:
		-- View Employees whose name start with S, whose name length is over 6:
		select *
		from employee
		where name like "S______%"; -- Note: In case it is not identifiable,  there are six '-' between 'S' and '%'. You can delete one and have a try.
        
        -- View Employees whose name must start with "Steve":
        select *
        from employee
        where name regexp "^Steve";
			-- or
		select *
        from employee
        where name like "Steve%";
        
        -- View Employees whose name must end with "er":
        select * 
        from employee
        where name regexp "er$";
        
        -- View Employees whose name must end with "an","on","en" or "in":
        select *
        from employee
        where name regexp "[a,o,e,i]n$";



-- VALUES INSERTIONS
	-- Supermarket Manager
	insert into employee values (0000,'Vincent',30000,'Supermarket Manager');
    
	-- Inventory Manager
	insert into employee values (0001,'Bob',29000, 'Inventory Manager');
	insert into employee values (0002,'Xu',28500, 'Inventory Manager');
	insert into employee values (0003,'Snoppy',28900, 'Inventory Manager');
	insert into employee values (0004,'Daisy',30000, 'Inventory Manager');
	insert into employee values (0005,'Huang',39000, 'Inventory Manager');
	insert into employee values (0006,'Adolf',33000, 'Inventory Manager');
		-- Extra 6 Managers from (65-69)
    insert into employee values (0065,'Diane',33100,'Inventory Manager');
    insert into employee values (0066,'JJLin',32900,'Inventory Manager');
    insert into employee values (0067,'Jay Chou',32800,'Inventory Manager');
    insert into employee values (0068,'Lord Palmerston',32000,'Inventory Manager');
    insert into employee values (0069,'Cicil',33500,'Inventory Manager');
    
	-- Area Manager
    select * from area;
	insert into employee values (0007,'Biden',20000, 'Area Manager');
	insert into employee values (0008,'Obama',21000, 'Area Manager');
	insert into employee values (0009,'Trump',25000, 'Area Manager');
	insert into employee values (0010,'Takashima',23000, 'Area Manager');
	insert into employee values (0011,'Griffin',19000, 'Area Manager');
	insert into employee values (0012,'Parry Liu',29000, 'Area Manager');
	insert into employee values (0013,'Dick',18020, 'Area Manager');
    
	insert into employee values (0061,'John Cena',18220, 'Area Manager');
	insert into employee values (0062,'Jeff Bezos',18220, 'Area Manager');
	insert into employee values (0063,'Cardi B',18220, 'Area Manager');
	insert into employee values (0064,'Michly',19420, 'Area Manager');


	-- Insert Porter
	insert into employee values (0014,'Aoi Sora',19000, 'Porter');
	insert into employee values (0015,'Hanazawa',21000, 'Porter');
	insert into employee values (0016,'Yoshioka',21000, 'Porter');
	insert into employee values (0017,'Hashimodo',22300, 'Porter');
	insert into employee values (0018,'Billy Herrington',20000, 'Porter');
	insert into employee values (0019,'Vasili',20300, 'Porter'); -- Troyanov Boyanov
	insert into employee values (0020,'Putin',20200, 'Porter');
	insert into employee values (0021,'Moon',20400, 'Porter');
	insert into employee values (0022,'GDragon',22000, 'Porter');
	insert into employee values (0023,'SpiderMan',20001, 'Porter');
	insert into employee values (0024,'Eric',20030, 'Porter');
	insert into employee values (0025,'Eminem',18900, 'Porter');
	insert into employee values (0026,'Drake',18000, 'Porter');
	insert into employee values (0027,'IronMan',17000, 'Porter');
	insert into employee values (0028,'Betty',17200, 'Porter');
	insert into employee values (0029,'Yu',16900, 'Porter');
	insert into employee values (0052,'Joshua',20000, 'Porter');
	insert into employee values (0053,'Zelensky',20000, 'Porter');    
		-- Extra 10 porters 75~84
	insert into employee values (0075,'Wandy',20000, 'Porter');    
    insert into employee values (0076,'Venice',20000, 'Porter'); 
    insert into employee values (0077,'Romania',20000, 'Porter'); 
    insert into employee values (0078,'Erika',20000, 'Porter'); 
    insert into employee values (0079,'Juicy',20000, 'Porter'); 
    insert into employee values (0080,'Cindy',20000, 'Porter'); 
    insert into employee values (0081,'Flora',20000, 'Porter'); 
    insert into employee values (0082,'Sparta',20000, 'Porter'); 
    insert into employee values (0083,'Stupedia',20000, 'Porter');
    insert into employee values (0084,'Owen',20000, 'Porter'); 

	-- Insert Security
	insert into employee values (0030,'Michael',18200, 'Security');
	insert into employee values (0031,'Trever',21900, 'Security');
	insert into employee values (0032,'Frankln',2100, 'Security');
	insert into employee values (0033,'CJ',17900, 'Security');
	insert into employee values (0034,'Qian',19900, 'Security');
		-- Extra 5 from 70~74
	insert into employee values (0070,'Taylor Swift',19900,'Security');
    insert into employee values (0071,'Phill',19900,'Security');
    insert into employee values (0072,'Dan',19900,'Security');
    insert into employee values (0073,'Louis',19900,'Security');
    insert into employee values (0074,'Solar',19900,'Security');

	-- Insert Counter Clerk
	insert into employee values (0035,'Vladmir',15000, 'Counter Clerk');
	insert into employee values (0036,'Yume',15200, 'Counter Clerk');
	insert into employee values (0037,'Albert',15100, 'Counter Clerk');
	insert into employee values (0038,'Go',15000, 'Counter Clerk');
	insert into employee values (0039,'Yakuzk',14900, 'Counter Clerk');

	-- Insert Salesman
	insert into employee values (0040,'Steve Jobs',15000, 'Salesman');
	insert into employee values (0041,'Tim Cook',15000, 'Salesman');
	insert into employee values (0042,'Thunder',15000, 'Salesman');
	insert into employee values (0043,'Spooner',15000, 'Salesman');
	insert into employee values (0044,'Paul',15000, 'Salesman');
	insert into employee values (0045,'Jeffery',18000, 'Salesman');
	
	-- Insert Cleaning
	insert into employee values (0046, 'Norman', 10000, 'Cleaning');
	insert into employee values (0047, 'Beans', 10010, 'Cleaning');
	insert into employee values (0048, 'Jordan', 11030, 'Cleaning');
	insert into employee values (0049, 'Peter', 12900, 'Cleaning');
	insert into employee values (0050, 'Jason', 12800, 'Cleaning');
	insert into employee values (0051, 'George', 10500, 'Cleaning');
	insert into employee values (0054, 'Latina', 10000,'Cleaning');
	insert into employee values (0055, 'Grace',10000,'Cleaning');
    insert into employee values (0056, 'Tony',10000,'Cleaning');
    insert into employee values (0057, 'Li Boyang',10000,'Cleaning');
    insert into employee values (0058, 'Liao Duojun',10000,'Cleaning');
    insert into employee values (0059, 'Chris Wu',10000,'Cleaning');
    insert into employee values (0060, 'Lu Han',10000,'Cleaning');
    
    
    

