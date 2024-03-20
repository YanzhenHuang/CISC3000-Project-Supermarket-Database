drop table prod_shelf;
create table prod_shelf (
	prod_id INT(13),
    shelf_id INT(3),
    set_amount INT NOT NULL DEFAULT 0,
    primary key (prod_id, shelf_id)
    -- foreign key (prod_id) references product(prod_id),
    -- foreign key (shelf_id) references shelf(shelf_id)
);

-- FUNCTIONALITIES
	-- View All from prod_shelf
	select * from prod_shelf order by shelf_id;

	-- Sum of price of a paticular shelf
	select shelf_id, concat("$",sum(set_amount*product.sell_price)) as sum
	from prod_shelf,product
	where prod_shelf.prod_id=product.prod_id
	group by shelf_id
	order by shelf_id;

	-- Check for details of a shelf (e.g.: shelf_id=1)
	select product.prod_id, product.prod_name, set_amount, shelf_id
	from prod_shelf, product
	where prod_shelf.prod_id=product.prod_id and shelf_id=1;


-- (Not Functioning) A trigger to prevent out-floating of capacity 
delimiter $$
create trigger out_float_prevent before insert on prod_shelf
for each row
	begin
		if ((select sum(set_amount)+new.set_amount from prod_shelf where shelf_id=new.shelf_id)>=100) then rollback;
        end if;
	end$$
delimiter ;


-- FOR TEST USE ONLY!!!!!!!
delete from prod_shelf;
show triggers;
drop trigger out_float_prevent;


-- Insert Values (prod_id, shelf_id, set_amount)
	-- shelf_id = 1
	insert into prod_shelf values(1,1,6);
	insert into prod_shelf values(2,1,6);
	insert into prod_shelf values(3,1,6);
	insert into prod_shelf values(4,1,6);
	insert into prod_shelf values(5,1,6);
    -- shelf_id = 2
	insert into prod_shelf values(6,2,6);
	insert into prod_shelf values(7,2,6);
	insert into prod_shelf values(8,2,6);
	insert into prod_shelf values(9,2,6);
	insert into prod_shelf values(10,2,6);
    -- shelf_id = 3
	insert into prod_shelf values(11,3,6);
	insert into prod_shelf values(12,3,6);
	insert into prod_shelf values(13,3,6);
	insert into prod_shelf values(14,3,6);
	insert into prod_shelf values(15,3,6);
    -- shelf_id = 4
	insert into prod_shelf values(16,4,6);
	insert into prod_shelf values(17,4,6);
	insert into prod_shelf values(18,4,6);
	insert into prod_shelf values(19,4,6);
	insert into prod_shelf values(20,4,6);
    -- shelf_id = 5
	insert into prod_shelf values(21,5,6);
	insert into prod_shelf values(22,5,6);
	insert into prod_shelf values(23,5,6);
	insert into prod_shelf values(24,5,6);
	insert into prod_shelf values(25,5,6);
    -- shelf_id = 6
	insert into prod_shelf values(26,6,6);
	insert into prod_shelf values(27,6,6);
	insert into prod_shelf values(28,6,6);
	insert into prod_shelf values(29,6,6);
	insert into prod_shelf values(30,6,6);
    -- shelf_id = 7
	insert into prod_shelf values(31,7,6);
	insert into prod_shelf values(32,7,6);
	insert into prod_shelf values(33,7,6);
	insert into prod_shelf values(34,7,6);
	insert into prod_shelf values(35,7,6);
    -- shelf_id = 8
	insert into prod_shelf values(36,8,6);
	insert into prod_shelf values(37,8,6);
	insert into prod_shelf values(38,8,6);
	insert into prod_shelf values(39,8,6);
	insert into prod_shelf values(40,8,6);
    -- shelf_id = 9
	insert into prod_shelf values(41,9,6);
	insert into prod_shelf values(42,9,6);
	insert into prod_shelf values(43,9,6);
	insert into prod_shelf values(44,9,6);
	insert into prod_shelf values(45,9,6);
    -- shelf_id = 10
	insert into prod_shelf values(46,10,6);
	insert into prod_shelf values(47,10,6);
	insert into prod_shelf values(48,10,6);
	insert into prod_shelf values(49,10,6);
	insert into prod_shelf values(50,10,6);
    -- shelf_id = 11
	insert into prod_shelf values(51,11,6);
	insert into prod_shelf values(52,11,6);
	insert into prod_shelf values(53,11,6);
	insert into prod_shelf values(54,11,6);
	insert into prod_shelf values(55,11,6);
    -- shelf_id = 12
	insert into prod_shelf values(56,12,6);
	insert into prod_shelf values(57,12,6);
	insert into prod_shelf values(58,12,6);
	insert into prod_shelf values(59,12,6);
	insert into prod_shelf values(60,12,6);
    -- shelf_id = 13
	insert into prod_shelf values(61,13,6);
	insert into prod_shelf values(62,13,6);
	insert into prod_shelf values(63,13,6);
	insert into prod_shelf values(64,13,6);
	insert into prod_shelf values(65,13,6);
    -- shelf_id = 14
	insert into prod_shelf values(66,14,6);
	insert into prod_shelf values(67,14,6);
	insert into prod_shelf values(68,14,6);
	insert into prod_shelf values(69,14,6);
	insert into prod_shelf values(70,14,6);
    -- shelf_id = 15
	insert into prod_shelf values(71,15,6);
	insert into prod_shelf values(72,15,6);
	insert into prod_shelf values(73,15,6);
	insert into prod_shelf values(74,15,6);
	insert into prod_shelf values(75,15,6);
	insert into prod_shelf values(29,15,6);
	insert into prod_shelf values(30,15,6);
	insert into prod_shelf values(31,15,6);
	insert into prod_shelf values(32,15,6);
	insert into prod_shelf values(33,15,6);
    -- shelf_id = 16
	insert into prod_shelf values(31,16,6);
	insert into prod_shelf values(32,16,6);
	insert into prod_shelf values(33,16,6);
	insert into prod_shelf values(34,16,6);
	insert into prod_shelf values(35,16,6);
    -- shelf_id = 17
	insert into prod_shelf values(33,17,6);
	insert into prod_shelf values(34,17,6);
	insert into prod_shelf values(35,17,6);
	insert into prod_shelf values(36,17,6);
	insert into prod_shelf values(37,17,6);
    -- shelf_id = 18
	insert into prod_shelf values(35,18,6);
	insert into prod_shelf values(36,18,6);
	insert into prod_shelf values(37,18,6);
	insert into prod_shelf values(38,18,6);
	insert into prod_shelf values(39,18,6);
    -- shelf_id = 19
	insert into prod_shelf values(37,19,6);
	insert into prod_shelf values(38,19,6);
	insert into prod_shelf values(39,19,6);
	insert into prod_shelf values(40,19,6);
	insert into prod_shelf values(41,19,6);
    -- shelf_id = 20
	insert into prod_shelf values(39,20,6);
	insert into prod_shelf values(40,20,6);
	insert into prod_shelf values(41,20,6);
	insert into prod_shelf values(42,20,6);
	insert into prod_shelf values(43,20,6);
    -- shelf_id = 21
	insert into prod_shelf values(41,21,6);
	insert into prod_shelf values(42,21,6);
	insert into prod_shelf values(43,21,6);
	insert into prod_shelf values(44,21,6);
	insert into prod_shelf values(45,21,6);
    -- shelf_id = 22
	insert into prod_shelf values(43,22,6);
	insert into prod_shelf values(44,22,6);
	insert into prod_shelf values(45,22,6);
	insert into prod_shelf values(46,22,6);
	insert into prod_shelf values(47,22,6);
    -- shelf_id = 23
	insert into prod_shelf values(45,23,6);
	insert into prod_shelf values(46,23,6);
	insert into prod_shelf values(47,23,6);
	insert into prod_shelf values(48,23,6);
	insert into prod_shelf values(49,23,6);
    -- shelf_id = 24
	insert into prod_shelf values(47,24,6);
	insert into prod_shelf values(48,24,6);
	insert into prod_shelf values(49,24,6);
	insert into prod_shelf values(50,24,6);
	insert into prod_shelf values(51,24,6);
    -- shelf_id = 25
	insert into prod_shelf values(49,25,6);
	insert into prod_shelf values(50,25,6);
	insert into prod_shelf values(51,25,6);
	insert into prod_shelf values(52,25,6);
	insert into prod_shelf values(53,25,6);
    -- shelf_id = 26
	insert into prod_shelf values(51,26,6);
	insert into prod_shelf values(52,26,6);
	insert into prod_shelf values(53,26,6);
	insert into prod_shelf values(54,26,6);
	insert into prod_shelf values(55,26,6);
    -- shelf_id = 27
	insert into prod_shelf values(53,27,6);
	insert into prod_shelf values(54,27,6);
	insert into prod_shelf values(55,27,6);
	insert into prod_shelf values(56,27,6);
	insert into prod_shelf values(57,27,6);
    -- shelf_id = 28
	insert into prod_shelf values(55,28,6);
	insert into prod_shelf values(56,28,6);
	insert into prod_shelf values(57,28,6);
	insert into prod_shelf values(58,28,6);
	insert into prod_shelf values(59,28,6);
    -- shelf_id = 29
	insert into prod_shelf values(57,29,6);
	insert into prod_shelf values(58,29,6);
	insert into prod_shelf values(59,29,6);
	insert into prod_shelf values(60,29,6);
	insert into prod_shelf values(61,29,6);
    -- shelf_id = 30
	insert into prod_shelf values(59,30,6);
	insert into prod_shelf values(60,30,6);
	insert into prod_shelf values(61,30,6);
	insert into prod_shelf values(62,30,6);
	insert into prod_shelf values(63,30,6);
	-- shelf id=31
	insert into prod_shelf values (1,31,6);
	insert into prod_shelf values (2,31,6);
	insert into prod_shelf values (3,31,6);
	insert into prod_shelf values (4,31,6);
	insert into prod_shelf values (5,31,6);
	-- shelf id=32
	insert into prod_shelf values (6,32,6);
	insert into prod_shelf values (7,32,6);
	insert into prod_shelf values (8,32,6);
	insert into prod_shelf values (9,32,6);
	insert into prod_shelf values (10,32,6);
	-- shelf id=33
	insert into prod_shelf values (11,33,6);
	insert into prod_shelf values (12,33,6);
	insert into prod_shelf values (13,33,6);
	insert into prod_shelf values (14,33,6);
	insert into prod_shelf values (15,33,6);
	-- shelf id=34
	insert into prod_shelf values (16,34,6);
	insert into prod_shelf values (17,34,6);
	insert into prod_shelf values (18,34,6);
	insert into prod_shelf values (19,34,6);
	insert into prod_shelf values (20,34,6);
	-- shelf id=35
	insert into prod_shelf values (21,35,6);
	insert into prod_shelf values (22,35,6);
	insert into prod_shelf values (23,35,6);
	insert into prod_shelf values (24,35,6);
	insert into prod_shelf values (25,35,6);
	-- shelf id=36
	insert into prod_shelf values (26,36,6);
	insert into prod_shelf values (27,36,6);
	insert into prod_shelf values (28,36,6);
	insert into prod_shelf values (29,36,6);
	insert into prod_shelf values (30,36,6);
	-- shelf id=37
	insert into prod_shelf values (31,37,6);
	insert into prod_shelf values (32,37,6);
	insert into prod_shelf values (33,37,6);
	insert into prod_shelf values (34,37,6);
	insert into prod_shelf values (35,37,6);
	-- shelf id=38
	insert into prod_shelf values (36,38,6);
	insert into prod_shelf values (37,38,6);
	insert into prod_shelf values (38,38,6);
	insert into prod_shelf values (39,38,6);
	insert into prod_shelf values (40,38,6);
	-- shelf id=39
	insert into prod_shelf values (41,39,6);
	insert into prod_shelf values (42,39,6);
	insert into prod_shelf values (43,39,6);
	insert into prod_shelf values (44,39,6);
	insert into prod_shelf values (45,39,6);
	-- shelf id=40
	insert into prod_shelf values (46,40,6);
	insert into prod_shelf values (47,40,6);
	insert into prod_shelf values (48,40,6);
	insert into prod_shelf values (49,40,6);
	insert into prod_shelf values (50,40,6);
	-- shelf id=41
	insert into prod_shelf values (51,41,6);
	insert into prod_shelf values (52,41,6);
	insert into prod_shelf values (53,41,6);
	insert into prod_shelf values (54,41,6);
	insert into prod_shelf values (55,41,6);
	-- shelf id=42
	insert into prod_shelf values (56,42,6);
	insert into prod_shelf values (57,42,6);
	insert into prod_shelf values (58,42,6);
	insert into prod_shelf values (59,42,6);
	insert into prod_shelf values (60,42,6);
	-- shelf id=43
	insert into prod_shelf values (61,43,6);
	insert into prod_shelf values (62,43,6);
	insert into prod_shelf values (63,43,6);
	insert into prod_shelf values (64,43,6);
	insert into prod_shelf values (65,43,6);
	-- shelf id=44
	insert into prod_shelf values (66,44,6);
	insert into prod_shelf values (67,44,6);
	insert into prod_shelf values (68,44,6);
	insert into prod_shelf values (69,44,6);
	insert into prod_shelf values (70,44,6);
	-- shelf id=45
	insert into prod_shelf values (71,45,6);
	insert into prod_shelf values (72,45,6);
	insert into prod_shelf values (73,45,6);
	insert into prod_shelf values (74,45,6);
	insert into prod_shelf values (75,45,6);
	-- shelf id=46
	insert into prod_shelf values (76,46,6);
	insert into prod_shelf values (77,46,6);
	insert into prod_shelf values (78,46,6);
	insert into prod_shelf values (79,46,6);
	insert into prod_shelf values (80,46,6);
	-- shelf id=47
	insert into prod_shelf values (81,47,6);
	insert into prod_shelf values (82,47,6);
	insert into prod_shelf values (83,47,6);
	insert into prod_shelf values (1,47,6);
	insert into prod_shelf values (2,47,6);
	-- shelf id=48
	insert into prod_shelf values (3,48,6);
	insert into prod_shelf values (4,48,6);
	insert into prod_shelf values (5,48,6);
	insert into prod_shelf values (6,48,6);
	insert into prod_shelf values (7,48,6);
	-- shelf id=49
	insert into prod_shelf values (8,49,6);
	insert into prod_shelf values (9,49,6);
	insert into prod_shelf values (10,49,6);
	insert into prod_shelf values (11,49,6);
	insert into prod_shelf values (12,49,6);
	-- shelf id=50
	insert into prod_shelf values (13,50,6);
	insert into prod_shelf values (14,50,6);
	insert into prod_shelf values (15,50,6);
	insert into prod_shelf values (16,50,6);
	insert into prod_shelf values (17,50,6);

    



