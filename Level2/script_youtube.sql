CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS chanel;
CREATE TABLE chanel(
    id          INT AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    description VARCHAR(5000) NOT NULL,
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS user;
CREATE TABLE user(
    id INT AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    birthdate TIMESTAMP NOT NULL,
    gender ENUM('he', 'she', 'they') NOT NULL,
    postal_code VARCHAR(20),
    country VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    chanel_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_chanel FOREIGN KEY (chanel_id) REFERENCES chanel(id)
);

DROP TABLE IF EXISTS label;
CREATE TABLE label(
    id          INT AUTO_INCREMENT,
    name       VARCHAR(200)  NOT NULL,
    description VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS video;
CREATE TABLE video(
    id INT AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    weight DOUBLE PRECISION(15,10) NOT NULL,
    file_name VARCHAR(200) NOT NULL,
    seconds_duration INT NOT NULL,
    thumbnail BLOB NOT NULL,
    number_views INT NOT NULL,
    number_likes INT NOT NULL,
    number_dislikes INT NOT NULL,
    label_id INT NOT NULL,
    user_id INT NOT NULL,
    uploading_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_video_label FOREIGN KEY (label_id) REFERENCES label(id),
    CONSTRAINT fk_video_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS like_dislike;
CREATE TABLE like_dislike(
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    type ENUM('like', 'dislike') NOT NULL,
    video_id INT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_like_dislike_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_like_dislike_video FOREIGN KEY (video_id) REFERENCES video(id)
);

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription(
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    chanel_id INT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_subscription_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_subscription_chanel FOREIGN KEY (chanel_id) REFERENCES chanel(id)
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist(
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL DEFAULT 'New Playlist',
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    visibility_status ENUM('public', 'private') NOT NULL DEFAULT 'public',
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS playlist_record;
CREATE TABLE playlist_record(
    id INT AUTO_INCREMENT,
    incorporation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    video_id INT NOT NULL,
    playlist_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_record_video FOREIGN KEY (video_id) REFERENCES video(id),
    CONSTRAINT fk_playlist_record_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS comment;
CREATE TABLE comment(
    id INT AUTO_INCREMENT,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    video_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_body VARCHAR(5000) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    CONSTRAINT fk_comment_video FOREIGN KEY (video_id) REFERENCES video(id),
    CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES user(id)
);

DROP TABLE IF EXISTS like_dislike_comment;
CREATE TABLE like_dislike_comment(
    id INT AUTO_INCREMENT,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_id INT NOT NULL,
    user_id INT NOT NULL,
    type ENUM('like', 'dislike') NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_like_dislike_comment_comment FOREIGN KEY (comment_id) REFERENCES comment(id),
    CONSTRAINT fk_like_dislike_comment_user FOREIGN KEY (user_id) REFERENCES user(id)
);

SET FOREIGN_KEY_CHECKS=1;




