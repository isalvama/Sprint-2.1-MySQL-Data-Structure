    SELECT SUM(pizzeria.command_group.quantity)
    FROM pizzeria.command_group cg
    JOIN pizzeria.product p
    ON cg.product_id = p.id
    JOIN pizzeria.category c ON p.category_id = c.id
    JOIN pizzeria.command com ON cg.command_id = com.id
    JOIN pizzeria.store st ON com.store_id = st.id
    JOIN pizzeria.town t ON st.town_id = t.id
    WHERE c.name = 'drinks' AND t.name = 'Barcelona';

SELECT COUNT(com.id)
FROM pizzeria.command com
JOIN pizzeria.employee e ON com.cooker_id = e.id OR com.deliverer_id = e.id
WHERE e.id = 4;