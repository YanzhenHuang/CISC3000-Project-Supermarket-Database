-- Input product id, inventory id, and amount of import respectively, to realize the importing process.
delimiter $$
create procedure import_product (in input_prod_id int(13),in input_inv_id int,in value int)
		begin
				update prod_invent set in_amount=in_amount+value
                where prod_id=input_prod_id and inv_id=input_inv_id;
		end$$
delimiter ;

call import_product (1,1,5);

-- For Checking.
select product.prod_id, prod_name, inv_id,in_amount 
from product, prod_invent 
where product.prod_id=prod_invent.prod_id;