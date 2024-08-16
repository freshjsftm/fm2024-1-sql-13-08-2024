DROP TABLE IF EXISTS "messages";

CREATE TABLE IF NOT EXISTS "messages"(
  "id" bigserial PRIMARY KEY,
  "body" varchar(2048) NOT NULL CHECK("body"!=''),
  "autorId" int REFERENCES "users"("id"),
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
  "isRead" boolean DEFAULT false
);

INSERT INTO "messages"("body", "autorId") 
VALUES 
('hi!', 3),
('hi!', 1),
(')))', 2);

