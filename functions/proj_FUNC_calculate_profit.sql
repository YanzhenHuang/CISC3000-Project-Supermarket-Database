use Supermarket;

delimiter $$
create function calculate_profit (input_cat_id varchar(45))
returns decimal
	reads sql data
		begin
        declare profit decimal;
			select SUM(product.sell_price*items.sell_amount*items.discount)-SUM(product.sell_price) into profit
            from items, product
            where items.prod_id=product.prod_id and product.cat_id=input_cat_id;
		return profit;
        end$$
delimiter ;

select cat_id, calculate_profit(cat_id) as Profit
from category
where calculate_profit(cat_id)>40;

select calculate_profit(10);


select category.cat_name, SUM(product.sell_price*sell_amount*discount)-SUM(product.sell_price) 
from items, product,category
where items.prod_id=product.prod_id and product.cat_id=category.cat_id
group by category.cat_id;