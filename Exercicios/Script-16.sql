--Averiguar como as avaliações dos clientes estão relacionadas com o tempo de entrega
WITH AUX AS (
SELECT 
	JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp) AS dias_entrega,
	JULIANDAY(order_estimated_delivery_date) - JULIANDAY(order_purchase_timestamp) AS dias_estimado,
	review_score 
FROM 
	olist_orders_dataset ood
LEFT JOIN
	olist_order_reviews_dataset oord ON oord.order_id = ood.order_id 
WHERE 
	order_delivered_customer_date <> ''
	AND order_estimated_delivery_date <> ''
	AND order_purchase_timestamp <> ''
	AND review_score <> ''
)
SELECT 
	AVG(CASE WHEN dias_estimado >= dias_entrega THEN review_score END) AS avg_dias_superestimado,
	AVG(CASE WHEN dias_estimado < dias_entrega THEN review_score END) AS avg_dias_subestimado
FROM 
	AUX
