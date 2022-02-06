#1.	Write a query to get Product name and quantity/unit.  
Select northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;
#2. Write a query to get current Product list (Product ID and name).  
Select northwind.products.id, northwind.products.product_name FROM northwind.products;
#3. Write a query to get discontinued Product list (Product ID and name). 
select northwind.products.id, northwind.products.product_name
from  northwind.products
where northwind.products.discontinued = 1;
#4. Write a query to get most expense and least expensive Product list (name and unit price).  
SELECT 
    product_name, list_price
FROM
    northwind.products
WHERE
    list_price = (SELECT 
            MAX(list_price)
        FROM
            products)
OR
	list_price = (SELECT
			MIN(list_price)
		FROM
			products);

#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.
  SELECT 
	product_name, id, list_price
  FROM 
	products
  WHERE
	list_price < 20;
#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25. 
 SELECT 
	product_name, id, list_price
  FROM 
	products
  WHERE
	list_price < 25
    AND
    list_price > 15;
#7. Write a query to get Product list (name, unit price) of above average price.  
SELECT Avg(list_price) FROM products;
# This equals 15.84577778

SELECT 
	product_name, list_price
  FROM 
	products
  WHERE
	list_price > 15.84577778;

#8. Write a query to get Product list (name, unit price) of ten most expensive products.  
SELECT product_name, list_price
FROM products
ORDER BY list_price DESC
LIMIT 10;

#9. Write a query to count current and discontinued products. 
SELECT COUNT(*)
FROM northwind.products;
# I was confused by this question because as far as I could tell, there were no items in the discontinued table that were actually diiscontinued. Maybe that just means I accessed the data incorrectly

#10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
SELECT 
	products.product_name AS 'name', inventory_transactions.quantity AS 'stock', purchase_order_details.quantity AS 'order'
FROM products
JOIN inventory_transactions
  ON inventory_transactions.product_id=products.id
JOIN purchase_order_details
  ON purchase_order_details.product_id=products.id
WHERE inventory_transactions.quantity < purchase_order_details.quantity;