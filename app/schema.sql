ALTER TABLE IF EXISTS users RENAME TO users2;
ALTER TABLE IF EXISTS comments RENAME TO comments2;
ALTER TABLE IF EXISTS posts RENAME TO posts2;
ALTER TABLE IF EXISTS post_tags RENAME TO post_tags2;
ALTER TABLE IF EXISTS tags RENAME TO tags2;
ALTER TABLE IF EXISTS categories RENAME TO categories2;


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    password TEXT
);


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    author_id INTEGER NOT NULL REFERENCES users(id),
    category_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    post_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES users (id) ON DELETE CASCADE
);


CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE post_tags (
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, tag_id)
);

INSERT INTO categories (name, description)
VALUES 
    ('cars', 'Everything about cars, driving, and maintenance.'),
    ('animals', 'Posts about animals and pets.'),
    ('traveling', 'Tips and experiences related to traveling.'),
    ('lifestyle', 'All about your life.'),
    ('clothing', 'Clothes and Fashion.'),
    ('other', 'Everything else');
