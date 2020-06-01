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


-----------------------------------------------------------------------

  CREATE TABLE "Employees" (
  "Fullname" TEXT,
  "Salary" INT NOT NULL,
  "JobPosition" TEXT,
  "PhoneExtension" INT,
  "IsPartTime" BOOL
  );

  CREATE TABLE "Departments" (
  "Id" SERIAL PRIMARY KEY,
  "DepartmentName" TEXT,
  "Building" TEXT
  );

  ALTER TABLE "Employees" ADD COLUMN "DepartmentId" SERIAL PRIMARY KEY;

  CREATE TABLE "Products" (
  "Price" DOUBLE PRECISION,
  "Name" TEXT,
  "Description" TEXT,
  "QuantityInStock" INT
  );

  CREATE TABLE "Orders" (
  "Id" SERIAL PRIMARY KEY,
  "OrderNumber" TEXT,
  "DatePlaced" TIMESTAMP,
  "Email" TEXT
  );

  CREATE TABLE "ProductOrders" (
  "Id" SERIAL PRIMARY KEY,
  "OrderQuantity" INT
  );

  INSERT INTO "Departments" ("DepartmentName", "Building")
  VALUES ('Development', 'Main');

  INSERT INTO "Departments" ("DepartmentName", "Building")
  VALUES ('Marketing', 'North');

  INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "IsPartTime", "DepartmentId")
  VALUES ('Tim Smith', 40000, 'Programmer', false, '1');

  INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "IsPartTime", "DepartmentId")
  VALUES ('Barbara Ramsey', 80000, 'Manager', false, '1');

  // This was the only part I got stuck on. How do I assign another employee with the same ID? I tried...

  INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "IsPartTime", "DepartmentId") WHERE "DepartmentName"='Marketing'
  VALUES ('Barbara Ramsey', 80000, 'Manager', false, '1',);

  // But I "had an error near my 'WHERE'

  INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "IsPartTime", "DepartmentId", "DepartmentName")
  VALUES ('Barbara Ramsey', 80000, 'Manager', false, '1', 'Marketing');

  // But it has no relation

  INSERT INTO "Employees" ("Fullname", "Salary", "JobPosition", "IsPartTime", "Id")
  VALUES ('Tom Jones', 32000, 'Admin', true, '2');

  INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
  VALUES (12.45, 'Widget', 'The Original Widget', 100);

  INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
  VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);

  INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
  VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

  UPDATE "ProductOrders" ("OrderNumber", "OrderQuantity", "Name")
  VALUES ('X529', 3, "Widget");
  // Struggling to figure out how to update multiple things in their respective tables. Would I do...
  UPDATE "ProductOrders" ("OrderQuantity")
  VALUES (3);
  // Or would that just update the whole table, not for my specific order?

  SELECT "DepartmentId" FROM "Employees" WHERE "DepartmentId"=1;
  //Replace "1" with whatever Id youre searching for.

  // I cant figure out if I do
  SELECT "PhoneExtension" FROM "Departments" WHERE "DepartmentName"='Development';
  // or
  SELECT "PhoneExtension" FROM "Employees" WHERE "DepartmentName"='Development';

  Select "Orders" WHERE "Id"=2;

  DELETE FROM "Orders" WHERE "Name"='Widget' //and?// "OrderNumber"='X529';

  ------------------------------------------------------------------------------------------

  CREATE TABLE "Album" (
  "Title" TEXT,
  "IsExplicit" BOOL,
  "ReleaseDate" TEXT, //or TIMESTAMP?
  "Id" SERIAL PRIMARY KEY
  );

  CREATE TABLE "Band" (
  "Name" TEXT,
  "CountryOfOrigin" TEXT,
  "NumberOfMembers" INT,
  "Website" TEXT,
  "Style" TEXT,
  "IsSigned" BOOL,
  "ContactName" TEXT,
  "ContactPhoneNumber" INT,
  "Id" SERIAL PRIMARY KEY
  );

  ALTER TABLE "Album" ADD COLUMN "BandId" INTEGER NULL REFERENCES "Band" ("Id");

  SELECT *
  FROM "Album"
  JOIN "Band" ON "Album"."BandId" = "Band"."Id";

  INSERT INTO "Band" ("Name", "CountryOfOrigin", "NumberOfMembers", "Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
  VALUES ('Queen', 'United Kingdom', 6, QueenBand.com', 'Rock', true, 'Freddie Mercury', 727-555-9210);

  SELECT * FROM "Band";

  INSERT INTO "Album" ("Title", "IsExplicit", "ReleaseDate")
  VALUES ('Jazz', true, 10:5:1978);

  UPDATE "Band" SET "IsSigned" = false;

  UPDATE "Band" SET "IsSigned" = true;

  SELECT "Queen" FROM "Band";

  SELECT "Album" FROM "Band" ORDER BY DateTime;

  SELECT * FROM "Band" WHERE "IsSigned" = true;

  SELECT * FROM "Band" WHERE "IsSigned" = false;
