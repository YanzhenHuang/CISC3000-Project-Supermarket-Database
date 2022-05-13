create table inventory (
	inv_id INT(3) NOT NULL,
    address VARCHAR(255),
    i_tot_cap INT NOT NULL DEFAULT 1000,
    primary key(inv_id),
    check (i_tot_cap>=0)	-- Total capacity can't be negative.
);

-- DESCRIPTION:
	-- There are totally 5 inventories, with inv_id ranging from 1 to 5, located in different address of cities.
	-- Each of them has a total capacity of 1000.



-- FUNCTIONALITIES:
	-- View All Inventories with its ID
    -- Note: For more functionalities refering to inventory, please see other files.
	select *
    from inventory;



-- VALUE INSERTIONS
INSERT INTO inventory VALUES(001,'Brookln Street 013',1000);
INSERT INTO inventory VALUES(002,'Downtown Street 010',1000);
INSERT INTO inventory VALUES(003,'Grove Street 004',1000);
INSERT INTO inventory VALUES(004,'Fugging Street 032',1000);
INSERT INTO inventory VALUES(005,'Fugging Street 032',1000);
insert into inventory values(006,'Neon 001',1000);
INSERT INTO inventory VALUES(007,'1600 Pennsylvania Ave NW，Washington，DC 20500',1000);
INSERT INTO inventory VALUES(008,'First St SE, Washington, DC 20004',1000);
INSERT INTO inventory VALUES(009,'Denmark Street 010',1000);
INSERT INTO inventory VALUES(010,'Chinatown 001',1000);
INSERT INTO inventory VALUES(011,'Another Street 030',1000);

