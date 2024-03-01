--Potuação (avaliação do cliente) média das categorias de produtos
--Apenas considera pedidos com uma única categoria (é possível comprar diferentes produtos ao mesmo tempo e enviar a mesma avaliação)
SELECT 
	AVG(review_score) AS Media,
	product_category_name AS Produto
FROM
	olist_order_items_dataset ooid 
LEFT JOIN
	olist_order_reviews_dataset oord  
	ON 
		oord.order_id = ooid.order_id
LEFT JOIN 	
	olist_products_dataset opd 
	ON
		ooid.product_id = opd.product_id 
WHERE 
	ooid.order_item_id = 1 
GROUP BY 
	product_category_name
ORDER BY 
	Media DESC