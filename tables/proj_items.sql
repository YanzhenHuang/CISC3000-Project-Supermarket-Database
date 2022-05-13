create table items(
	item_id INT(10),
    prod_id INT(13)DEFAULT 0000000000000,
    sell_amount INT DEFAULT 1,
    discount DECIMAL(3,2) DEFAULT 1,
    receipt_id INT(5) DEFAULT 00000,
    primary key (item_id),
    foreign key (prod_id) references product(prod_id),
    foreign key (receipt_id) references receipt(receipt_id),
    check (sell_amount>0 AND discount>=0 AND discount<=1)
);


-- FUNCTIONALITIES
	-- See all items (Please notice the processing of column 'Discount')
	select item_id, prod_name as 'Product Name', sell_amount, if(discount=1,'No Discount',concat(cast(discount*100 as decimal(38,0)),"%")) 'Discount', receipt_id
	from items, product
	where items.prod_id=product.prod_id;

	-- See items from a paticular receipt (e.g.: receipt_id=1)
	select item_id, prod_name as 'product name', concat("$",product.sell_price)as 'Price', sell_amount as 'amount', if(discount=1,'No Discount',concat(cast(discount*100 as decimal(38,0)),"%")) 'Discount', receipt_id
	from items, product
	where items.prod_id=product.prod_id and receipt_id=1;



-- VALUE INSERTION
	-- receipt_id=1 value reference (item_id,prod_id,sell_amount,discount,receipt_id)
	insert into items values(1,1,2,1,1);
	insert into items values(2,3,10,1,1);
	insert into items values(3,10,1,0.85,1);
	insert into items values(4,13,1,0.6,1);
	insert into items values(5,17,1,1,1);

	-- receipt_id=2 value reference (item_id,prod_id,sell_amount,discount,receipt_id)
	insert into items values(6,12,3,0.8,2);
	insert into items values(7,13,2,0.9,2);
	insert into items values(8,14,3,0.8,2);
	insert into items values(9,15,2,0.9,2);
	insert into items values(10,16,3,0.8,2);
	-- receipt_id=3
	insert into items value(11,17,2,0.9,3);
	insert into items value(12,18,3,0.8,3);
	insert into items value(13,19,2,0.9,3);
	insert into items value(14,20,3,0.9,3);
	insert into items value(15,21,2,0.8,3);
	-- receipt_id=4
    insert into items value(16,17,1,1,4);
	insert into items value(17,18,3,1,4);
	insert into items value(18,19,5,0.9,4);
	insert into items value(19,20,4,1,4);
	insert into items value(20,21,1,1,4);
    
    -- receipt_id=5
	insert into items value(21,17,1,1,5);
	insert into items value(22,18,3,1,5);
    -- receipt_id=6
	insert into items value(23,45,1,1,6);
	insert into items value(24,32,3,1,6);
    -- receipt_id=7
	insert into items value(25,1,10,0.8,7);
    -- receipt_id=8
	insert into items value(26,43,1,1,8);
	insert into items value(27,12,3,1,8);
	insert into items value(28,32,5,0.9,8);
	insert into items value(29,65,4,1,8);
	insert into items value(30,21,1,1,8);
    -- receipt_id=9
	insert into items value(31,21,5,0.85,9);
	insert into items value(32,10,4,1,9);
	insert into items value(33,11,1,1,9);
    -- receipt_id=10
	insert into items value(34,76,1,1,10);











