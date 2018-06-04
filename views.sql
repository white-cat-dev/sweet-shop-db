
/* Создание представлений для базы данных "Кондитерская" */

/* Полная информация о торте */
CREATE VIEW `cakes_view` AS
SELECT 
	c.`id` cake_id,
	c.`title` cake_title,
	c.`weight` cake_weight,
	c.`description` cake_description,
	im.`path` cake_image,
	c.`price` price,
	c.`created_at` created_at,
	c.`updated_at`updated_at,
	i.`id` ingredient_id,
	i.`title` ingredient_title,
	ci.`quantity` quantity
FROM `cakes` c
JOIN `cake_ingredient` ci ON c.`id` = ci.`cake_id`
JOIN `ingredients` i ON i.`id` = ci.`ingredient_id`
JOIN `images` im ON im.`id` = c.`image_id`;

/* Узнать количество ингредиентов для торта «Фруктовый» */
SELECT `cake_title`, `ingredient_title`, `quantity` 
FROM `cakes_view`
WHERE `cake_title` = "Торт «Фруктовый»";



/* Полная информация о заказе */
CREATE VIEW `order_view` AS
SELECT 
	o.`id`,
	o.`client_id` client_id,
	cl.`name` client_name,
	cl.`phone_number` client_phone_number,
	o.`execution_date` execution_date,
	o.`status` order_status,
	o.`comment` comment,
	o.`cost` cost,
	o.`created_at` created_at,
	o.`updated_at` updated_at,
	c.`id` cake_id,
	c.`title` cake_title,
	co.`quantity`
FROM `orders` o
JOIN `client` cl ON cl.`id` = o.`client_id`
JOIN `cake_order` co ON o.`id` = co.`order_id`
JOIN `cakes` c ON c.`id` = co.`cake_id`;