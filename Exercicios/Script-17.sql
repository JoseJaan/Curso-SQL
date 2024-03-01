--Encontrar, para cada vendedor, qual o tempo médio de entrega p/ a transportadora e como eles se classificam em seus estados com base nesse critério
WITH aux_vendedores AS (
	SELECT 
		--ood.order_id,
		ooid.seller_id,
		COUNT(*) AS ctn_pedidos,
		AVG(JULIANDAY(ood.order_delivered_carrier_date) - JULIANDAY(ood.order_purchase_timestamp)) AS AVG_DIAS_POSTAGEM
	FROM 
		olist_orders_dataset ood 
	LEFT JOIN(
		SELECT
			order_id,
			MAX(seller_id) AS seller_id
		FROM
			olist_order_items_dataset ooid 
		GROUP BY
			order_id
		) ooid ON
		ood.order_id = ooid.order_id
	WHERE 
		order_delivered_carrier_date  <> ''
		AND order_purchase_timestamp <> ''
		AND seller_id IS NOT NULL
		AND ood.order_delivered_carrier_date >= ood.order_purchase_timestamp
	GROUP BY 
		ooid.seller_id
), AUX AS(
	SELECT
		s.seller_state,
		AV.seller_id,
		AV.AVG_DIAS_POSTAGEM,
		AV.ctn_pedidos,
		RANK() OVER (PARTITION BY seller_state ORDER BY AVG_DIAS_POSTAGEM ASC) AS RK
	FROM 
		aux_vendedores AS AV
	LEFT JOIN 
		sellers s ON s.seller_id = AV.seller_id
	WHERE 	
		ctn_pedidos > 10
)
SELECT 
	*
FROM 
	AUX
WHERE 
	seller_state LIKE 'BA'
	