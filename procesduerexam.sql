use [OnlineExame]

go

----generate exam auto
 create or alter PROC ExamGeneration @CrsName VARCHAR(10), @NoOfTFQ INT, @NoOfMCQ INT ,@type varchar(50) , @starttime datetime , @endtime datetime
 AS
   begin try
	DECLARE @CrsID INT
	SELECT @CrsID = c.CrsId
	FROM [dbo].[course]c
	WHERE c.CrsName = @CrsName

    -- Assigning the value of ExamID according to UNIX_TIMESTAMP
	DECLARE @ExamID INT
	SELECT @ExamID = DATEDIFF(SECOND,'1970-01-01', GETUTCDATE())
	
	-- Assigning the value of the current date to @ExamDate variable
	DECLARE @ExamDate DATE
	SELECT @ExamDate = GETDATE()

	-- Assigning the value of the course  instructor to @InsID variable and get id of instrustor of this course
	DECLARE @InsID INT
	SELECT @InsID =  I.ins_id
	from instructor i inner join course c on i.ins_id =c.ins_ID and c.CrsName = @CrsName
	--FROM  Course_instructor i where i.CourseID =@CrsID



	-- Checking if the course name is invalid 
	if not exists (select c.CrsName from Course c where c.CrsName=@CrsName)
		select 'ERROR:incorrect course name'
	else
		begin
			if ((@NoOfTFQ+@NoOfMCQ)>10)
				select 'ERROR:questions more than 10'
			else if ((@NoOfTFQ < 1) OR (@NoOfMCQ < 1))
			SELECT 'ERROR:at least one question must be entered for each type'

			else if (@starttime > @endtime)
			select 'Error you cannot enter start time greater than end time'
			else
				begin
					-- Inserting the required data inside Exam table
					execute [dbo].[addExamSP]  @ExamID,@CrsID,@InsID,@type, @starttime,@endtime,@ExamDate
	
					-- Inserting the IDs of TFQ into ExamQuestion table
					INSERT INTO  [dbo].[exam_question]
					SELECT TOP(@NoOfTFQ) @ExamID, q.Qid
					FROM Question q
					WHERE q.Qtype = 'TFQ' AND q.CrsId = @CrsID AND q.Qtext IS NOT NULL
					ORDER BY NEWID()

					-- Inserting the IDs of MCQ into ExamQuestion table
					INSERT INTO [dbo].[exam_question]
					SELECT TOP(@NoOfMCQ) @ExamID, q.Qid
					FROM Question q
					WHERE q.Qtype = 'MCQ' AND q.CrsId = @CrsID  AND q.Qtext IS NOT NULL
					ORDER BY NEWID()
				end
		end
	end try
	begin catch
		select 'ERROR:check your inputs'
	end catch

	exec ExamGeneration 'oop', 3,6,'General','2024/08/12 09:00','2024/08/12 11:00' 

	go



	go

	---  manual exam ------
	CREATE OR ALTER PROC ExamGenerationManual 
    @CrsName VARCHAR(10),
    @SelectedQuestionsCSV NVARCHAR(MAX),
    @type VARCHAR(50),
    @starttime DATETIME,
    @endtime DATETIME
AS
BEGIN TRY
    DECLARE @CrsID INT
    SELECT @CrsID = c.CrsId
    FROM [dbo].[course] c
    WHERE c.CrsName = @CrsName

    -- Assigning the value of ExamID according to UNIX_TIMESTAMP
    DECLARE @ExamID INT
    SELECT @ExamID = DATEDIFF(SECOND, '1970-01-01', GETUTCDATE())

    -- Assigning the value of the current date to @ExamDate variable
    DECLARE @ExamDate DATE
    SELECT @ExamDate = GETDATE()

    -- Assigning the value of the course's instructor to @InsID variable and get id of instructor of this course
    DECLARE @InsID INT
    SELECT @InsID = I.ins_id
    FROM instructor i
    INNER JOIN course c ON i.ins_id = c.ins_ID AND c.CrsName = @CrsName

    -- Checking if the course name is invalid 
    IF NOT EXISTS (SELECT c.CrsName FROM Course c WHERE c.CrsName = @CrsName)
        SELECT 'ERROR: incorrect course name'
    ELSE
        BEGIN
            IF ((LEN(@SelectedQuestionsCSV) - LEN(REPLACE(@SelectedQuestionsCSV, ',', '')) + 1) > 10)
                SELECT 'ERROR: questions more than 10'
            ELSE IF ((LEN(@SelectedQuestionsCSV) - LEN(REPLACE(@SelectedQuestionsCSV, ',', '')) + 1) < 1)
                SELECT 'ERROR: at least one question must be entered'

            ELSE IF (@starttime > @endtime)
                SELECT 'Error: you cannot enter start time greater than end time'
            ELSE
                BEGIN
                    -- Inserting the required data inside Exam table
                    EXEC [dbo].[addExamSP] @ExamID, @CrsID, @InsID, @type, @starttime, @endtime, @ExamDate

                    -- Inserting the IDs of selected questions into ExamQuestion table
                    INSERT INTO [dbo].[exam_question]  ([exam_id],[question_id] )
                    SELECT @ExamID, CAST(value AS INT)
                    FROM STRING_SPLIT(@SelectedQuestionsCSV, ',')
                END
        END
END TRY
BEGIN CATCH
    SELECT 'ERROR: check your inputs'
END CATCH

exec ExamGenerationManual 'c#','120,121,122,123,150,151' ,'General','2024/01/25 09:00','2024/01/25 11:00'

select * from exam


	go
	-----get exam question ------
	CREATE or alter PROC GetExamQuestions @ExID INT
    AS
	SELECT Q.Qtext,Q.Qid, ISNULL(MCQ.choise_text, 'T or F') AS Choices
	FROM exam_question eq INNER JOIN Question Q
	ON Q.Qid = eq.question_id AND eq.exam_id = @ExID
	LEFT JOIN [dbo].[mcq_choise] MCQ
	ON Q.Qid = MCQ.Qid

	exec GetExamQuestions 1704823594

	select e.exam_id from [dbo].[exam]e


	 go


 ----- add exam to student_sxame table to make him able to take this exam
---- this for instructor to insert student and exam id time 
----  this will handel to make only ins to insert --
	 create or alter proc checkaddStudenttoExam @exam_id int , @st_id int , @ins_id int ,@starttime time , @endtime time ,@date_exam datetime
	 as 
	 begin   
	
	if exists (select c.CrsId, sc.stu_id from course c join exam e  
      on c.CrsId = e.course_id and e.exam_id =@exam_id 
	  join student_crs sc on c.CrsId = sc.crs_id and sc.stu_id=@st_id )
	begin
	exec [dbo].[insertinto_student_examinsert] @exam_id,@st_id,@starttime,@endtime ,@date_exam
	end 
	else begin 
	select 'Error instructor must be in the same course of student '
	end
	end 

	exec checkaddStudenttoExam 1704823594, 2, 5, '10:00' , '11:00', '2024/02/01 10:00';



	--- answer of student ---
	--- need try and catch 
    ---proc to submit answer for student and chect if he in table exam_student
	   go
	   create or alter proc studentans  @question_id int ,@Answer varchar(1) ,@st_id int , @exam_id int 
	   as begin 
	
	   if exists (select @st_id , @exam_id from   [dbo].[student_exam]s where  s.student_id =@st_id and s.exam_id =@exam_id)
	    exec [dbo].[InsertIntoStudentAnswers] @st_id,@exam_id ,@question_id ,@Answer , null  
	   end 

	   exec studentans 120,'b', 2,1704823594
	   --1704756465

	   ---select for  check coreect answer with student answer  
	   select q.Qid, sa.student_answer,  q.[correct_answer] from [dbo].[student_answers]sa 
	   inner join  [dbo].[question]q on sa.question_id = q.Qid


go



---- check if answer is correct or not and update is correct column  

create proc checkanswerofstudent @st_id int,@question_id int , @exam_id int  
as
begin

UPDATE sa
SET sa.[IsCorrect] = CASE WHEN sa.[student_answer] = q.[correct_answer] THEN 1 ELSE 0 END
FROM [dbo].[student_answers] sa
INNER JOIN [dbo].[question] q ON sa.[question_id] = q.[Qid];

end
exec checkanswerofstudent 2 ,201,1704823594 


go



----view to insert name  user name track name ,intake,branch 
create or alter view studentinfo
as
select distinct(s.name),s.st_id ,s.username,t.track_name , i.intake_name ,b.branch_city
from student s inner join track t on t.track_id =s.track_id 
inner join intake i on i.intake_id =s.intake_id  inner join  student_crs sc on sc.stu_id =s.st_id 
inner join department_branch db on db.student_id = s.st_id ,branch b
where s.track_id = t.track_id
and s.intake_id = i.intake_id
and s.st_id = db.student_id
and db.branch_id =b.branch_id
go



--for searching on Std with different options
create or alter proc search_student_sp  @st_id int = null, @username nvarchar(50) = null
as 
begin 
	if @st_id is not null
	begin
		select * from studentinfo 
		where st_id = @st_id
	end
	else
	begin
		if @username is not null
		begin
			select * from studentinfo 
			where username = @username
		end
			else
			begin
				print 'you should search with one option at least'
			end
		end
	end



exec search_student_sp 3 --id
exec search_student_sp @username ='ibrahim135'

 
 ----create view for exam
 
 go 
CREATE OR ALTER VIEW ExamquestionInfo
AS
SELECT
    eq.exam_id,
    c.CrsName,
    e.start_time,
    e.end_time,
    e.exam_date,
    e.total_time,
    IIF(e.exam_type = 'general', 'Normal Exam', 'Corrective') AS 'Exam Status',
    ap.allowance_option
FROM
    exam_question eq
JOIN
    exam e ON eq.exam_id = e.exam_id
JOIN
    course c ON e.course_id = c.CrsId
LEFT JOIN
    student_answers sa ON eq.exam_id = sa.exam_id
LEFT JOIN
    allowance_option ap ON e.exam_id = ap.examID
GROUP BY
  eq.exam_id, c.CrsName, e.start_time, e.end_time, e.exam_date, e.exam_type, ap.allowance_option, e.total_time;


  ---select  all in view exam
  select * from ExamquestionInfo
  ----1704755698
  ----1704756048
  --- 1704756465


go
--for searching on Exam with different options
CREATE OR ALTER PROC SearchOnExamSP
    @exam_id INT = NULL,
    @CrsTitle NVARCHAR(50) = NULL
AS
BEGIN
    IF @exam_id IS NOT NULL
    BEGIN
        SELECT * FROM ExamquestionInfo
        WHERE exam_id = @exam_id;
    END
    ELSE
    BEGIN
        IF @CrsTitle IS NOT NULL
        BEGIN
            SELECT * FROM ExamquestionInfo
            WHERE CrsName = @CrsTitle;
        END
        ELSE
        BEGIN
            PRINT 'You should search with one option at least';
        END
    END
END;


----show the result of search 
exec SearchOnExamSP 1704756465 
exec SearchOnExamSP default,'sql'


go




-----calculate the dgree of student --
---- this is check code 
DECLARE @stdgree TABLE (student_id INT, total_degree INT);
insert into @stdgree (student_id, total_degree)
SELECT s.student_id, SUM(q.degree) AS total_degree
FROM [dbo].[student_answers] s
JOIN exam_question e ON s.exam_id = e.exam_id AND s.question_id = e.question_id
JOIN [dbo].[question] q ON s.question_id = q.Qid
WHERE s.IsCorrect = 'true'
GROUP BY s.student_id;

select *from @stdgree

go




---------main function to show the results of student
-----convert it to function 


    
CREATE OR ALTER FUNCTION dbo.CalculateTotalDegree()
RETURNS TABLE
AS
RETURN
(
    SELECT s.student_id,stu.name, SUM(q.degree) AS total_degree
    FROM [dbo].[student_answers] s
    JOIN exam_question e ON s.exam_id = e.exam_id AND s.question_id = e.question_id
    JOIN [dbo].[question] q ON s.question_id = q.Qid
	JOIN [dbo].[student] stu ON s.student_id = stu.st_id
    WHERE s.IsCorrect = 'true'
    GROUP BY s.student_id ,stu.name
);

select *from dbo.CalculateTotalDegree()

go

---add it to view that show students result 


CREATE OR ALTER VIEW StudentTotalDegreeView AS
SELECT *
FROM dbo.CalculateTotalDegree();

    ---show this view of students degree 
select *from StudentTotalDegreeView



-----commaned sql --------- 
--1704756465

select * from [dbo].[exam_question] where [exam_id] =1704823594

select [degree] from [dbo].[question] where [Qid] in (170,173,174,201,202)
	  -- select * from [dbo].[question]
	  

go


select  c.CrsId , s.st_id from course c inner join student_crs sc  
on c.CrsId = sc.crs_id  inner join student s on s.st_id = sc.stu_id 
inner join exam e on c.CrsId = e.course_id


select c.CrsId, sc.stu_id from course c join exam e  
on c.CrsId = e.course_id join student_crs sc on c.CrsId = sc.crs_id





