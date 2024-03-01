--Encontrar o total de venda por mês
SELECT 
	strftime ('%Y', order_approved_at) AS ano,
	strftime ('%m', order_approved_at) As mes,
	count(*) AS total_vendas
FROM 
	olist_orders_dataset ood
WHERE 
	ood.order_status = 'delivered'
	AND ano IS NOT NULL
GROUP BY ano, mes
ORDER BY ano, mes	
	