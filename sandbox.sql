
DROP TABLE IF EXISTS a;

CREATE TABLE IF NOT EXISTS a(
  b int CHECK(b<10) NOT NULL, 
  c int NOT NULL,
  CONSTRAINT "uniquePair" PRIMARY KEY(b,c)
);

INSERT INTO a VALUES (1,1),(2,1),(1,3);


-- INSERT INTO a VALUES (1,1);