create table shelf(
	shelf_id INT(3),
    area_id INT(2) DEFAULT 00,
    s_tot_cap INT DEFAULT 100,
    primary key (shelf_id),
    foreign key (area_id) references area(area_id),
	check (s_tot_cap>0)		-- Total Capacity of a shelf should be at least over 0.
);


-- FUNCTIONALITIES
	-- See all shelf with its area
	select shelf_id, area_loc
	from shelf, area
	where shelf.area_id=area.area_id;

-- VALUE INSERTION
	-- Area A0
	insert into shelf values(0,00,100);
	insert into shelf values(1,00,100);
	insert into shelf values(2,00,100);
	insert into shelf values(3,00,100);
	insert into shelf values(4,00,100);
	insert into shelf values(5,00,100);

	-- Area A1
	insert into shelf values(6,01,100);
	insert into shelf values(7,01,100);
	insert into shelf values(8,01,100);
	insert into shelf values(9,01,100);
	insert into shelf values(10,01,100);
	insert into shelf values(11,01,100);

	-- Area A2
	insert into shelf values(12,02,100);
	insert into shelf values(13,02,100);
	insert into shelf values(14,02,100);
	insert into shelf values(15,02,100);
	insert into shelf values(16,02,100);
	insert into shelf values(17,02,100);

	-- Area A3
	insert into shelf values(18,03,100);
	insert into shelf values(19,03,100);
	insert into shelf values(20,03,100);
	insert into shelf values(21,03,100);
	insert into shelf values(22,03,100);
	insert into shelf values(23,03,100);
	insert into shelf values(24,04,100);

	-- Area B1
	insert into shelf values(25,04,100);
	insert into shelf values(26,04,100);
	insert into shelf values(27,04,100);
	insert into shelf values(28,04,100);
	insert into shelf values(29,04,100);

	-- Area B2
	insert into shelf values(30,05,100);
	insert into shelf values(31,05,100);
	insert into shelf values(32,05,100);
	insert into shelf values(33,05,100);
	insert into shelf values(34,05,100);
	insert into shelf values(35,05,100);
    
    -- Area B3
    insert into shelf values (36,6,100);
	insert into shelf values (37,6,100);
	insert into shelf values (38,6,100);
    -- Area B4
	insert into shelf values (39,7,100);
	insert into shelf values (40,7,100);
	insert into shelf values (41,7,100);
    -- Area B5
	insert into shelf values (42,8,100);
	insert into shelf values (43,8,100);
	insert into shelf values (44,8,100);
    -- Area B6
	insert into shelf values (45,9,100);
	insert into shelf values (46,9,100);
	insert into shelf values (47,9,100);
    -- Area B7
	insert into shelf values (48,10,100);
	insert into shelf values (49,10,100);
	insert into shelf values (50,10,100);
    
    
    
    select * from area;