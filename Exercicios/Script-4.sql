--Mostrar pedidos feitos em uma determinada cidade
SELECT 
	*
FROM 
	olist_orders_dataset ood  
LEFT JOIN
	olist_customers_dataset ocd 
	ON
		ood.customer_id = ocd.customer_id
	LEFT JOIN 
		olist_order_items_dataset ooid 
		ON 
			ood.order_id = ooid.order_id 
WHERE 
	customer_city = 'campo belo'
	