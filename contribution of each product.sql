SELECT 
    i.item_cat AS category, 
    SUM(o.quantity * i.item_price) AS category_revenue, 
    (SUM(o.quantity * i.item_price) * 100.0 / total.total_revenue) AS percentage_contribution
FROM 
    orders o
JOIN 
    items i 
ON 
    o.item_id = i.item_id
CROSS JOIN (
    SELECT SUM(o.quantity * i.item_price) AS total_revenue
    FROM orders o
    JOIN items i 
    ON o.item_id = i.item_id
) AS total
GROUP BY 
    i.item_cat, total.total_revenue;
