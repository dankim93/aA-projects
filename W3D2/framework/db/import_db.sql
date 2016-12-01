DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO --user
  users (fname, lname)
VALUES
  ('Igor', 'Dmitriev'),
  ('Dan', 'Kim'),
  ('TestUser1', '111'),
  ('TestUser2', '222');

INSERT INTO --questions
  questions (title, body, author_id)
VALUES
  ('Test1', 'Body text 1', (SELECT id FROM users WHERE fname = 'Igor')),
  ('Test1', 'Body text 1', (SELECT id FROM users WHERE fname = 'Igor')),
  ('Test2', 'Body text 2', (SELECT id FROM users WHERE fname = 'Dan'));

INSERT INTO --question_follows
  question_follows (user_id, question_id)
VALUES
  (
    (SELECT id FROM users WHERE fname = 'Igor'),
    (SELECT id FROM questions WHERE title = 'Test2')
  ),
  (
    (SELECT id FROM users WHERE fname = 'Dan'),
    (SELECT id FROM questions WHERE title = 'Test2')
  ),
  (
    (SELECT id FROM users WHERE fname = 'TestUser1'),
    (SELECT id FROM questions WHERE title = 'Test2')
  ),
  (
    (SELECT id FROM users WHERE fname = 'TestUser2'),
    (SELECT id FROM questions WHERE title = 'Test2')
  );

INSERT INTO -- reply
  replies (question_id, author_id, body)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Test1'),
    (SELECT id FROM users WHERE fname = 'Dan'),
    'body text'
  );

INSERT INTO -- child reply
  replies (question_id, parent_reply_id, author_id, body)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Test1'),
    (SELECT id FROM replies WHERE body = 'body text'),
    (SELECT id FROM users WHERE fname = 'Igor'),
    'child reply'
  );

INSERT INTO -- question likes
  question_likes (user_id, question_id)
VALUES
  (
    (SELECT id FROM users WHERE fname = 'Dan'),
    (SELECT id FROM questions WHERE title = 'Test1')
  ),
  (
    (SELECT id FROM users WHERE fname = 'Dan'),
    (SELECT id FROM questions WHERE title = 'Test2')
  ),
  (
    (SELECT id FROM users WHERE fname = 'TestUser2'),
    (SELECT id FROM questions WHERE title = 'Test1')
  ),
  (
    (SELECT id FROM users WHERE fname = 'TestUser1'),
    (SELECT id FROM questions WHERE title = 'Test1')
  );
