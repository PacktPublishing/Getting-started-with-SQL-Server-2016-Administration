-- Table Valued Functions
ALTER FUNCTION dbo.EmployeesByName
 (@letter AS CHAR(1)
 )
RETURNS @employeelist TABLE
(   empid     INT,
    firstname VARCHAR(200),
    lastname  VARCHAR(200)
)
AS
BEGIN
    IF @letter >= 'a'
       AND @letter < 'z'
        INSERT @employeelist
        SELECT
            EmployeeID,
            EmployeeName,
            HireDate
        FROM dbo.Employees
        WHERE SUBSTRING(EmployeeName, 1, 1) = @letter
;
    RETURN;
END;
GO


-- select from this?
SELECT dbo.EmployeesByName('s')





-- it's a table.
SELECT *
 FROM dbo.EmployeesByName('s')






SELECT firstname
 FROM dbo.EmployeesByName('s')





/*
create table dbo.AppRoleTest
( AppRole varchar(20)
, id int
)
go
insert AppRoleTest
 values ('Manager', 1),
        ('WebUser', 1),
        ('WebUser', 2),
        ('WebUser', 3),
        ('Admin', 4)
*/
SELECT *
 FROM dbo.AppRoleTest a
 INNER JOIN dbo.EmployeesByName('d') b
 ON a.id = b.empid
GO







-- Inline Table Valued Functions
CREATE FUNCTION dbo.GetEmployeeName
    (@EmployeeID AS INT)
RETURNS TABLE
AS
RETURN ( SELECT EmployeeName
 FROM dbo.Employees
  WHERE EmployeeID = @EmployeeID )
GO


/*
-- More sample data
CREATE TABLE WorKSchedule
( workday DATE, employeeid INT, shift VARCHAR(20))
GO
INSERT dbo.WorKSchedule
        ( workday, employeeid, shift )
    VALUES ( '20170301', 1, 'Morning' ),
	       ( '20170302', 1, 'Afternoon' ),
	       ( '20170301', 2, 'Afternoon' ),
	       ( '20170303', 3, 'Afternoon' ),
	       ( '20170301', 4, 'Evening' ),
	       ( '20170304', 3, 'Evening' )
GO
*/



-- use the function in a CROSS APPLY query
SELECT
    workday,
    employeeid,
    shift,
    EmployeeName
FROM
    dbo.WorKSchedule
    CROSS APPLY dbo.GetEmployeeName(employeeid);
	 