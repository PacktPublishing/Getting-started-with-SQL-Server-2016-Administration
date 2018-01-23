-- creating nonclustered indexes
-- quick test of index names - unique per table
CREATE TABLE test (id INT)
GO
CREATE TABLE test2 (id INT)
GO
CREATE INDEX mytest ON test(id)
GO
CREATE INDEX mytest ON test2(id)
GO
















-- Lets look at a table.
CREATE TABLE [Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] NVARCHAR(10) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] NVARCHAR(200) NOT NULL,
	[MiddleName] NVARCHAR(200) NULL,
	[LastName] NVARCHAR(200) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Active] BIT,
	[DOB] DATETIME2(3),
	[Gender] CHAR(1),
	[PrimaryEmail] VARCHAR(200)
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)
);
GO
-- Index FKs (BusinessEntityID)
CREATE INDEX Person_NDX1 ON Person(BusinessEntityID)
GO
CREATE INDEX Person_NDX2 ON Person(Lastname, Firstname, Gender) 
GO
CREATE INDEX Person_NDX3 ON Person(Lastname, Firstname, gender) WHERE DOB > '04-01-1999'
GO
CREATE INDEX Person_NDX4 ON Person(ModifiedDate) INCLUDE (Firstname, Lastname)
GO



-- maintenance
ALTER INDEX Person_NDX1 ON Person REBUILD
GO

 
