
/* Создание таблиц базы данных "Кондитерская" */


CREATE TABLE `cakes` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(100) NOT NULL,
	`weight` DECIMAL(4,2) NOT NULL,
	`description` VARCHAR(300) NOT NULL,
	`image_id` INT UNSIGNED,
	`price` INT UNSIGNED NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	INDEX (`title`)
);


CREATE TABLE `ingredients` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NOT NULL,
	`units` VARCHAR(30) NOT NULL,
	`count` DECIMAL(8,2) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	INDEX (`title`)
);


CREATE TABLE `cake_ingredient` (
	`cake_id` int NOT NULL,
	`ingredient_id` int NOT NULL,
	`quantity` DECIMAL(6,2) NOT NULL,
	INDEX (`cake_id`),
	INDEX (`ingredient_id`)
);


CREATE TABLE `clients` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`middle_name` VARCHAR(50),
	`last_name` VARCHAR(50),
	`phone_number` VARCHAR(11) NOT NULL,
	`email` VARCHAR(100),
	`birth_date` DATE,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE (`email`),
	UNIQUE (`phone_number`),
	INDEX (`name`),
	INDEX (`last_name`)
);


CREATE TABLE `orders` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`client_id` INT UNSIGNED NOT NULL,
	`execution_date` TIMESTAMP NOT NULL,
	`status` INT UNSIGNED NOT NULL,
	`comment` VARCHAR(300) NOT NULL,
	`cost` INT UNSIGNED NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	INDEX (`execution_date`),
	INDEX (`status`)
);


CREATE TABLE `cake_order` (
	`order_id` int NOT NULL,
	`cake_id` int NOT NULL,
	`quantity` int NOT NULL,
	INDEX (`order_id`),
	INDEX (`cake_id`)
);


CREATE TABLE `images` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`alt` VARCHAR(50) NOT NULL,
	`path` VARCHAR(100) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);


CREATE TABLE `reviews` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`client_id` INT UNSIGNED NOT NULL,
	`cake_id` INT UNSIGNED,
	`image_id` INT UNSIGNED,
	`review` VARCHAR(300) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	INDEX (`cake_id`)
);