DROP TABLE IF EXISTS "products";

CREATE TABLE IF NOT EXISTS "products"(
  "id" serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK("name"!=''),
  "category" varchar(256) NOT NULL CHECK("category"!=''),
  "price" decimal(16,2) NOT NULL CHECK("price">0),
  "quantity" smallint NOT NULL CHECK("quantity">=0 AND "quantity"<=1000),
  CONSTRAINT "unique_pair_name_category" UNIQUE("name", "category")
);

INSERT INTO "products" ("name", "category", "price", "quantity")
VALUES ('egg','eggs',3.4, 500),
('milk','milk products',34.5, 150),
('cheese','milk products',280.7, 40),
('beef','meat',156.7, 10),
('pork','meat',156.3, 20);


DROP TABLE IF EXISTS "orders";

CREATE TABLE IF NOT EXISTS "orders"(
    "id" bigserial PRIMARY KEY,
    "userId" int REFERENCES "users"("id"),
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "orders"("userId") VALUES(1),(2),(1);


DROP TABLE IF EXISTS "products_to_orders";

CREATE TABLE IF NOT EXISTS "products_to_orders"(
  "productId" int REFERENCES "products"("id"),
  "orderId" bigint REFERENCES "orders"("id"),
  "quantity" smallint NOT NULL CHECK("quantity">0) DEFAULT 1 ,
  PRIMARY KEY("productId", "orderId")
);

INSERT INTO "products_to_orders" ("productId", "orderId", "quantity")
VALUES (1,1,20),(2,1,1),(1,2,10),(2,2,1),(5,2,1),(3,3,1),(4,3,1);