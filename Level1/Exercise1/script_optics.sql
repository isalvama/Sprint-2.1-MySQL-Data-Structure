CREATE DATABASE IF NOT EXISTS opticsculdampolla;
USE opticsculdampolla;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier(
    id INT AUTO_INCREMENT,
    nif VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT NOT NULL,
    floor SMALLINT,
    door VARCHAR(20),
    city VARCHAR (100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    fax VARCHAR(50),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS brand;
CREATE TABLE brand(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    supplier_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_brand_supplier
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

DROP TABLE IF EXISTS glasses;
CREATE TABLE glasses(
    id INT UNSIGNED AUTO_INCREMENT,
    brand_id INT NOT NULL,
    prescription FLOAT NOT NULL,
    frame_type ENUM('floating', 'plastic', 'metallic') NOT NULL,
    color VARCHAR(20) NOT NULL,
    glass_color VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_glasses_brand
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

DROP TABLE IF EXISTS costumer;
CREATE TABLE costumer(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number SMALLINT NOT NULL,
    floor SMALLINT,
    door VARCHAR(20),
    city VARCHAR (100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    recommender_costumer_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_recommender_costumer FOREIGN KEY (recommender_costumer_id) REFERENCES costumer(id)
);

DROP TABLE IF EXISTS sale;
CREATE TABLE sale(
    id INT UNSIGNED AUTO_INCREMENT,
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    glasses_id INT NOT NULL UNIQUE,
    seller_employee_id INT NOT NULL,
    costumer_id INT NOT NULL,
    primary key (id),
    CONSTRAINT fk_sale_glasses FOREIGN KEY (glasses_id) REFERENCES glasses(id),
    CONSTRAINT fk_sale_seller_employee FOREIGN KEY (seller_employee_id) REFERENCES employee(id),
    CONSTRAINT fk_sale_costumer FOREIGN KEY (costumer_id) REFERENCES costumer(id)
);


SET FOREIGN_KEY_CHECKS=1;
