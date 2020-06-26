CREATE TABLE [dbo].[Foo] (
    [ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Dummy] VARCHAR (100) NULL
);


GO
CREATE TRIGGER InsertFoo ON Foo AFTER INSERT AS
BEGIN
  INSERT INTO FooLog (LogText) VALUES ('inserted Foo')
  INSERT INTO FooLog (LogText) SELECT Dummy FROM inserted
END