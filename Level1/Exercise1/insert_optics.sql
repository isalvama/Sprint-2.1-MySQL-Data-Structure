INSERT INTO opticsculdampolla.supplier(nif, name, street, street_number, city, postal_code, country, phone_number) VALUES ('A12345A', 'supplier Chen', 'carrer Pujades', 12, 'Barcelona', 08000,'Spain',  678901234);
INSERT INTO opticsculdampolla.supplier(nif, name, street, street_number, city, postal_code, country, phone_number) VALUES ('A12366B', 'supplier Song', 'carrer Pujades', 32, 'Barcelona', 08001,'Spain',  672301234);

INSERT INTO opticsculdampolla.brand(name, supplier_id)
VALUES ('Prada', 1);
INSERT INTO opticsculdampolla.brand(name, supplier_id)
VALUES ('Afflelou', 2);
INSERT INTO opticsculdampolla.brand(name, supplier_id)
VALUES ('Dior', 2);

INSERT INTO opticsculdampolla.glasses(brand_id, prescription_left, prescription_right, frame_type, frame_color, glass_color, price)
    VALUES (1, 0.55, 0.90, 'plastic', 'blue', 'transparent', 150);
INSERT INTO opticsculdampolla.glasses(brand_id, prescription_left, prescription_right, frame_type, frame_color, glass_color, price)
    VALUES (2, 1.2, 1, 'metallic', 'grey', 'brown', 70);
INSERT INTO opticsculdampolla.glasses(brand_id, prescription_left, prescription_right, frame_type, frame_color, glass_color, price)
    VALUES (3, 1.5, 1.2,'floating', 'brown', 'black', 190);
INSERT INTO opticsculdampolla.glasses(brand_id, prescription_left, prescription_right, frame_type, frame_color, glass_color, price)
    VALUES (3, 1.0, 0.5,'floating', 'white', 'trnasparent', 170);

INSERT INTO opticsculdampolla.employee(nif, name, surname) VALUES ('12345678Y', 'Joe', 'Dwight');
INSERT INTO opticsculdampolla.employee(nif, name, surname) VALUES ('12345672Y', 'Paul', 'McDougall');
INSERT INTO opticsculdampolla.employee(nif, name, surname) VALUES ('12345674Y', 'Alex', 'Riegner');
INSERT INTO opticsculdampolla.employee(nif, name, surname) VALUES ('12345675Y', 'Ryan', 'Levin');

INSERT INTO opticsculdampolla.customer(name, street, street_number, city, postal_code, country, phone_number)
VALUES ('Alex', 'Aragon street', 11, 'Barcelona', 08012, 'Spain', 654321689);
INSERT INTO opticsculdampolla.customer(name, street, street_number, city, postal_code, country, phone_number, recommender_costumer_id)
VALUES ('Roberto', 'Alava street', 40, 'Barcelona', 08009, 'Spain', 654341889, 1);
INSERT INTO opticsculdampolla.customer(name, street, street_number, city, postal_code, country, phone_number, recommender_costumer_id)
VALUES ('Paula', 'Valencia street', 300, 'Barcelona', 08003, 'Spain', 654251889, 1);
INSERT INTO opticsculdampolla.customer(name, street, street_number, city, postal_code,country,  phone_number)
VALUES ('Maria', 'Madrid street', 3, 'Barcelona', 08010, 'Spain', 654891889);

INSERT INTO opticsculdampolla.sale(glasses_id, seller_employee_id, costumer_id) VALUES (1, 2, 1);
INSERT INTO opticsculdampolla.sale(glasses_id, seller_employee_id, costumer_id) VALUES (2, 2, 3);
INSERT INTO opticsculdampolla.sale(glasses_id, seller_employee_id, costumer_id) VALUES (3, 1, 2);
INSERT INTO opticsculdampolla.sale(glasses_id, seller_employee_id, costumer_id) VALUES (4, 3, 4);

