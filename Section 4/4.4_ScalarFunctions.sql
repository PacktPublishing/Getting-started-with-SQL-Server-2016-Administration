CREATE FUNCTION DBO.GetSevenMore
    (@i AS INT)
RETURNS INT
AS
BEGIN
    RETURN @i + 7
END
GO
GO







SELECT dbo.GetSevenMore(8)
GO
SELECT one = 1





DECLARE @answer int
SELECT @answer = dbo.GetSevenMore(7)
SELECT @answer
GO






--CREATE TABLE Employees
--( EmployeeID INT
--, EmployeeName VARCHAR(50)
--, HireDate DATE
--)
--GO
--INSERT dbo.Employees
--        ( EmployeeID, EmployeeName, HireDate)
--    VALUES
--        ( 1, 'Steve',   '20010301')
--      , ( 2, 'Kyle',    '20050701')
--      , ( 3, 'Delaney', '20081215')
--	  , ( 4, 'Kendall', '20120721')
--GO
CREATE FUNCTION dbo.DaysEmployed
    (@hiredate AS DATE)
RETURNS INT
AS
BEGIN
  DECLARE @days INT
  SELECT @days = DATEDIFF(DAY, @hiredate, SYSDATETIME())
    RETURN @days
END
GO



SELECT EmployeeName
     , HireDate
	 , LengthOfEmployment = dbo.DaysEmployed(HireDate)
 FROM dbo.Employees











-- drop TABLE Employees
