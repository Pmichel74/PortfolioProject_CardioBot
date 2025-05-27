-- SQL commands to initialize the database schema

-- Create a table for users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create a table for comments
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert initial data into users table
INSERT INTO users (username, password, email) VALUES
('admin', 'admin_password_hash', 'admin@example.com'),
('user1', 'user1_password_hash', 'user1@example.com');

-- Insert initial data into posts table
INSERT INTO posts (user_id, title, content) VALUES
(1, 'First Post', 'This is the content of the first post.'),
(2, 'Second Post', 'This is the content of the second post.');

-- Insert initial data into comments table
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'This is a comment on the first post.'),
(2, 1, 'This is a comment on the second post.');