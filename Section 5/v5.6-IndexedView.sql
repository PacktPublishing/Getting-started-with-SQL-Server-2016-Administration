CREATE VIEW AdultPeople
WITH SCHEMABINDING
AS
SELECT
    BusinessEntityID,
    FirstName,
    MiddleName,
    LastName,
    DOB,
    Gender
FROM dbo.Person
WHERE Active = 1;
GO



CREATE UNIQUE CLUSTERED INDEX adultpeopleIdx ON dbo.AdultPeople
 (BusinessEntityID, FirstName, LastName)
GO
