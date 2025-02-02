SELECT 
    DATENAME(WEEKDAY, o.created_at) AS day_of_week, 
    SUM(o.quantity * i.item_price) AS total_sales
FROM 
    orders o
JOIN 
    items i 
ON 
    o.item_id = i.item_id
GROUP BY 
    DATENAME(WEEKDAY, o.created_at)
ORDER BY 
    total_sales DESC;