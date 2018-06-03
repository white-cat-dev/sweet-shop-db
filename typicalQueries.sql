
/* Примеры типовых операций для работы с базой данных */


/* Создание нового торта  */

/* Добавление картинки для торта */ 
INSERT INTO `images` (`alt`, `path`, `created_at`) VALUES  
	('Торт «Три шоколада»', 'chololate3.png', NOW());

/* Добавление торта */     
INSERT INTO `cakes` (`title`, `weight`, `description`, `image_id`, `price`, `created_at`, `updated_at`) VALUES   
	('Торт «Три шоколада»', 1.89, 'Торт из шоколадного коржа, 3 видов мусса, украшенный шоколадной глазурью со свежими ягодами.', 10, 490, NOW(), NOW());  

/* Определение ингредиентов и их количества для торта */  
INSERT INTO `cake_ingredient` (`cake_id`, `ingredient_id`, `quantity`) VALUES   
	(7, 1, 400.00),  
	(7, 2, 1150.00),   
	(7, 3, 250.00);


/* Обновление количества ингредиентов в наличии */

UPDATE `ingredients` SET `count` = 30.00 WHERE `id` = 5;


/* Регистрация нового клиента */

INSERT INTO `clients` (`name`, `middle_name`, `last_name`, `phone_number`, `email`, `birth_date`, `created_at`, `updated_at`) VALUES 
	('Юлия', 'Михайловна', 'Юшкевич', '89654734512', 'yulya@mail.ru', '1990-08-21', NOW(), NOW());


/* Создание нового заказа */

/* Добавление заказа */
INSERT INTO `orders` (`client_id`, `execution_date`, `status`, `comment`, `cost`, `created_at`, `updated_at`) VALUES 
	(5, '2018-06-10 16:00:00', 1, '', 900, NOW(), NOW());

/* Определение состава заказа */
INSERT INTO `cake_order` (`order_id`, `cake_id`, `quantity`) VALUES 
	(5, 1, 2);


/* Изменение статуса заказа */

UPDATE `orders` SET `status` = 2 WHERE `id` = 1;


/* Добавление нового отзыва */

/* С привязкой к определенному торту */
INSERT INTO `reviews` (`client_id`, `cake_id`, `image_id`, `review`, `created_at`) VALUES 
    (3, 2, 12, 'Очень вкусный торт с оригинальным дизайном.', NOW());

/* Общий отзыв (без привязки к определенному торту)  */
INSERT INTO `reviews` (`client_id`, `cake_id`, `image_id`, `review`, `created_at`) VALUES 
    (5, NULL, NULL, 'Замечательная кондитерская! Заказываю тортики только тут.', NOW());
