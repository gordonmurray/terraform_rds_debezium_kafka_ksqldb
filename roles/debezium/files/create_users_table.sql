-- create_users_table.sql
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

truncate table users;

-- insert_sample_data.sql
INSERT INTO users (username, email) VALUES ('user1', 'user1@example.com');
INSERT INTO users (username, email) VALUES ('user2', 'user2@example.com');
INSERT INTO users (username, email) VALUES ('user3', 'user3@example.com');
INSERT INTO users (username, email) VALUES ('user4', 'user4@example.com');
INSERT INTO users (username, email) VALUES ('user5', 'user5@example.com');
INSERT INTO users (username, email) VALUES ('user6', 'user6@example.com');
INSERT INTO users (username, email) VALUES ('user7', 'user7@example.com');
INSERT INTO users (username, email) VALUES ('user8', 'user8@example.com');
INSERT INTO users (username, email) VALUES ('user9', 'user9@example.com');
INSERT INTO users (username, email) VALUES ('user10', 'user10@example.com');