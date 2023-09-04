CREATE DATABASE dentist_ease_app;

CREATE USER test_01@'%' IDENTIFIED BY 'test123456';

GRANT ALL PRIVILEGES ON dentist_ease_app.* TO test_01@'%';