--Encontrar qual a diferença média entre a data estimada e a data efetiva de entrega dos pedidos
WITH AUX AS (
SELECT 
	JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp) AS dias_entrega,
	JULIANDAY(order_estimated_delivery_date) - JULIANDAY(order_purchase_timestamp) AS dias_estimado
FROM 
	olist_orders_dataset ood
WHERE 
	order_delivered_customer_date <> ''
	AND order_estimated_delivery_date <> ''
	AND order_purchase_timestamp <> ''
)
SELECT 		
	dias_estimado,
	dias_entrega,
	dias_estimado > dias_entrega
FROM 
	AUX