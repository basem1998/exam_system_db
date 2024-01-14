select * from [dbo].[student_crs]
use [OnlineExame]

---insert into question
go
create proc insertintoQuestion @QuesID INT, @QuesText NVARCHAR(700), @QuesType VARCHAR(3), @QuesAnswer VARCHAR(1),@QueDegree int, @QuesCrsID INT
AS
   begin try
	INSERT INTO [dbo].[question]
	VALUES(@QuesID, @QuesText, @QuesType, @QuesAnswer,@QueDegree ,@QuesCrsID)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch



   ----- select from question 
   go 

  create proc selectfromQuestion  @QuesID INT
AS
   begin try
	select * FROM [dbo].[question]
	WHERE Qid = @QuesID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch


    --update qusetion
   go
  
   create PROC UpdateQuestions @QuesID INT, @QuesText NVARCHAR(700), @QuesType VARCHAR(3), @QuesAnswer VARCHAR(1),@QueDegree int, @QuesCrsID INT
AS
   begin try
	UPDATE [dbo].[question]
	SET  [Qtext]=@QuesText , [Qtype] =@QuesType, [correct_answer]= @QuesAnswer, [degree]=@QueDegree , [CrsId]= @QuesCrsID
	WHERE [Qid] = @QuesID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch



----delete from question
   go 
   create proc DeleteFromQuestions @QuesID INT
AS
   begin try
	DELETE FROM [dbo].[question]
	WHERE  [Qid]= @QuesID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
go

go



---insert into student 

create PROC insertintostudent @StID INT, @intackid int, @trackid int, @Name VARCHAR(20), @gender VARCHAR(20), @username varchar(150), @password NVARCHAR(150)
   as begin try
	INSERT INTO [dbo].[student]
	VALUES(@StID, @intackid , @trackid, @Name, @gender, @username, @password)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch



-----select from student
   go
   create PROC selectfromstudent  @StID INT
AS
   begin try
	select * FROM student 
	WHERE st_id = @StID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch


   go
   -------update student
   create proc updatestudent @StID INT, @intackid int, @trackid int, @Name VARCHAR(20), @gender VARCHAR(20), @username varchar(150), @password NVARCHAR(150)
AS
   begin try
	UPDATE student 
	SET  [intake_id]= @intackid ,[track_id]=@trackid , [name] = @Name, [gender]=@gender,username =@username , password =@password
	WHERE st_id = @StID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch



   ---delete from student

     go 
   create proc DeleteFromstudent @StID INT
AS
   begin try
	DELETE FROM [dbo].[student]
	WHERE  st_id = @StID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
go




----insertinto student answer
create PROC InsertIntoStudentAnswers @StID INT, @ExID INT, @QuesID INT, @Answer VARCHAR(1),@iscorrect bit
AS
   begin try
	INSERT INTO [dbo].[student_answers]
	VALUES(@StID, @ExID, @QuesID, @Answer, @iscorrect)	
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch

  
  go
  --- select from student anwser
create proc selectfromstudentAnswer @StID INT, @ExID INT
AS
   begin try
	select * FROM student_answers
	WHERE student_id = @StID AND exam_id = @ExID 
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch

   go 

   ---update student Answer

   create PROC updatestudentanswer @StID INT, @ExID INT, @QuesID INT, @Answer VARCHAR(1),@iscorrect bit
AS
   begin try
	UPDATE [dbo].[student_answers]
	SET student_answer = @Answer, Iscorrect = @iscorrect	
	WHERE student_id = @StID AND exam_id = @ExID AND question_id = @QuesID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch



   go
   ---delete from student answer
   create proc deletefromStudentAnswer @StID INT, @ExID INT, @QuesID INT
   as begin try
   delete from [dbo].[student_answers]  
   where student_id = @StID AND exam_id = @ExID AND question_id = @QuesID
   end try 
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch

   go



   --student_course insert into -- 
   create  PROC InsertIntoStudentCourse @StID INT, @CrsID INT
AS
   begin try
	INSERT INTO [dbo].[student_crs]
	VALUES(@StID, @CrsID)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch

   go
   ---select from student_course

   create proc  selectFromStudentCourse @StID INT, @CrsID INT
AS
   begin try
	select * FROM student_crs
	WHERE stu_id = @StID AND crs_id = @CrsID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch


   go
   --delete from studeent_course

   create proc deletefromstudentcourse  @StID INT, @CrsID INT
AS   
   begin try
	DELETE FROM student_crs
	WHERE stu_id = @StID AND crs_id = @CrsID
  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch 



   go 

   -- insert into track 

   create proc insertintotrack @track_id int , @Name varchar(100)
   as 
   begin try
   insert into [dbo].[track] values (@track_id,@Name)
   end try 
   begin catch
   select ' Error : DUPLICATED Value'
   end catch

   go
   --select from track --
  create proc selectfromtrack @track_id int 
  as 
  begin try
  select  *  from [dbo].[track] 
  where track_id = @track_id
  end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 


  go

  --- update track 

  create proc updatetrack @track_id int , @Name varchar(100)
   as 
  begin try
 update  [dbo].[track] 
  set track_name = @Name
  where track_id= @track_id
  end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 



  go

  ---delete from track
  create proc deletetrack @track_id int 
  as
  begin try 
  delete from [dbo].[track] where track_id =@track_id
    end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 


  go


  ----student_exam insert 
  create proc insertinto_student_examinsert @exam_id int , @StId int , @strart time , @end time , @Date_exam datetime 
  as begin try 
  insert into [dbo].[student_exam] values (@exam_id,@StId,@strart,@end,@Date_exam)
  end try 
  begin catch 
  select 'Error :DUPLICATED Value '
  end catch 



  -------select from studen exam 

  go 
  create proc selectfrom_student_exam  @exam_id int , @StId int
  as 
  begin try
  select * from [dbo].[student_exam] where exam_id =@exam_id and student_id =@StId
  end try 
  begin catch
  select 'Error :NOT EXISTED Value'
  end catch


  go 


  ----update student exam 

  create proc updatestudent_exam @exam_id int , @StId int , @strart time , @end time , @Date_exam datetime 

  as 
  begin try 
  update [dbo].[student_exam] set StartTime =@strart , Endtime =@end ,Date_Exam =@Date_exam
  where exam_id =@exam_id and student_id =@StId
  end try 
  begin catch 
  select 'Error : NOT EXISTED Value'
  end catch


  go 

  ----delete from student exam 

  create proc deletestudent_exam  @exam_id int , @StId int 
  as 
  begin try
   delete from [dbo].[student_exam] where exam_id =@exam_id and student_id=@StId
   end try 
   begin catch 
   select 'Error : NOT EXISTED Value'
   end catch


