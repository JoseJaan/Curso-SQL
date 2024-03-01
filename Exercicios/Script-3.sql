--Encontrar a média do valor de pedidos feitos em determinada cidade
SELECT 
	AVG(price) AS Media,
	customer_city AS Cidade
FROM 
	olist_order_items_dataset ooid
LEFT JOIN
	olist_orders_dataset ood 
	ON
		ooid.order_id = ood.order_id 
	LEFT JOIN 
		olist_customers_dataset ocd 
		ON ood.customer_id = ocd.customer_id 
WHERE 
	customer_city = 'campo belo'
