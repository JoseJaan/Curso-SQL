--Encontrar quantos vendedores estão localizados em cada estado
SELECT
	seller_state,
	COUNT(seller_state) AS Numero_vendedores 
FROM 
	sellers s 
GROUP BY 
	seller_state
ORDER BY	
	Numero_vendedores DESC