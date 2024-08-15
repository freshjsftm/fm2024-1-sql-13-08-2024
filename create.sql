DROP TABLE IF EXISTS "users";

CREATE TABLE IF NOT EXISTS "users"(
  "firstName" varchar(32) NOT NULL CHECK("firstName"!=''),
  "lastName" varchar(32) NOT NULL CHECK("lastName"!=''),
  "email" varchar(256) NOT NULL CHECK("email"!='') UNIQUE,
  "height" smallint NOT NULL CHECK("height">=100 AND "height"<=250),
  "weight" numeric(5,2) NOT NULL CHECK("weight">=20 AND "weight"<=250),
  "birthday" date NOT NULL CHECK("birthday"<current_date),
  "isMale" boolean NOT NULL DEFAULT true
);

INSERT INTO "users"("email","firstName","lastName", "birthday", "height", "weight") 
VALUES('ozq@gmail.com','456','Ozzi','2024-07-16',190, 90.4);

INSERT INTO "users" 
VALUES
('Brad', 'Pitt', 'pitt@gmail.com', 188, 82.53, '1963-12-18' ,true),
('Anna', 'Pitt', 'pitt2@gmail.com', 168, 62.53, '2003-12-18' ,false),
('Tom', 'Rot', 'rot@gmail.com', 178, 80.53, '1964-03-24' ,true);

