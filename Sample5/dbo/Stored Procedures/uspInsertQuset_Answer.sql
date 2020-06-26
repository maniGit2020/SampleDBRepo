

CREATE PROCEDURE uspInsertQuset_Answer
(
@Ques varchar(4000),
@Ans1 varchar(1000),
@Ans2 varchar(1000),
@Ans3 varchar(1000),
@Ans4 varchar(1000),
@Opt1 bit,
@Opt2 bit,
@Opt3 bit,
@Opt4 bit) AS

BEGIN
	BEGIN TRY
		BEGIN TRAN

			DECLARE @QuestCont int 

			select @QuestCont = (Select COUNT(1)+1 from dbo.tblQuestion With(NoLock))

					INSERT INTO dbo.tblQuestion (QuestionID,Question_Name)
					VALUES (@QuestCont,@Ques)
		
					INSERT INTO dbo.tblAnswer_Choice(AnswerID,QuestionId,AnsOptions,IsCorrect)
					SELECT 1, @QuestCont, @Ans1, @Opt1 UNION
					SELECT 2, @QuestCont, @Ans2, @Opt2 UNION
					SELECT 3, @QuestCont, @Ans3, @Opt3 UNION
					SELECT 4, @QuestCont, @Ans4, @Opt4

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH		

END
