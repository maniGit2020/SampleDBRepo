CREATE PROCEDURE uspUpdateData
   @pID INT,
   @pNewValue INT,
   @pResCode INT=0 OUTPUT --0-OK, 1-ERROR
AS
BEGIN

   DECLARE @trancount BIT = 0
 
   BEGIN TRY
	   SELECT 'Start Trancount',@@TRANCOUNT
      IF @@TRANCOUNT=0
      BEGIN
         BEGIN TRANSACTION
         SET @trancount=1
      END
	 SELECT 'AFTER Trancount',@@TRANCOUNT
	 SELECT 1/0
         UPDATE TestTable
         SET Value=@pNewValue
         WHERE ID=@pID AND Value < 100
 
      IF @trancount=1
         COMMIT
 
   END TRY

   BEGIN CATCH 

      IF @trancount=1
         ROLLBACK
 
      SELECT @pID, @pNewValue,OBJECT_NAME(@@PROCID) AS ProcedureName,ERROR_NUMBER() AS ErrorNumber
      SELECT @pID, @pNewValue,OBJECT_NAME(@@PROCID) AS ProcedureName,ERROR_MESSAGE() AS ErrorMessage
 
      SET @pResCode=1
 
   END CATCH
 
END	


