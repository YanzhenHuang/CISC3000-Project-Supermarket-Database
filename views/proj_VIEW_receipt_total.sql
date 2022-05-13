
-- This view provides a birds-eye view of every receipt.
create view receipt_total as
	select receipt.receipt_id,receipt_time,concat("$",cast(SUM(product.sell_price*items.sell_amount*discount) as decimal(38,2))) as tot_price, name Cashier
	from items JOIN product, receipt, employee
	where items.prod_id=product.prod_id and items.receipt_id=receipt.receipt_id and receipt.emp_id=employee.emp_id
	group by receipt.receipt_id;

select * from receipt_total;
