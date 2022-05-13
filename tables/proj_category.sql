create table category(
	cat_id INT(2),
    cat_name VARCHAR(45),
    primary key (cat_id)
);

-- DESCRIPTION:
	-- There are technically 12 categories
    -- Note: The first one is designed to be 'undecided', because that 00 is the default of cat_id in 'product' table.



-- FUNCTIONALITIES:
	-- View All Categories with its ID
    -- Note: For more functionalities refering to category, please see other files.
	select * from category;


-- VALUE INSERTION
	-- Chinese translations of certain categories are provided.
INSERT INTO category values(00,'undecided');	-- see note in description
INSERT INTO category values(01,'aquatics');		-- 水产
INSERT INTO category values(02,'livestocks');	-- 畜类产品
INSERT INTO category values(03,'fruit');
INSERT INTO category values(04,'dailies');		-- 日常用品
INSERT INTO category values(05,'households');	-- 家电/电子产品
insert into category values(06,'offices');
insert into category values(07,'snacks');
insert into category values(08,'bakeries');
insert into category values(09,'alcohol');
insert into category values(10,'kitchens'); -- 厨房用品
insert into category values(11,'weapons');
