-- System Functions
-- from https://msdn.microsoft.com/en-us/library/ms187786.aspx

-- Get the SQL Server name
SELECT @@SERVERNAME


-- Get the host for SSMS
SELECT HOST_NAME()


-- get a new GUID
SELECT NEWID()

-- Get the date. Use instead of getdate()
SELECT SYSDATETIME()
