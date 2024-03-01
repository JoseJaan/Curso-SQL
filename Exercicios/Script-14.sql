--Averiguar se existe uma correlação na satisfação do cliente e a eficiência na entrega dos pedidos?
WITH AUX AS(
SELECT 
	oord.review_score,
	JULIANDAY(ood.order_delivered_customer_date) - JULIANDAY(ood.order_purchase_timestamp) AS qtd_dias_transporte
FROM 	
	olist_order_reviews_dataset oord
LEFT JOIN
	olist_orders_dataset ood
	ON
	ood.order_id = oord.order_id
WHERE 
	review_score <> ''
	AND ood.order_delivered_customer_date <> ''
	AND ood.order_purchase_timestamp <> ''
)
SELECT 
	review_score,
	ROUND(AVG(qtd_dias_transporte),2) AS media_qtd_dias_transporte
FROM 
	AUX
GROUP BY 
	review_score
ORDER BY
	media_qtd_dias_transporte DESC	
	
	