create table area (
	area_id INT(2),
    area_loc VARCHAR(2),
    primary key (area_id)
);

-- DESCRIPTION:
	-- There are totally 7 areas labeled with area id, ranging from 0 to 6.
	-- The supermarket is designed to be multi-floored. The 'area_loc' tuple means 'area location'. The prefix letter 'A' or 'B' respectively represents the first floor and the second floor.
	-- Specially, area A0 (area_id=00) is designed to be the counter area. You will see more details about it later.


-- FUNCTIONALITIES
	-- View Area and its ID
	select * from area;


-- VALUE INSERTION
insert into area values (00,'A0');
insert into area values (01,'A1');
insert into area values (02,'A2');
insert into area values (03,'A3');
insert into area values (04,'B1');
insert into area values (05,'B2');

insert into area values (06,'B3');
insert into area values (07,'B4');
insert into area values (08,'B5');
insert into area values (09,'B6');
insert into area values (10,'B7');

