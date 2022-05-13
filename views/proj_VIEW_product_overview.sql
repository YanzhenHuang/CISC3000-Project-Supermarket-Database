
    
-- This view let manager see through all products and see their price, profits and category.
create view product_overview as
	select prod_id 'EAN-13', prod_name 'product name', concat("$",cast(sell_price as decimal(38,2))) 'price',concat("$",cast(sell_price-in_price as decimal(38,2))) 'profit',cat_name 'category'
	from product join category using (cat_id)
	order by prod_id;
    
    
select * from product_overview;