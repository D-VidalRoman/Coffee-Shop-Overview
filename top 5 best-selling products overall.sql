SELECT TOP 5
    i.item_name,  
    SUM(o.quantity) AS total_quantity
FROM 
    orders o
JOIN 
    items i 
ON 
    o.item_id = i.item_id
GROUP BY 
    i.item_name
ORDER BY 
    total_quantity DESC;