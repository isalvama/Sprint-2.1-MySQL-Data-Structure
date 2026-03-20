DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pizzeria;

SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS country;
CREATE TABLE country(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS province;
CREATE TABLE province(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    country_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

DROP TABLE IF EXISTS town;
CREATE TABLE town(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    province_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (province_id) REFERENCES province(id)
);

DROP TABLE IF EXISTS client;
CREATE TABLE client(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    town_id INT UNSIGNED NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT NOT NULL,
    floor SMALLINT,
    door VARCHAR(10),
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (town_id) REFERENCES town(id)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    nif VARCHAR(50) NOT NULL UNIQUE,
    position ENUM('cooker', 'deliverer', 'waiter') NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS store;
CREATE TABLE store(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    town_id INT UNSIGNED NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT NOT NULL,
    phone_number VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (town_id) REFERENCES town(id)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(5,2) NOT NULL,
    image BLOB NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

DROP TABLE IF EXISTS command;
CREATE TABLE command(
    id INT UNSIGNED AUTO_INCREMENT,
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type ENUM('take away', 'store') NOT NULL,
    store_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    waiter_id INT UNSIGNED,
    total_price DECIMAL(7,2) NOT NULL DEFAULT 0,
    cooker_id INT UNSIGNED NOT NULL,
    deliverer_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (waiter_id) REFERENCES employee(id),
    FOREIGN KEY (cooker_id) REFERENCES employee(id),
    FOREIGN KEY (deliverer_id) REFERENCES employee(id)
);

DROP TABLE IF EXISTS command_group;
CREATE TABLE command_group(
    id INT UNSIGNED AUTO_INCREMENT,
    command_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity SMALLINT NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (command_id) REFERENCES command(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

DROP TABLE IF EXISTS shipping;
CREATE TABLE shipping(
    id INT UNSIGNED AUTO_INCREMENT,
    arrival_date TIMESTAMP NOT NULL,
    command_id INT UNSIGNED NOT NULL,
    delivery_price FLOAT NOT NULL DEFAULT 0,
    postal_code VARCHAR(20) NOT NULL,
    town_id INT UNSIGNED NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT NOT NULL,
    floor SMALLINT,
    door VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY (command_id) REFERENCES command(id),
    FOREIGN KEY (town_id) REFERENCES town(id)
);

DELIMITER //
DROP TRIGGER IF EXISTS update_command_total_price;
CREATE TRIGGER update_command_total_price
AFTER INSERT ON command_group
FOR EACH ROW
BEGIN
    DECLARE total_price_same_product DECIMAL(10,2);

    SELECT p.price * NEW.quantity
    INTO total_price_same_product
    FROM pizzeria.product p
    WHERE p.id = NEW.product_id;

    UPDATE command c
    SET c.total_price = total_price + total_price_same_product
    WHERE id = NEW.command_id;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER set_default_shipping_arrival_date
    BEFORE INSERT ON shipping
    FOR EACH ROW
BEGIN
    DECLARE register_date_update TIMESTAMP;
    SELECT register_date
    INTO register_date_update
        FROM command c
    WHERE id = NEW.command_id;
    SET NEW.arrival_date = DATE_ADD(register_date_update, INTERVAL 40 MINUTE);

END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER set_shipping_delivery_price
    BEFORE INSERT ON shipping
    FOR EACH ROW
BEGIN
DECLARE updated_total_price DECIMAL(10, 2);

    SELECT total_price
        INTO updated_total_price
        FROM pizzeria.command
            WHERE id = NEW.command_id;

IF updated_total_price <= 15 THEN
    SET NEW.delivery_price = 3;
ELSE
        SET NEW.delivery_price = 0;
    END IF;
END//
DELIMITER ;


SET FOREIGN_KEY_CHECKS=1;

