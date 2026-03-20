INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('aa@gmail.com', 'alba_alvarez', 'ieugfiwruf', '2000-11-02', 'she', 'Spain', 08728, '2015-04-03 15:45:12');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, register_date)
VALUES ('al@gmail.com', 'alex_levin', 'iuwekghfw', '1980-02-03', 'he', 'US', '2016-03-11 15:45:12');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('carla.styles@yahoo.com', 'carla_fashion', 'pwd_carla_95', '1995-05-20', 'she', 'France', '75001', '2018-06-12 09:30:00');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('mark.dev@outlook.com', 'mark_developer', 'safe_pass_2024', '1988-12-01', 'he', 'Germany', '10115', '2020-01-05 14:20:10');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('sophie.m@gmail.com', 'sophie_music', 'music_islife', '2002-07-14', 'they', 'UK', 'SW1A1AA', '2021-11-30 22:00:00');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('luca.b@libero.it', 'luca_italy', 'pasta_pizza92', '1992-03-30', 'he', 'Italy', '00118', '2017-08-15 11:11:11');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('nina.v@gmail.com', 'nina_vibe', 'vibe_check_99', '1999-09-09', 'she', 'Brazil', '01001-000', '2019-12-31 23:59:59');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('tech_fan@gmail.com', 'gadget_guru', 'gadget_fanatic', '1985-04-12', 'he', 'Japan', '100-0001', '2022-05-20 08:45:00');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('elena_rocks@gmail.com', 'elena_r', 'rockstar_88', '1988-11-25', 'she', 'Spain', '28001', '2014-10-10 17:30:00');

INSERT INTO spotify.user(email, username, password, birth_date, gender, country, postal_code, register_date)
VALUES ('ocean_blue@icloud.com', 'sam_waves', 'surf_the_world', '1996-01-18', 'they', 'Australia', '2000', '2023-08-22 13:15:20');


INSERT INTO spotify.payment_method (user_id, registration_date) VALUES (1, '2023-01-10 10:00:00'); -- ID 1
INSERT INTO spotify.payment_method (user_id, registration_date) VALUES (2, '2023-02-15 11:30:00'); -- ID 2
INSERT INTO spotify.payment_method (user_id, registration_date) VALUES (3, '2023-03-20 09:15:00'); -- ID 3
INSERT INTO spotify.payment_method (user_id, registration_date) VALUES (4, '2023-04-05 18:45:00'); -- ID 4

INSERT INTO spotify.credit_card (id, credit_card_number, security_code, expiration_date, owner_name)
VALUES (1, 1234567812345678, X'313233', '2028-12-01', 'Alba Alvarez');
INSERT INTO spotify.credit_card (id, credit_card_number, security_code, expiration_date, owner_name)
VALUES (2, 8765432187654321, X'343536', '2027-05-01', 'Alex Levin');

INSERT INTO spotify.paypal_account (id, email, password)
VALUES (3, 'carla_pay@gmail.com', X'70617373776f7264313233');
INSERT INTO spotify.paypal_account (id, email, password)
VALUES (4, 'mark_pay@gmail.com', X'6d61726b5f736563757265');

INSERT INTO spotify.subscription (payment_method_id, user_id, start_date) VALUES (1, 1, '2024-01-01 12:00:00');
INSERT INTO spotify.subscription (payment_method_id, user_id, start_date) VALUES (3, 3, '2024-02-10 15:30:00');


INSERT INTO spotify.artist (name, image) VALUES ('Rosalía', X'696d675f726f73616c6961'); -- ID 1
INSERT INTO spotify.artist (name, image) VALUES ('Quevedo', X'696d675f7175657665646f'); -- ID 2
INSERT INTO spotify.artist (name, image) VALUES ('Bad Bunny', X'696d675f62616462756e6e79'); -- ID 3

INSERT INTO spotify.album (name, artist_id, image) VALUES ('MOTOMAMI', 1, X'636f7665725f6d6f746f'); -- ID 1
INSERT INTO spotify.album (name, artist_id, image) VALUES ('DONDE QUIERO ESTAR', 2, X'636f7665725f647165'); -- ID 2
INSERT INTO spotify.album (name, artist_id, image) VALUES ('Un Verano Sin Ti', 3, X'636f7665725f75767374'); -- ID 3

INSERT INTO spotify.song (name, artist_id, album_id, duration_seconds, number_times_played)
VALUES ('SAOKO', 1, 1, 137, 5000000); -- ID 1
INSERT INTO spotify.song (name, artist_id, album_id, duration_seconds, number_times_played)
VALUES ('Columbia', 2, 2, 192, 8500000); -- ID 2
INSERT INTO spotify.song (name, artist_id, album_id, duration_seconds, number_times_played)
VALUES ('Tití Me Preguntó', 3, 3, 243, 12000000); -- ID 3

INSERT INTO spotify.playlist (title, user_id, creation_date) VALUES ('My Summer Hits', 1, '2024-06-01 10:00:00'); -- ID 1
INSERT INTO spotify.playlist (title, user_id, creation_date) VALUES ('Focus Work', 2, '2024-06-05 09:00:00'); -- ID 2

INSERT INTO spotify.playlist_song (playlist_id, song_id, user_included_id) VALUES (1, 2, 1);
INSERT INTO spotify.playlist_song (playlist_id, song_id, user_included_id) VALUES (1, 3, 1);
INSERT INTO spotify.playlist_song (playlist_id, song_id, user_included_id) VALUES (2, 1, 2);

INSERT INTO spotify.user_artist (user_id, artist_id) VALUES (1, 1); -- Alba sigue a Rosalía
INSERT INTO spotify.user_artist (user_id, artist_id) VALUES (2, 3); -- Alex sigue a Bad Bunny

INSERT INTO spotify.artist_artist (follower_id, followed_id) VALUES (2, 3); -- Quevedo sigue a Bad Bunny

INSERT INTO spotify.user_album_favorites(user_id, album_id) VALUES (3, 1); -- Carla guarda MOTOMAMI

INSERT INTO spotify.user_song_favorites(user_id, song_id) VALUES (1, 2);
INSERT INTO spotify.user_song_favorites (user_id, song_id) VALUES (4, 3);