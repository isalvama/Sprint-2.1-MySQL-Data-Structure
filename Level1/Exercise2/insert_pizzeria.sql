INSERT INTO pizzeria.country(name) VALUES ('Spain');
INSERT INTO pizzeria.country(name) VALUES ('Portugal');
INSERT INTO pizzeria.country(name) VALUES ('France');

INSERT INTO pizzeria.province(name, country_id) VALUES ('Barcelona', 1);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Madrid', 1);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Valencia', 1);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Paris', 3);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Aquitanie', 3);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Lisbon', 2);
INSERT INTO pizzeria.province(name, country_id) VALUES ('Algarve', 2);

INSERT INTO pizzeria.town(name, province_id) VALUES ('Barcelona', 1);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Hospitalet de Llobregat', 1);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Madrid', 2);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Las Rozas', 2);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Valencia', 3);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Paris', 4);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Bordeaux', 5);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Sintra', 6);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Lisboa', 6);
INSERT INTO pizzeria.town(name, province_id) VALUES ('Lagos', 7);

INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Alex', 'Riegner', 08005, 1, 'Corcega', 102, 2, 1, 567823415);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Paula', 'Gonzalez', 08017, 1, 'Valencia', 123, 3, 2, 643217893);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Maria', 'Perez', 09009, 2, 'Riu', 12, 4, 3, 651223415);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Aldana', 'Cruz', 01005, 3, 'Gran Via', 63, 5, 2, 678223415);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Sara', 'Martinez', 01455, 4, 'Gran Via', 66, 4, 2, 678299915);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Carlos', 'Ruiz', 46001, 5, 'Colon', 45, 2, 1, 612345678);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Jean', 'Dupont', 75001, 6, 'Rue Rivoli', 22, 3, 2, 623456789);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Pierre', 'Martin', 33000, 7, 'Rue Sainte Catherine', 18, 1, 1, 634567891);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Joao', 'Silva', 2710, 8, 'Rua das Padarias', 9, 2, 3, 645678912);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Ana', 'Ferreira', 1100, 9, 'Rua Augusta', 101, 4, 1, 656789123);
INSERT INTO pizzeria.client(name, surname, postal_code, town_id, street, street_number, floor, door, phone_number)
VALUES('Miguel', 'Santos', 8600, 10, 'Rua 25 Abril', 14, 1, 2, 667891234);

INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Ana', 'Martinez', '12345677I', 'cooker');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Paula', 'Perez', '23445677A', 'deliverer');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Alex', 'Galofre', '67845677C', 'cooker');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Pedro', 'Salcedo', '44545677T', 'deliverer');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Ryan', 'Pitts', '33242377G', 'cooker');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Maria', 'Capdevila', '55645677H', 'deliverer');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Carla', 'Paz', '556453677Y', 'waiter');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Anna', 'Ruiz', '55634577Q', 'waiter');
INSERT INTO pizzeria.employee(name, surname, nif, position) VALUES('Pablo', 'Marsal', '35289477O', 'waiter');

INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number, email)
VALUES('Pizzeria Barcelona', 08033, 1, 'Valencia', 33, 567890123, 'pb@pizzeria.com');
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number, email)
VALUES('Pizzeria Valencia', 46001, 5, 'Colon', 12, 567890124, 'pv@pizzeria.com');
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number, email)
VALUES('Pizzeria Madrid', 28001, 3, 'Gran Via', 45, 567890125, 'pm@pizzeria.com');
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number)
VALUES('Pizzeria Lagos', 8600, 10, 'Rua 25 Abril', 8, 567890126);
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number, email)
VALUES('Pizzeria Paris', 75001, 6, 'Rue Rivoli', 20, 567890127, 'pp@pizzeria.com');
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number)
VALUES('Pizzeria Bordeaux', 33000, 7, 'Rue Sainte Catherine', 15, 567890128);
INSERT INTO pizzeria.store(name, postal_code, town_id, street, street_number, phone_number, email)
VALUES('Pizzeria Lisboa', 1100, 9, 'Rua Augusta', 40, 567890129, 'plx@pizzeria.com');

INSERT INTO pizzeria.category(name) VALUES('drinks');
INSERT INTO pizzeria.category(name) VALUES('pizza');
INSERT INTO pizzeria.category(name) VALUES('pasta');
INSERT INTO pizzeria.category(name) VALUES('salad');
INSERT INTO pizzeria.category(name) VALUES('dessert');

INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Fanta', 2.5, 0x89504E470D0A1A0A, 1);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('CocalCola', 2.3, 0x23404E470D0A1A0A, 1);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Water', 2, 0x34504E470D0A1A0A, 1);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza Margarita', 9.5, 0x89504E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza Prosciutto e Fungi', 10.5, 0x78904E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza 4 Formaggio', 10, 0x83454E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza Napoletana', 12.5, 0x34904E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza Veggie', 10.5, 0x1234E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pizza Campesina', 11.5, 0x6784E470D0A1A0A, 2);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pasta Salsa Napoletana', 10.5, 0x89504E470D0A1A0A, 3);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pasta Fungi', 11, 0x89504E470D0A4C0A, 3);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Pasta Pesto', 12, 0x89504E470D0A3B0A, 3);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Macarrons avia', 13.5, 0x89504E466D0A1A0A, 3);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Cesar Salad', 7.5, 0x89504E234D0A1A0A, 4);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Nordic Salad', 9.5, 0x89504C450D0A1A0A, 4);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Brownie', 5.5, 0x89504E492D0A1A0A, 5);
INSERT INTO pizzeria.product(name, price, image, category_id) VALUES ('Tiramisu', 7.5, 0x89504E628D0A1A0A, 5);


INSERT INTO pizzeria.command(type, store_id, client_id, cooker_id, waiter_id)
VALUES ('store', 1, 1, 1, 7);

INSERT INTO pizzeria.command(register_date, type, store_id, client_id, cooker_id, waiter_id)
VALUES ('2026-02-16 12:45:37', 'store', 1, 2, 3, 8);

INSERT INTO pizzeria.command(register_date, type, store_id, client_id, cooker_id, deliverer_id)
VALUES ('2026-01-08 12:45:37', 'take away', 3, 3, 5, 2);

INSERT INTO pizzeria.command(type, store_id, client_id, cooker_id, deliverer_id)
VALUES ('take away', 3, 4, 1, 4);

INSERT INTO pizzeria.command(type, store_id, client_id, cooker_id, deliverer_id)
VALUES ('take away', 2, 5, 3, 6);

INSERT INTO pizzeria.command(type, store_id, client_id, cooker_id, waiter_id)
VALUES ('store', 2, 6, 3, 9);


INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (1, 2, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (1, 4, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (2, 1, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (2, 5, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (2, 6, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (2, 16, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (3, 3, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (3, 7, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (3, 8, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (4, 2, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (4, 9, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (5, 7, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (6, 5, 1);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (6, 6, 2);
INSERT INTO pizzeria.command_group(command_id, product_id, quantity) VALUES (6, 10, 3);

INSERT INTO pizzeria.shipping(command_id, postal_code, town_id, street, street_number, floor, door)
VALUES (3, '09009', 2, 'Riu', 12, 4, '3');

INSERT INTO pizzeria.shipping(command_id, postal_code, town_id, street, street_number, floor, door)
VALUES (4, '01005', 3, 'Gran Via', 63, 5, '2');

INSERT INTO pizzeria.shipping(command_id, postal_code, town_id, street, street_number, floor, door)
VALUES (5, '01455', 4, 'Gran Via', 66, 4, '2');

