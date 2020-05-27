 CREATE TABLE "Employees" (
  "Fullname" TEXT,
  "Salary" INT NOT NULL,
  "JobPosition" TEXT,
  "PhoneExtension" INT,
  "IsPartTime" BOOL
  //"Id" SERIAL PRIMARY KEY
  );

INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
   VALUES ('Skylar Shipton', 1000000, 'Observer of Cats', 0226, true);

INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
 VALUES ('Summer Shipton', 2500000, 'Assistant to the Observer of Cats', 0409, true);

INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
 VALUES ('Sean Shipton', 3000000, 'Cat Chauffeur', 0619, false);

INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
 VALUES ('Lazy Larry', 25000, 'Delivery Driver', 1234, false);

INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
  VALUES ('Gordon Ramsay', 500000, 'Cook', 0660, false);



SELECT * FROM "Employees";
SELECT "Fullname", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'true';
INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")  VALUES ('Vana Shipton', 450, 'Software Developer', 0601, true);
UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';
DELETE FROM "Employees" WHERE "Fullname" = 'Lazy Larry';
ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

ALTER TABLE "Employees" ADD COLUMN "Id" SERIAL PRIMARY KEY;
//UPDATE "Employees" SET "Fullname" = NOT NULL;
//UPDATE "Employees" SET "JobPosition" = NOT NULL;
//ALTER TABLE "Employees" ALTER COLUMN "JobPosition" TEXT NOT NULL;
//I tried all of the //'d things above, but none of them work. I also tried setting individual columns that *are* NULL to be equal to 0, and then to NOT NULL, but that didnt work either.


