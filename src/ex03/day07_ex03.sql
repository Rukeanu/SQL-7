SELECT pv.name, coalesce(pv.count, 0) + coalesce(po.count, 0)as total_count
FROM
(SELECT pizzeria.name, COUNT(*) AS "count"
FROM person_visits
INNER JOIN pizzeria
ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name) AS pv
FULL JOIN
(SELECT pizzeria.name, COUNT(*) AS "count"
FROM person_order
INNER JOIN menu
ON menu.id = person_order.menu_id
INNER JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name) AS po ON pv.name = po.name
ORDER BY total_count DESC, pv.name ASC;