create table product(
	prod_id INT(13),
    prod_name VARCHAR(255),
    in_price INT NOT NULL DEFAULT 0,
    sell_price INT NOT NULL DEFAULT 0,
    cat_id INT(2) NOT NULL DEFAULT 00,	-- Please read description in proj_category.sql 
    primary key (prod_id),
    foreign key (cat_id) references category(cat_id),
    check (in_price>=0 AND sell_price>=0)	-- Prices shouldn't be negative.
);
	alter table product add properties JSON;-- Added a 'Property' column to store more detailed property of a product using JSON. See below.



-- DESCRIPTIONS:
	-- There are totally 84 products from different categories, some have properties.
		select count(*) from product;


-- FUNCTIONALITIES:

	-- View Every Product, with its selling price and category. (Further Becomes a View):
	select prod_id 'EAN-13', prod_name 'product name', concat("$",cast(sell_price as decimal(38,2))) 'price',cat_name 'category'
	from product join category using (cat_id)
	order by prod_id;

	-- View Profit of selling each product. (Further Becomes a View):
	select prod_id 'EAN-13', prod_name 'product name', concat("$",cast(sell_price-in_price as decimal(38,2))) 'profit',cat_name 'category'
	from product, category
	where product.cat_id=category.cat_id
	order by prod_id;

	-- View Average Price of a Paticular type of product that is over $40. (Further Becomes a View):
	select category.cat_id 'number', concat("$",cast(avg(sell_price) as decimal(38,2))) 'average', cat_name 'category'
	from product, category
	where product.cat_id=category.cat_id
	group by category.cat_id
	having avg(sell_price)>40
	order by avg(sell_price) desc;

    
    -- Extract Values of properties (using JSON):
        
		-- View Products that has properties:
    select *
    from product
    where properties IS NOT NULL;
    
		-- Get weight of a product:
    select prod_id, json_extract(properties,'$.weight') 'weight'
    from product
    where prod_id=54;
    
		-- Get weight of a product (simpler way):
	select prod_id, properties -> '$.weight' 'weight'
    from product
    where prod_id=54;
    
		-- Get dimensions of a product (which is stored as an array in JSON):
	select prod_id, properties -> '$.dimensions[0]' 'x',properties -> '$.dimensions[1]' 'y', properties -> '$.dimensions[2]' 'z'
    from product
    where prod_id=54;
    
		-- Get manufacturer name of a product (which is stored as a nested object in JSON):
    select prod_id, properties ->> '$.manufacturer.name' as 'manufacturer'	-- Get string without comma
    from product
    where prod_id=54;


-- ----------------Value Insertion --------------------

	-- Some aquatics (cat_id=1) 水产
	insert into product values(24,'Norway Samon',40,57,1);
	insert into product values(25,'River Fish',32,45,1);
	insert into product values(27,'Hokkaido Squid',45,51,1);

	-- Some livestocks (cat_id=2) 畜类产品
	insert into product values(6,'Texas Chicken',12,23,2);
	insert into product values(7,'American Pork',45,51,2);
	insert into product values(8,'Chinese Pork',32,41,2);
	insert into product values(9,'American Beef',70,89,2);
	insert into product values(10,'Korean Pork',22,25,2);
	insert into product values(11,'Mongolian Mutton',78,90,2);
	insert into product values(12,'Mongolian Beaf',79,102,2);
	insert into product values(13,'Chinese Duck',47,56,2);
	insert into product values(14,'Australian Kangaroo',90,127.25,2);

	-- Some fruits (cat_id=3) 水果蔬菜
	insert into product values(15,'Fuji Red Apple',5,10,3);
	insert into product values(16,'Local Carrot',4,7,3);
	insert into product values(28,'West Tomato',5,9,3);
	insert into product values(29,'Chinese Celery',8,12,3);
	insert into product values(48,'Ima Potato',7,12,3);
	insert into product values(49,'Ima Orange',7,12,3);
	insert into product values(50,'Local Banana',5,8,3);
	insert into product values(51,'Vietnamese Lemon',6,8,3);
	insert into product values(55,'Peashooter',9,10,3);
	insert into product values(56,'Xinjiang Grape',18,24,3);
	insert into product values(58,'Jane\'s Mango',23,28,3);
	insert into product values(74,'Never Gonna Give you Up',78,91,3);
	insert into product values(75,'Avocado',9,12,3);

	-- Some Dailies (cat_id=4) 日常用品
	insert into product values(31,'Shuya sanitary napkin',13,25,4);
	insert into product values(32,'Cutton swab',12,15,4);
	insert into product values(33,'Tooth Brush (3 in 1)',4,9,4);
	insert into product values(34,'Tooth Paste',10,14,4);
	insert into product values(35,'Plumbus',17,30,4);
	insert into product values(36,'Towel',18,23,4);
	insert into product values(37,'Mug',19,29,4);
	insert into product values(38,'Coffee Spoon (Medal)',17,30,4); 
	insert into product values(39,'Flowerpot',19,25,4);
	insert into product values(45,'Peppa Pig Blanket',45,69,4);
	insert into product values(46,'Haifeisi Shampoo',50,89,4);

	-- Some Households (cat_id=5) 家用电器与电子产品
	insert into product values(40,'iPhone 13 Pro Max 512GB',4500,7899,5);
	insert into product values(41,'iPad Pro M1 512GB',5600,8900,5);
	insert into product values(42,'MacBook Pro 2021 1TB',5800,20000,5);
	insert into product values(43,'Xiaomi 11 Pro',2300,4900,5);
	insert into product values(44,'DJI Mavic 3',5890,12800,5);
	insert into product values(52,'Matsushita Washing Machine',8900,18900,5);
	insert into product values(53,'Samsung Fridge',9800,23000,5);
	insert into product values(54,'Xiaomi Television',5790,9800,5);
	insert into product values(59,'Toilet',5400,19000,5);
	insert into product values(60,'Xiaomi Lamp',67,190,5);
	insert into product values(61,'Expert Audio',890,1900,5);
	insert into product values(62,'Mac Studio 2TB',19000,35000,5);
	insert into product values(81,'Apple Watch Series 6',1000,4590,5);
	  
	-- Some Offices (cat_id=6) 办公用品
	insert into product values(17,'ChenGuang Folder',4,8,6);
	insert into product values(18,'ChenGuang Diary Notebook',7,12,6);
	insert into product values(19,'ChenGuang Paper Clip (100 in one pack)',10,23,6);
	insert into product values(20,'ChenGuang Pen (black)',2,5,6);
	insert into product values(21,'ChenGuang Pen (Red)',2,5,6);
	insert into product values(22,'ChenGuang Pen (Blue)',2,5,6);

	-- Some Snacks (cat_id=7) 零食
	insert into product values(1,'Kit-kat Chocolate Bar Original Flavour',5,8,7);
	insert into product values(2,'Kit-kat Chocolate Bar Wasabi Flavour',5,8.5,7);
	insert into product values(3,'Kit-kat Chocolate Bar Strawberry Flavour',5,8.5,7);
	insert into product values(4,'Kit-kat Chocolate Bar Banana Flavour',5,9,7);
	insert into product values(5,'Kit-kat Chocolate Bar Yangzhou Chaofan Flavour',5,15,7);

	-- Some Bakeries (cat_id=8) 烘焙制品
	insert into product values(47,'Christmas Ginger Bread',76,87,8);
	insert into product values(63,'French Toast',12,21,8);
	insert into product values(64,'Scotland Biscuits 6-pack',25,37,8);
	insert into product values(65,'Uncle John\'s White Bread',23,35,8);
	insert into product values(66,'Andrew\'s Tert',38,46,8);
	insert into product values(67,'Mr.Berry\'s Blue Cheese',34,52,8);
	insert into product values(68,'Lord House Madrid Cookie',29,80,8);
	insert into product values(69,'Korean Rice Bread',12,32,8);
	insert into product values(70,'Japanese Traditional Cake',32,54,8);
	insert into product values(71,'Industry Bread',4,7,8);
	insert into product values(72,'Sweden Cheese',37,67,8);
	insert into product values(73,'Pappa John\'s Onion Bread',43,65,8);


	-- Some Alcohols (cat_id=9) 酒水
	insert into product values(23,'Qingdao Beer',25,32,9);
	insert into product values(26,'Whales Wine',70,121,9);
	insert into product values(30,'Uncle Jerry\'s collection',87,134,9);
	insert into product values(57,'Dawusu',70,113,9);
	insert into product values(82,'Chinese Rice Wine',45,78,9);

	-- Some Kitchens (cat_id=10) 厨房
	insert into product values(76,'Laoganma',47,73,10);
	insert into product values(77,'Japanes Salt',37,74,10);
	insert into product values(78,'Olive Oil',57,80,10);
	insert into product values(79,'Soisauce',40,47,10);
	insert into product values(80,'Sesame Oil',45,76,10);
	insert into product values(83,'Sugar',13,28,10);

	-- Some Weapons (cat_id=11) 武器
	insert into product values(103,'French baguette',38,49,11);


-- Adding Properties to Products using JSON: 
	-- 1
update product
set properties = '
{
	"dimensions":[1,0.3,0.75],
    "weight":11,
    "manufacturer":{"name":"Xiaomi"}
}
'
where prod_id=54;
	-- 2
update product
set properties = '
{
	"dimensions":[1,2,3],
    "weight":10,
    "manufacturer":{"name":"sony"}
}
'
where prod_id=61;
	-- 3
update product
set properties = json_object('dimensions',json_array(0.3,0.3,0.2),
							 'weight',10,
                             'manufacturer',json_object('name','Apple')
                             )
where prod_id=62;

	-- update the weight of the Mac Studio (prod_id=62):
update product
set properties = json_set(
	properties,
    '$.weight', 20,	-- Reset the weight information
    '$.capacity', '2TB'	-- Add a NEW property "capacity", since the product is a computer.
)
where prod_id=62;


select * from product;
