DROP TABLE IF EXISTS "messages";
DROP TABLE IF EXISTS "users_to_chats";
DROP TABLE IF EXISTS "chats";

CREATE TABLE IF NOT EXISTS "chats"(
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL CHECK("name"!=''),
  "ownerId" int REFERENCES "users"("id"),
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);
INSERT INTO "chats"("name", "ownerId") VALUES ('fm2024-1', 1),('save', 1),('about', 3);


CREATE TABLE IF NOT EXISTS "users_to_chats"(
  "userId" int REFERENCES "users"("id"),
  "chatId" int REFERENCES "chats"("id"),
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY ("userId", "chatId")
);
INSERT INTO "users_to_chats"("userId",  "chatId") VALUES (2,1),(3,1),(1,3),(2,3),(1,1),(1,2),(3,3);


CREATE TABLE IF NOT EXISTS "messages"(
  "id" bigserial PRIMARY KEY,
  "body" varchar(2048) NOT NULL CHECK("body"!=''),
  "autorId" int,
  "chatId" int,
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
  "isRead" boolean DEFAULT false,
  FOREIGN KEY ("autorId", "chatId") REFERENCES "users_to_chats"("userId", "chatId")
);
INSERT INTO "messages"("body", "autorId", "chatId") 
VALUES ('hi!', 3,1),('hi!', 1,3),(')))', 2,1),(')))', 2,3),('hi!', 1,1),(')))', 3,3);