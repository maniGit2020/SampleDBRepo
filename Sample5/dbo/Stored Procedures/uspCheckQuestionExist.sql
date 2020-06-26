
CREATE PROCEDURE uspCheckQuestionExist(@Ques varchar(4000)) as
BEGIN
select COUNT(1) 'ExstCount' from dbo.tblQuestion with(nolock) where Question_Name=@Ques
END