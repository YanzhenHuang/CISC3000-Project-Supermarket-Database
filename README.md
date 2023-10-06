# Supermarket_Database

## This is a school project.

## Author: Huang Yanzhen

Please Create table using the following sequence:

```mysql
area,
category,
inventory,
job,
shelf,
product,
employee,
receipt,
emp_area,
emp_invent,
items,
prod_shelf,
prod_invent.
```

Enjoy!

## This is just a school project!

I. In practice, products aren't recorded in a specific way. In most cases, when we mention
"a product", we are actually implying "a type of product". The "type" is not its category, but its identifiability given by its product id. A type of product is a unit of some same products, often appears with an amount.

II. This database aims at recording instead of manipulating transactions. Thus, some restrictions is not added. For example, the total stored amount in an inventory shouldn't exceed its total capacity, and it seems that a constraint is needed. However, in this database, according to our design, it is after the importing process is done until the inventory manager enters the data. In other words, if the import would lead to the exceeding of total capacity, the entire process wouldn't be done at the first place on the human level.
