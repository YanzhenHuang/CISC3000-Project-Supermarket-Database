create table receipt(
	receipt_id INT(5),
    receipt_time  DATETIME NOT NULL,
    emp_id INT(4) NOT NULL,
    primary key (receipt_id),
    foreign key (emp_id) references employee(emp_id)
);

-- FUNCTIONALITIES:
	-- View all receipts (titles only) <Keep only when receipt is empty>:
	select receipt_id, receipt_time 'time', name 'Cashier'
    from receipt, employee
    where receipt.emp_id=employee.emp_id;

	-- Calculate Total Price for every receipt, with Clerk Name:
	select receipt.receipt_id,receipt_time,concat("$",cast(SUM(product.sell_price*items.sell_amount*discount) as decimal(38,2))) as 'Total Price', name 'Cashier'
	from items JOIN product, receipt, employee
	where items.prod_id=product.prod_id and items.receipt_id=receipt.receipt_id and receipt.emp_id=employee.emp_id
	group by receipt.receipt_id;

	-- Calculate Total Selling price:
	select concat("$",cast(SUM(product.sell_price*items.sell_amount*discount) as decimal (38,2))) as 'total selling price'
	from items join product;


-- VALUE INSERTION
	-- 1
	insert into receipt values (1,"2017-12-25 19:37:00",35);
	-- 2
	insert into receipt values (2,"2017-12-25 20:18:13",37);
	-- 3
	insert into receipt values (3,"2018-1-12 11:17:21",36);
	-- 4
	insert into receipt values (4,"2018-1-12 11:20:23",38);
    -- 5
	insert into receipt values (5,"2018-1-12 11:20:24",36);
    -- 6
	insert into receipt values (6,"2018-1-12 11:24:10",36);
    -- 7
	insert into receipt values (7,"2018-1-12 11:32:41",35);
    -- 8
	insert into receipt values (8,"2018-1-12 12:00:17",38);
    -- 9
	insert into receipt values (9,"2018-1-12 12:03:56",37);
    -- 10
	insert into receipt values (10,"2018-1-12 12:20:23",38);
            



