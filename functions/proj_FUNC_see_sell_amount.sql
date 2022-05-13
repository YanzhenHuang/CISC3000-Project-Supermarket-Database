-- Enter product id, find its total selling amount
delimiter $$
create function see_sell_amount(input_prod_id INT)
returns INT
reads sql data
	begin
		declare output_sell_amount INT;
        select sum(sell_amount) into output_sell_amount
        from items
        where prod_id=input_prod_id;
        return output_sell_amount;
	end$$
delimiter ;

-- Call Function
select see_sell_amount(1);
