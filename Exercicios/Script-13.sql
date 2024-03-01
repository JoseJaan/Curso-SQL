--Averiguar se os custos de frete influenciam na decisão de compra do cliente
SELECT 
	CEIL(freight_value),
	COUNT(product_id) AS qtd_vendas
FROM 	
	olist_order_items_dataset ooid
LEFT JOIN
	olist_orders_dataset ood 
	ON
	ood.order_id = ooid.order_id 
WHERE 
	order_status = 'delivered' 
GROUP BY CEIL(freight_value)
ORDER BY 
	qtd_vendas DESC
	