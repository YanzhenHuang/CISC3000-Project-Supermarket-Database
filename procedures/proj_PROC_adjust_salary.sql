-- This is a procedure to adjust salary for employee of a given job paticularly.

delimiter $$
create procedure adjust_salary (in input_job_name varchar(255))
		begin
				update employee set salary=(1+0.2)*salary 
				where job_name=input_job_name;
		end$$
delimiter ;

call adjust_salary("Cleaning");



