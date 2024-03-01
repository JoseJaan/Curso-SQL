--Mostrar quantos clientes únicos existem em cada cidade

SELECT 
	customer_city AS City,
	customer_state AS State,
	COUNT(customer_unique_id) AS Customers_count 
FROM 
	olist_customers_dataset ocd 
GROUP BY
	customer_state, 
	customer_city 
ORDER BY 
	Customers_count DESC


	

