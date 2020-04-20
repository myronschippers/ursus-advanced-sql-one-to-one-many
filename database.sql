-- One - to - One
-- person - to - social
CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
);

CREATE TABLE "social_security" (
	"id" SERIAL PRIMARY KEY,
	"number" INT NOT NULL,
	"person_id" INT REFERENCES "person"
);

-- adding people to person table
INSERT INTO "person" ("name") VALUES ('Scott'), ('Rachael'), ('Myron');
INSERT INTO "social_security" ("number", "person_id") 
VALUES (234672736, 2),
(190923562, 3),
(333224444, 1);

SELECT * FROM "person";
SELECT * FROM "social_security";

SELECT * FROM "person"
JOIN "social_security" ON "person"."id" = "social_security"."person_id";


SELECT "person".id, "person".name, "social_security".number FROM "person"
JOIN "social_security" ON "person"."id" = "social_security"."person_id";

-- ====>>>>>>>>>>
-- ONE - TO - MANY
CREATE TABLE "cohorts" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(25) NOT NULL,
	"start_date" DATE
	-- STUDENT ID
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	-- COHORT ID
	"cohorts_id" INT REFERENCES "cohorts"
);

INSERT INTO "cohorts" ("name", "start_date")
VALUES ('Ursus', '1/1/1920'),
('Tyto', '1/1/1930'),
('Isurus', '1/1/1940');

-- Create Ursus Students
INSERT INTO "students" ("name", "cohorts_id")
VALUES ('Andrew', 1),
('McKenna', 1),
('Adam', 1),
('Leila', 1),
('Courtney', 1);
-- Create Tyto Students
INSERT INTO "students" ("name", "cohorts_id")
VALUES ('Travis', 2),
('Dane', 2);
-- Create Isurus Students
INSERT INTO "students" ("name", "cohorts_id")
VALUES ('Shanice', 3),
('Ellen', 3),
('Macy', 3);


-- SELECTING STUDENTS MATCHED BY COHORT
SELECT * FROM "cohorts"
JOIN "students" ON "students".cohorts_id = "cohorts".id;

-- Number of Students in a Cohort
SELECT count(*) FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id
WHERE "cohorts".name = 'Ursus';

-- Grouping Items
SELECT count(*), "cohorts".name FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id
WHERE "cohorts".name = 'Ursus'
GROUP BY "cohorts".name;

SELECT count(*) as "number_of_students", "cohorts".name FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id
WHERE "cohorts".name = 'Ursus'
GROUP BY "cohorts".name;

SELECT count(*) as "number_of_students", "cohorts".name as "cohort_name" FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id
WHERE "cohorts".name = 'Ursus'
GROUP BY "cohorts".name;

-- Sorting
SELECT count(*), "cohorts".name FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id
GROUP BY "cohorts".name
ORDER BY "cohorts".name DESC;
