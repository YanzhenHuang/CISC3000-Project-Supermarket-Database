
-- Enter an employee's ID, see his/her work time.
delimiter $$
create function see_work_time(input_emp_id int)
returns int
	reads sql data
		begin
			declare work_time time;
				select timediff(i_e_time,i_s_time) into work_time
                from emp_invent
                where emp_id=input_emp_id;
			return work_time;
        end$$
delimiter ;



-- Call Function
select cast(see_work_time(23) as time);
