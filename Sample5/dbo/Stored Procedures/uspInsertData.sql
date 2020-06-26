CREATE PROCEDURE uspInsertData
   @pID INT,
   @pValue INT,
   @pResCode INT=0 OUTPUT --0-OK, 1-ERROR
AS
BEGIN
 
   BEGIN TRY
 
      BEGIN TRANSACTION
 
         INSERT INTO TestTable(ID, Value)
         VALUES  (@pID, @pValue)
 
         EXEC uspUpdateData @pID=@pID, @pNewValue=10, @pResCode=@pResCode OUTPUT
 
         IF @pResCode=1
            RAISERROR('uspUpdateData failed',16,1)
 
       IF @@TRANCOUNT > 0
	  BEGIN
          COMMIT
		SELECT @pResCode = 1
	  END


   END TRY

   BEGIN CATCH 
 
      IF @@TRANCOUNT > 0
         ROLLBACK
 
      SELECT  @pID ,@pValue, OBJECT_NAME(@@PROCID) AS ProcedureName,ERROR_NUMBER() AS ErrorNumber
      SELECT @pID ,@pValue, OBJECT_NAME(@@PROCID) AS ProcedureName,ERROR_MESSAGE() AS ErrorMessage
 
      SET @pResCode=1
 
   END CATCH
END


