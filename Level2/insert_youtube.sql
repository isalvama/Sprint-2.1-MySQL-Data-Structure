INSERT INTO youtube.chanel(name, description) VALUES ('Maria Chanel', 'Videos I post from my daily life');
INSERT INTO youtube.chanel(name, description) VALUES ('Fashion Trends', 'Get updated to the fashion world with Fashion Trends');
INSERT INTO youtube.chanel(name, description) VALUES ('Airplanes', 'Get to know more about the technical aspects and history about airplanes');
INSERT INTO youtube.chanel(name, description) VALUES ('TotalCars', 'Do you like cars? If so, this is the place for you!');
INSERT INTO youtube.chanel(name, description) VALUES ('Series', 'All news about new series and movies');

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('mariasvideos', 'm@gmail.com', 'ewuhf', '1980-11-13', 'she', 'Spain', '627882018', '2012-11-13 10:30:00', 1);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('allFashion', 'af@gmail.com', 'iwhf', '1990-03-20', 'she', 'UK', '629304582', '2015-04-03 15:45:12', 2);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('allAboutCarla', 'aac@gmail.com', 'iwhfoei', '1997-03-20', 'she',  'US', '629402837', '2010-09-06 09:15:00', NULL);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('carsandcars55', 'cac55f@gmail.com', 'oeifh', '1987-05-16', 'he', 'Germany', '629371839', '2020-04-04 18:20:00', 4);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('airplanesfan', 'apf@gmail.com', 'oweyffopf', '1998-08-05', 'he', 'Spain', '629374382', '2019-01-06 12:00:00', 3);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('carrieBManoloBlanik', 'cbmb@gmail.com', 'oiwehff', '1998-08-05', 'she', 'US', '629374382', '2019-01-06 12:05:00', 5);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('gamerPro99', 'gp99@gmail.com', 'pass123', '2000-01-15', 'he', 'UK', '611223344', '2021-05-20 22:10:00', NULL);

INSERT INTO youtube.user(username, email, password, birth_date, gender, country, phone_number, register_date, chanel_id)
VALUES ('techReviewer', 'tech@outlook.com', 'securePwd', '1985-12-10', 'he', 'France', '655443322', '2018-11-30 08:45:00', NULL);

INSERT INTO youtube.label(name) VALUES ('fashion');
INSERT INTO youtube.label(name) VALUES ('daily life');
INSERT INTO youtube.label(name) VALUES ('culture');
INSERT INTO youtube.label(name) VALUES ('motor');
INSERT INTO youtube.label(name) VALUES ('car brand');
INSERT INTO youtube.label(name) VALUES ('automotive');
INSERT INTO youtube.label(name) VALUES ('planes');
INSERT INTO youtube.label(name) VALUES ('physics');
INSERT INTO youtube.label(name) VALUES ('Met Gala');
INSERT INTO youtube.label(name) VALUES ('slow fashion');
INSERT INTO youtube.label(name) VALUES ('Hollywood');
INSERT INTO youtube.label(name) VALUES ('Netflix');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('My day as a Philosophy student', 'Spend a day with me getting into the beatiful world of Socrates. Follow me on Instagram for more content like this: @MariaChanel11', 7356.37, 'my_day_as_a_philosophy_student.mp4', 3247, X'696d6167656e33', 2435, 12, 1, 2,1, '2024-02-10 18:25:00');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('Landing of Airbus A380', 'Incredible shot from the runway', 300.10, 'plane_spotting.mp4', 180, X'696d6167656e34', 3000, 450, 2, 3, 3, '2023-06-12 09:15:00');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('Summer Collection 2024 Lookbook', 'Exploring the new trends for this summer. Which outfit is your favorite? Comment below!', 5200.12, 'summer_lookbook.mp4', 1250, X'696d6167656e34', 8540, 950, 15, 4, 2, '2024-03-15 10:00:00');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('The History of Boeing 747', 'A deep dive into the engineering marvel that changed aviation forever. From the first flight to its legacy.', 12500.80, 'boeing_history.mp4', 5400, X'696d6167656e35', 45000, 3200, 40, 3, 3, '2024-01-20 09:15:00');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('Ferrari SF90 Stradale Review', 'Is this the best hybrid supercar ever made? We take it to the track to find out.', 9800.45, 'ferrari_review.mp4', 1800, X'696d6167656e36', 120000, 15000, 200, 5, 4, '2024-04-05 15:30:00');

INSERT INTO youtube.video(title, description, weight, file_name, seconds_duration, thumbnail, number_views, number_likes, number_dislikes, label_id, chanel_id, uploading_date)
VALUES ('Top 10 Series to Watch in 2024', 'Our definitive list of the most anticipated shows coming to streaming platforms this year.', 3400.00, 'top_10_series.mp4', 900, X'696d6167656e37', 15600, 890, 10, 1, 5, '2024-02-28 20:00:00');

INSERT INTO youtube.like_dislike(user_id, type, video_id, date) VALUES (8, 'like', 1, '2024-02-11 09:00:00');
INSERT INTO youtube.like_dislike(user_id, type, video_id, date) VALUES (7, 'dislike', 3, '2024-03-16 12:30:00');
INSERT INTO youtube.like_dislike(user_id, type, video_id, date) VALUES (1, 'like', 5, '2024-04-06 18:20:00');
INSERT INTO youtube.like_dislike(user_id, type, video_id, date) VALUES (2, 'like', 4, '2024-01-21 10:00:00');
INSERT INTO youtube.like_dislike(user_id, type, video_id, date) VALUES (3, 'like', 6, '2024-02-29 11:15:00');

INSERT INTO youtube.subscription(user_id, chanel_id, date) VALUES (2, 1, '2024-02-12 14:00:00');
INSERT INTO youtube.subscription(user_id, chanel_id, date) VALUES (4, 3, '2024-01-25 08:30:00');
INSERT INTO youtube.subscription(user_id, chanel_id, date) VALUES (8, 4, '2024-04-10 19:00:00');
INSERT INTO youtube.subscription(user_id, chanel_id, date) VALUES (1, 2, '2024-03-20 15:45:00');

INSERT INTO youtube.playlist(name, user_id, visibility_status, creation_date)
VALUES ('Best Vlogs 2024', 1,  'public', '2024-02-15 10:00:00');

INSERT INTO youtube.playlist(name, user_id, visibility_status, creation_date)
VALUES ('Car Reviews', 4, 'public', '2024-04-06 12:00:00');

INSERT INTO youtube.playlist(name, user_id, visibility_status, creation_date)
VALUES ('Private Tech Stuff', 8,  'private', '2024-01-22 09:00:00');

INSERT INTO youtube.playlist_record(video_id, playlist_id, incorporation_date) VALUES (2, 1, '2024-02-16 11:00:00');
INSERT INTO youtube.playlist_record(video_id, playlist_id, incorporation_date) VALUES (6, 1, '2024-03-01 14:00:00');
INSERT INTO youtube.playlist_record(video_id, playlist_id, incorporation_date) VALUES (3, 2, '2024-04-07 10:30:00');

INSERT INTO youtube.comment(video_id, user_id, comment_body, comment_date)
VALUES (1, 8, 'I really love Socrates, thanks for this video!', '2024-02-10 19:00:00');

INSERT INTO youtube.comment(video_id, user_id, comment_body, comment_date)
VALUES (5, 4, 'The hybrid engine on this Ferrari is just incredible.', '2024-04-05 16:45:00');

INSERT INTO youtube.comment(video_id, user_id, comment_body, comment_date)
VALUES (3, 7, 'Not my style, but the editing is good.', '2024-03-15 11:20:00');

INSERT INTO youtube.like_dislike_comment(comment_id, user_id, type, date) VALUES (1, 1, 'like', '2024-02-10 20:00:00');
INSERT INTO youtube.like_dislike_comment(comment_id, user_id, type, date) VALUES (2, 5, 'like', '2024-04-05 18:00:00');
INSERT INTO youtube.like_dislike_comment(comment_id, user_id, type, date) VALUES (3, 2, 'dislike', '2024-03-15 13:00:00');
