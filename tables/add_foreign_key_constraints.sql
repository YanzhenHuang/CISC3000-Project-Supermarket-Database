
-- 5.shelf
alter table shelf add constraint  
foreign key (area_id) references area(area_id) 
on update cascade on delete set null;

-- 6.product
alter table product add constraint  
foreign key (cat_id) references category(cat_id) 
on update cascade on delete no action;

-- 7.employee
alter table employee add constraint  
foreign key(job_name) references job(job_name) 
on update cascade on delete set null;

-- 8.receipt
alter table receipt add constraint  
foreign key (emp_id) references employee(emp_id) 
on update no action on delete no action;

-- 9.emp_area
alter table emp_area add constraint  
foreign key (area_id) references area(area_id) on update cascade on delete set null;
alter table emp_area add constraint  
foreign key (emp_id) references employee(emp_id) on update set null on delete set null;

-- 11. items
alter table items add constraint  
foreign key (prod_id) references product(prod_id) on update no action on delete no action;
alter table items add constraint  
foreign key (receipt_id) references receipt(receipt_id) on update cascade on delete no action;

-- 12. prod_shelf
alter table prod_shelf add constraint  
foreign key (prod_id) references product(prod_id) on update no action on delete no action;
alter table prod_shelf add constraint  
foreign key (shelf_id) references shelf(shelf_id) on update no action on delete no action;

-- 13. prod_invent
alter table prod_invent add constraint  
foreign key (prod_id) references product(prod_id) on update no action on delete no action;
alter table prod_invent add constraint  
foreign key (inv_id) references inventory(inv_id) on update no action on delete no action;

select * from prod_invent;

select * from product join category using (cat_id);
select emp_id, name, salary, job_name from employee join job using(job_name);
select * from receipt join employee using(emp_id);
select * from items, product, receipt where items.prod_id=product.prod_id and items.receipt_id=receipt.receipt_id;
select * from prod_shelf;



