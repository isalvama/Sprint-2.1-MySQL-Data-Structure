DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE spotify;

SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS user;
CREATE TABLE user(
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARBINARY(255) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('he', 'she', 'they') NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS credit_card;
CREATE TABLE credit_card(
    id INT UNSIGNED NOT NULL,
    credit_card_number BIGINT UNSIGNED NOT NULL UNIQUE,
    security_code VARBINARY(200) NOT NULL,
    expiration_date DATE NOT NULL,
    owner_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES payment_method(id)
);

DROP TABLE IF EXISTS paypal_account;
CREATE TABLE paypal_account(
    id INT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARBINARY(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES payment_method(id)
);

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription(
    id INT UNSIGNED AUTO_INCREMENT,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    renewal_date TIMESTAMP AS (DATE_ADD(start_date, INTERVAL 1 YEAR)) STORED,
    payment_method_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS artist;
CREATE TABLE artist(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    image BLOB NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS album;
CREATE TABLE album(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    image BLOB NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS song;
CREATE TABLE song(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    duration_seconds BIGINT UNSIGNED NOT NULL,
    number_times_played INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id) REFERENCES artist(id),
    FOREIGN KEY (album_id) REFERENCES album(id)
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist(
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL DEFAULT 'New Playlist',
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    number_of_songs INT UNSIGNED NOT NULL DEFAULT 0,
    user_id INT UNSIGNED NOT NULL,
    removal_date TIMESTAMP,
    is_active boolean AS (removal_date IS NULL) VIRTUAL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS playlist_song;
CREATE TABLE playlist_song(
    id INT UNSIGNED AUTO_INCREMENT,
    playlist_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    inclusion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_included_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(id),
    FOREIGN KEY (song_id) REFERENCES song(id),
    FOREIGN KEY (user_included_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS user_artist;
CREATE TABLE user_artist(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (artist_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS artist_artist;
CREATE TABLE artist_artist(
    id INT UNSIGNED AUTO_INCREMENT,
    follower_id INT UNSIGNED NOT NULL,
    followed_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (follower_id) REFERENCES artist(id),
    FOREIGN KEY (followed_id) REFERENCES artist(id)
);

DROP TABLE IF EXISTS user_album_favorites;
CREATE TABLE user_album_favorites(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (album_id) REFERENCES album(id)
);

DROP TABLE IF EXISTS user_song_favorites;
CREATE TABLE user_song_favorites(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    following_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (song_id) REFERENCES user(id)
);

CREATE VIEW view_user_status_subscription AS
SELECT
    u.id,
    u.username,
    CASE
        WHEN s.id IS NOT NULL THEN 'premium'
        ELSE 'free'
    END AS real_status
FROM user u
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








