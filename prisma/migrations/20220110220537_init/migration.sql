BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Person] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000),
    CONSTRAINT [Person_pkey] PRIMARY KEY ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Follows] (
    [followerId] INT NOT NULL,
    [followingId] INT NOT NULL,
    CONSTRAINT [Follows_pkey] PRIMARY KEY ([followerId],[followingId])
);

-- AddForeignKey
ALTER TABLE [dbo].[Follows] ADD CONSTRAINT [Follows_followerId_fkey] FOREIGN KEY ([followerId]) REFERENCES [dbo].[Person]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Follows] ADD CONSTRAINT [Follows_followingId_fkey] FOREIGN KEY ([followingId]) REFERENCES [dbo].[Person]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
