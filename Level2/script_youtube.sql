DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE youtube;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS label;
CREATE TABLE label(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS chanel;
CREATE TABLE chanel(
    id          INT UNSIGNED AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    description VARCHAR(5000) NOT NULL,
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS user;
CREATE TABLE user(
    id INT UNSIGNED AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARBINARY(255) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('he', 'she', 'they') NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    chanel_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (chanel_id) REFERENCES chanel(id)
);

DROP TABLE IF EXISTS video;
CREATE TABLE video(
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    weight DECIMAL (15,2) NOT NULL,
    file_name VARCHAR(200) NOT NULL,
    seconds_duration BIGINT UNSIGNED NOT NULL,
    thumbnail BLOB NOT NULL,
    number_views INT UNSIGNED NOT NULL,
    number_likes INT UNSIGNED NOT NULL,
    number_dislikes INT UNSIGNED NOT NULL,
    label_id INT UNSIGNED NOT NULL,
    chanel_id INT UNSIGNED NOT NULL,
    uploading_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (chanel_id) REFERENCES chanel(id)
);

DROP TABLE IF EXISTS like_dislike;
CREATE TABLE like_dislike(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    type ENUM('like', 'dislike') NOT NULL,
    video_id INT UNSIGNED NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    chanel_id INT UNSIGNED NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (chanel_id) REFERENCES chanel(id)
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL DEFAULT 'New Playlist',
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT UNSIGNED NOT NULL,
    visibility_status ENUM('public', 'private') NOT NULL DEFAULT 'public',
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS playlist_record;
CREATE TABLE playlist_record(
    id INT UNSIGNED AUTO_INCREMENT,
    incorporation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    video_id INT UNSIGNED NOT NULL,
    playlist_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_record_video FOREIGN KEY (video_id) REFERENCES video(id),
    CONSTRAINT fk_playlist_record_playlist FOREIGN KEY (playlist_id) REFERENCES playlist(id)
);

DROP TABLE IF EXISTS comment;
CREATE TABLE comment(
    id INT UNSIGNED AUTO_INCREMENT,
    comment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    video_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    comment_body VARCHAR(5000) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    CONSTRAINT fk_comment_video FOREIGN KEY (video_id) REFERENCES video(id),
    CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS like_dislike_comment;
CREATE TABLE like_dislike_comment(
    id INT UNSIGNED AUTO_INCREMENT,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    type ENUM('like', 'dislike') NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_like_dislike_comment_comment FOREIGN KEY (comment_id) REFERENCES comment(id),
    CONSTRAINT fk_like_dislike_comment_user FOREIGN KEY (user_id) REFERENCES user(id)
);

SET FOREIGN_KEY_CHECKS=1;




