DROP DATABASE IF EXISTS opticsculdampolla;
CREATE DATABASE opticsculdampolla CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE opticsculdampolla;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier(
    id INT UNSIGNED AUTO_INCREMENT,
    nif VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT UNSIGNED NOT NULL,
    floor SMALLINT UNSIGNED,
    door VARCHAR(10),
    city VARCHAR (100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    fax VARCHAR(50),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS brand;
CREATE TABLE brand(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    supplier_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

DROP TABLE IF EXISTS glasses;
CREATE TABLE glasses(
    id INT UNSIGNED AUTO_INCREMENT,
    brand_id INT UNSIGNED NOT NULL,
    prescription DECIMAL(4,2) UNSIGNED NOT NULL,
    frame_type ENUM('floating', 'plastic', 'metallic') NOT NULL,
    frame_color VARCHAR(20) NOT NULL,
    glass_color VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
        FOREIGN KEY (brand_id) REFERENCES brand(id)

);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    id INT UNSIGNED AUTO_INCREMENT,
    nif VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT UNSIGNED NOT NULL,
    floor SMALLINT UNSIGNED,
    door VARCHAR(20),
    city VARCHAR (100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    recommender_costumer_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (recommender_costumer_id) REFERENCES customer(id)
);

DROP TABLE IF EXISTS sale;
CREATE TABLE sale(
    id INT UNSIGNED AUTO_INCREMENT,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    glasses_id INT UNSIGNED NOT NULL UNIQUE,
    seller_employee_id INT UNSIGNED NOT NULL,
    costumer_id INT UNSIGNED NOT NULL,
    primary key (id),
    FOREIGN KEY (glasses_id) REFERENCES glasses(id),
    FOREIGN KEY (seller_employee_id) REFERENCES employee(id),
    FOREIGN KEY (costumer_id) REFERENCES customer(id)
);


SET FOREIGN_KEY_CHECKS=1;
