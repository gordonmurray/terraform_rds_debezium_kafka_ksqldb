-- create_users_table.sql
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  companyid INT NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

truncate table users;

INSERT INTO users (companyid, username, email) VALUES ('1','user1', 'user1@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user2', 'user2@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user3', 'user3@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user4', 'user4@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user5', 'user5@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user6', 'user6@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user7', 'user7@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user8', 'user8@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user9', 'user9@example.com');
INSERT INTO users (companyid, username, email) VALUES ('1','user10', 'user10@example.com');