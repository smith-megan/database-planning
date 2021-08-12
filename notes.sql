CREATE TABLE user (
user_id SERIAL PRIMARY KEY,
user_name VARCHAR(45),
user_email VARCHAR(5),
user_password VARCHAR(500)
);

CREATE TABLE grocery (
user_id INT NOT NULL REFERENCES user(user_id),
grocery_id SERIAL PRIMARY KEY
);

CREATE TABLE ingredient (
ingredient_id SERIAL PRIMARY KEY,
ingredient_name VARCHAR(30)
);

CREATE TABLE grocery_ingredient (
  grocery_ingredient_id SERIAL PRIMARY KEY,
  grocery_id INT NOT NULL REFERENCES grocery(grocery_id),
  ingredient_id INT NOT NULL REFERENCES ingredient(ingredient_id)
);

CREATE TABLE recipes (
recipes_id SERIAL PRIMARY KEY,
recipe_title VARCHAR (30),
recipe_photo VARCHAR(50),
recipe_url TEXT,
recipe_description VARCHAR(300),
public BOOLEAN DEFAULT True,
user_id INT NOT NULL REFERENCES user(user_id),
grocery_id INT NOT NULL REFERENCES grocery(grocery_id)
);

CREATE TABLE user_occassions (
  user_occassions SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES user(user_id),
  recipes_id INT NOT NULL REFERENCES recipes(recipes_id)
);


CREATE TABLE occassions (
  occassions_id SERIAL PRIMARY KEY,
  occassions_name VARCHAR(40),
  recipes_id INT NULL REFERENCES recipes(recipes_id)
);