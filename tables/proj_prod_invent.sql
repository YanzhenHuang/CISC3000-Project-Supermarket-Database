create table prod_invent (
	prod_id INT(13),
    inv_id INT(3),
    in_amount INT NOT NULL DEFAULT 0,
    primary key (prod_id, inv_id),
    foreign key (prod_id) references product(prod_id),
    foreign key (inv_id) references inventory(inv_id)
    
);

-- At first we thought that a trigger constraint is needed to restrict that the insertion of data does not causes the out floating the capacity limit. 
-- However, with further consideration, we think that since the supermarket is used to RECORD, instead of MANIPULATE, these triggers is not in need.
-- It is designed that, everyday the Inventory Managers would count the amount of products in inventory, to keep data consistency.  

-- FUNCTIONALITIES

	-- Inventory, address, used capacity, Total Capacity and Remaining Capacity
	select prod_invent.inv_id 'Number',address, SUM(in_amount) as 'Used', inventory.i_tot_cap as 'Total', inventory.i_tot_cap-SUM(in_amount) as 'Remaining'
	from inventory, prod_invent
	where prod_invent.inv_id=inventory.inv_id
    group by prod_invent.inv_id
    order by prod_invent.inv_id;

	-- Details of a paticular inventory 
	select prod_invent.prod_id, prod_name, in_amount 'Amount'
	from prod_invent,product,inventory
	where prod_invent.inv_id=5 and product.prod_id=prod_invent.prod_id and prod_invent.inv_id=inventory.inv_id;




-- VALUE INSERTION
	-- inv_id=1 (prod_id, inv_id, in_amount)
	insert into prod_invent values(1,1,10);
	insert into prod_invent values(2,1,20);
	insert into prod_invent values(3,1,10);
	insert into prod_invent values(12,1,10);
	insert into prod_invent values(15,1,10);
	insert into prod_invent values(47,1,10);
	insert into prod_invent values(24,1,10);
	insert into prod_invent values(23,1,10);
	insert into prod_invent values(57,1,10);
	insert into prod_invent values(30,1,10);
    -- inv_id=2
	insert into prod_invent values(31,2,10);
	insert into prod_invent values(32,2,20);
	insert into prod_invent values(41,2,10);
	insert into prod_invent values(42,2,10);
	insert into prod_invent values(44,2,15);
	insert into prod_invent values(45,2,16);
	insert into prod_invent values(46,2,10);
	insert into prod_invent values(47,2,10);
	insert into prod_invent values(48,2,18);
	insert into prod_invent values(49,2,19);
    
    -- inv_id=3
	insert into prod_invent values(50,3,10);
	insert into prod_invent values(51,3,20);
	insert into prod_invent values(52,3,10);
	insert into prod_invent values(53,3,10);
	insert into prod_invent values(54,3,15);
	insert into prod_invent values(55,3,16);
	insert into prod_invent values(56,3,10);
	insert into prod_invent values(57,3,10);
	insert into prod_invent values(58,3,18);
	insert into prod_invent values(59,3,19);
    
    -- inv_id=4
	insert into prod_invent values(60,4,10);
	insert into prod_invent values(61,4,20);
	insert into prod_invent values(62,4,10);
	insert into prod_invent values(63,4,10);
	insert into prod_invent values(64,4,15);
	insert into prod_invent values(65,4,16);
	insert into prod_invent values(66,4,10);
	insert into prod_invent values(67,4,10);
	insert into prod_invent values(68,4,18);
	insert into prod_invent values(69,4,19);
    -- inv_id=5
	insert into prod_invent values(70,5,10);
	insert into prod_invent values(71,5,20);
	insert into prod_invent values(72,5,10);
	insert into prod_invent values(73,5,10);
	insert into prod_invent values(74,5,15);
	insert into prod_invent values(75,5,16);
	insert into prod_invent values(76,5,10);
	insert into prod_invent values(77,5,10);
	insert into prod_invent values(78,5,18);
	insert into prod_invent values(79,5,19);

	-- inv_id=6
	insert into prod_invent values (1,6,20);
	insert into prod_invent values (2,6,20);
	insert into prod_invent values (3,6,20);
	insert into prod_invent values (4,6,20);
	insert into prod_invent values (5,6,20);
	-- inv_id=7
	insert into prod_invent values (6,7,20);
	insert into prod_invent values (7,7,20);
	insert into prod_invent values (8,7,20);
	insert into prod_invent values (9,7,20);
	insert into prod_invent values (10,7,20);
	-- inv_id=8
	insert into prod_invent values (11,8,20);
	insert into prod_invent values (12,8,20);
	insert into prod_invent values (13,8,20);
	insert into prod_invent values (14,8,20);
	insert into prod_invent values (15,8,20);
	-- inv_id=9
	insert into prod_invent values (16,9,20);
	insert into prod_invent values (17,9,20);
	insert into prod_invent values (18,9,20);
	insert into prod_invent values (19,9,20);
	insert into prod_invent values (20,9,20);
	-- inv_id=10
	insert into prod_invent values (21,10,20);
	insert into prod_invent values (22,10,20);
	insert into prod_invent values (23,10,20);
	insert into prod_invent values (24,10,20);
	insert into prod_invent values (25,10,20);

