--Encontrar a taxa de repetição de compra dos clientes
WITH TBL_AUX AS (
	SELECT 	
		--ooid.order_id,
		ooid.product_id,
		ood.customer_id,
		COUNT(ooid.product_id) AS numero_compras
	FROM 
		olist_order_items_dataset ooid 
	LEFT JOIN
		olist_orders_dataset ood 
		ON
		ood.order_id = ooid.order_id
	GROUP BY 
		ood.customer_id, ooid.product_id
),
TBL_AUX_2 AS (
	SELECT 
		customer_id,
		SUM(numero_compras) AS total_produtos_comprados,
		SUM(CASE WHEN numero_compras = 1 THEN numero_compras ELSE 0 END) num_compras_1,
		SUM(CASE WHEN numero_compras > 1 THEN numero_compras ELSE 0 END) num_compras_mais_1
	FROM 
		TBL_AUX
	GROUP BY 
		customer_id
)
SELECT 
	customer_id,
	total_produtos_comprados,
	num_compras_mais_1,
	ROUND(num_compras_mais_1*1.0/total_produtos_comprados,2) AS taxa_produtos_repetidos
FROM 
	TBL_AUX_2
ORDER BY
	taxa_produtos_repetidos DESC, total_produtos_comprados DESC