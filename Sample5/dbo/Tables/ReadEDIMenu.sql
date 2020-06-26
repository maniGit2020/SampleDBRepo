CREATE TABLE [dbo].[ReadEDIMenu] (
    [MenuID]       INT           IDENTITY (1, 1) NOT NULL,
    [MenuName]     VARCHAR (50)  NULL,
    [MenuDesc]     VARCHAR (500) NULL,
    [ParentMenuID] INT           NULL,
    [OrderNo]      INT           NULL,
    CONSTRAINT [PK_ReadEDIMenu_MenuID] PRIMARY KEY CLUSTERED ([MenuID] ASC)
);

