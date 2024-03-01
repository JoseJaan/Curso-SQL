--Conta a quantidade de pedidos por estado
SELECT 
	customer_state AS UF,
	count(order_id) AS cont_pedidos
FROM 
	olist_orders_dataset ood 
LEFT JOIN 	
	olist_customers_dataset ocd 
	ON 
		ood.customer_id = ocd.customer_id
GROUP BY 
	customer_state 
ORDER BY 	
	cont_pedidos DESC
