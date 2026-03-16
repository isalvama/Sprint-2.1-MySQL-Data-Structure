CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS user;
CREATE TABLE user(
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARBINARY(255) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('he', 'she', 'they') NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL UNIQUE,
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_payment_method_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS credit_card;
CREATE TABLE credit_card(
    id INT UNSIGNED NOT NULL,
    credit_card_number BIGINT NOT NULL UNIQUE,
    security_code VARBINARY(200) NOT NULL,
    expiration_date TIMESTAMP NOT NULL,
    owner VARCHAR(50),
    PRIMARY KEY (id),
    CONSTRAINT fk_credit_card_id FOREIGN KEY (id) REFERENCES payment_method(id)
);

DROP TABLE IF EXISTS paypal_account;
CREATE TABLE paypal_account(
    id INT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARBINARY(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_paypal_account_id FOREIGN KEY (id) REFERENCES payment_method(id)
);

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription(
    id INT UNSIGNED AUTO_INCREMENT,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    renewal_date TIMESTAMP AS (DATE_ADD(start_date, INTERVAL 1 YEAR)) STORED,
    payment_method_id INT NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_subscription_payment_method FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    CONSTRAINT fk_subscription_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS artist;
CREATE TABLE artist(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    image BLOB NOT NULL,
    year DATE NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS album;
CREATE TABLE album(
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    image BLOB NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_artist_id FOREIGN KEY (artist_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS song;
CREATE TABLE song(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    duration_seconds BIGINT NOT NULL,
    number_times_played INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_song_artist FOREIGN KEY (artist_id) REFERENCES artist(id),
    CONSTRAINT fk_song_album FOREIGN KEY (album_id) REFERENCES album(id)
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist(
    id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL DEFAULT 'New Playlist',
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    number_of_songs INT NOT NULL DEFAULT 0,
    user_id INT UNSIGNED NOT NULL,
    removal_date TIMESTAMP,
    is_active boolean AS (removal_date IS NULL) VIRTUAL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS playlist_song;
CREATE TABLE playlist_song(
    id INT UNSIGNED AUTO_INCREMENT,
    playlist_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    inclusion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_included_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_song_playlist FOREIGN KEY (playlist_id) REFERENCES playlist(id),
    CONSTRAINT fk_playlist_song_song FOREIGN KEY (song_id) REFERENCES song(id),
    CONSTRAINT fk_playlist_song_user FOREIGN KEY (user_included_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS user_artist;
CREATE TABLE user_artist(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_artist_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_user_artist_artist FOREIGN KEY (artist_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS artist_artist;
CREATE TABLE artist_artist(
    id INT UNSIGNED AUTO_INCREMENT,
    follower_id INT UNSIGNED NOT NULL,
    followed_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_artist_artist_follower FOREIGN KEY (follower_id) REFERENCES artist(id),
    CONSTRAINT fk_artist_artist_followed FOREIGN KEY (followed_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS user_album;
CREATE TABLE user_album(
    id INT AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_album_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_user_album_album FOREIGN KEY (album_id) REFERENCES album(id)
);

DROP TABLE IF EXISTS user_song;
CREATE TABLE user_song(
    id INT AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_song_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_user_song_song FOREIGN KEY (song_id) REFERENCES user(id)
);

-- Crea una tabla virtual llamada view_user_status_subscription basada en la siguiente consulta
CREATE VIEW view_user_status_subscription AS
-- Indica que la primera columna de nuestra vista será el ID del usuario. u: Es el alias (apodo) de la tabla user que definiremos más abajo
SELECT
    u.id,
    u.username,
-- Inicia una estructura lógica condicional (como un "Si... entonces..." en programación). Sirve para crear un valor basado en una condición.
    CASE
-- Si existe una fila en la tabla 's' (subscription) que conecte con el usuario
        -- y cumpla la condición de fecha, s.id no será nulo.
        WHEN s.id IS NOT NULL THEN 'premium'
        ELSE 'free'
    END AS real_status
FROM user u
-- Aquí está la clave:
-- Buscamos en la tabla 'subscription' (s) usando el user_id que hay en ella.
-- El LEFT JOIN asegura que si no hay coincidencia, el usuario siga apareciendo pero con s.id = NULL
LEFT JOIN subscription s ON u.id = s.user_id
    AND s.renewal_date > NOW();

DELIMITER //
CREATE TRIGGER tr_song_added_to_playlist
AFTER INSERT ON playlist_song -- Se activa al añadir una canción a la lista
FOR EACH ROW
BEGIN
    UPDATE playlist
    SET number_of_songs = number_of_songs + 1
    WHERE id = NEW.playlist_id; -- NEW.playlist_id es el ID de la lista donde acabas de insertar
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER update_playlist_number_songs_remove
AFTER DELETE ON playlist_song
FOR EACH ROW
BEGIN
    UPDATE playlist
    SET number_of_songs = number_of_songs -1
    WHERE id = OLD.playlist_id;
END//

DELIMITER ;

SET FOREIGN_KEY_CHECKS=1;








