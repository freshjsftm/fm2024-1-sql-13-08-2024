DROP TABLE IF EXISTS "teames" CASCADE;
DROP TABLE IF EXISTS "coaches" CASCADE;

CREATE TABLE IF NOT EXISTS "coaches"(
  "id" serial PRIMARY KEY,
  "name" varchar(32) NOT NULL
);
CREATE TABLE IF NOT EXISTS "teames"(
  "id" serial PRIMARY KEY,
  "name" varchar(32) NOT NULL
);

ALTER TABLE "coaches"
ADD FOREIGN KEY ("id") REFERENCES "teames"("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "teames" 
ADD FOREIGN KEY ("id") REFERENCES "coaches"("id") DEFERRABLE INITIALLY DEFERRED;

INSERT INTO "coaches"("name", "id") VALUES ('Tom', 1);
INSERT INTO "teames"("name", "id") VALUES ('ALL', 1);
