--Mostrar quantas categorias únicas de produtos existem
SELECT 
	DISTINCT product_category_name 
FROM 
	olist_products_dataset opd 
WHERE 
	product_category_name IS NOT NULL 
	AND product_category_name <> ''
ORDER BY 
	product_category_name 
