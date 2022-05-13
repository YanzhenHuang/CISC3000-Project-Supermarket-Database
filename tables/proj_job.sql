create table job (
	job_name varchar(255), 
    ref_salary decimal(6,2) DEFAULT 2500,
    primary key (job_name),
    check (ref_salary>=0 AND ref_salary<=30000) 	-- Reference salary should be over 0 and under 30000
);
alter table job ADD primary key (job_name);



-- DESCRIPTION:
	-- There are totally 8 jobs. 
    
    
    
-- FUNCTIONALITIES:
	-- Note: For more functionalities refering to jobs, view other files.
	-- View All jobs with reference salary
    select job_name, concat("$",cast(ref_salary as decimal(38,2))) 'Reference Salary'
    from job;
    
    



-- Value Insertions

insert into job values ('Supermarket Manager',30000);
insert into job values ('Inventory Manager',25000);
insert into job values ('Area Manager', 22000);
insert into job values ('Porter', 20000);	
insert into job values ('Security', 20000);
insert into job values ('Salesman', 15000);
insert into job values ('Counter Clerk', 15000);
insert into job values ('Cleaning',10000);
insert into job values('Intern',5000);
insert into job values('Temporary Helper',5000);