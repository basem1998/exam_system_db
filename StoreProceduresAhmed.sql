---------Allowence Options-------------------------------------
--SP to insert into Allowence Options table

use [OnlineExame]
go
CREATE PROC InsertIntoAllowenceOptionsTable @ExamID INT, @Allowence_Option VARCHAR(40)
AS
	INSERT INTO [dbo].[allowance_option]
	VALUES(@ExamID,@Allowence_Option )

--SP to update Allowence Options table

go
CREATE PROC UpdateAllowenceOptionsTable @ExamID INT, @Allowence_Option VARCHAR(40)
AS
    begin try
	UPDATE [dbo].[allowance_option]
	SET [allowance_option] = @Allowence_Option
	WHERE [examID] = @ExamID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch
	go
--SP to delete from Allowence Options table
CREATE PROC DeleteFromAllowenceOptionsTable @ExamID INT
AS
   begin try
	DELETE FROM [dbo].[allowance_option]
	WHERE [examID] = @ExamID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch
   go
--SP to Display Allowence Options table
CREATE PROC disolayTableAllowenceOptionsTable @ExamID INT
AS
   begin try
	select * FROM [dbo].[allowance_option]
	WHERE [examID] = @ExamID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch
---------Branch-------------------------------------
--SP to insert into branch table
go
CREATE PROC InsertIntoBranchTable @BranID INT, @BranCity VARCHAR(20)
AS
	INSERT INTO branch
	VALUES(@BranID, @BranCity)

--SP to update branch table
go
CREATE PROC UpdateBranchTable @BranID INT, @BranCity VARCHAR(20)
AS
    begin try
	UPDATE [dbo].[branch]
	SET [branch_city] = @BranCity
	WHERE [branch_id] = @BranID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch

--SP to delete from branch table
go
CREATE PROC DeleteFromTableBranch @BranID INT
AS
   begin try
	DELETE FROM [dbo].[branch]
	WHERE [branch_id] = @BranID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch

--SP to Display branch table
go
CREATE PROC disolayTableBranch @BranID INT
AS
   begin try
	select * FROM [dbo].[branch]
	WHERE [branch_id] = @BranID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch

---------Class-------------------------------------
go
--SP to insert into class table
CREATE PROC InsertIntoClassTable @ClassName VARCHAR(20)
AS
	INSERT INTO [dbo].[Class]
	VALUES(@ClassName)

--SP to update class table
go
CREATE PROC UpdateClassTable  @ClassName  VARCHAR(20) , @ClassID int
AS
    begin try
	UPDATE [dbo].[Class]
	SET [ClassName] = @ClassName
	WHERE [ClassId] = @ClassID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch

--SP to delete from class table
go
CREATE PROC DeleteFromTableClass @ClassID INT
AS
   begin try
	DELETE FROM [dbo].[Class]
	WHERE [ClassId] = @ClassID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch

--SP to Display class table
go
CREATE PROC disolayTableClass @ClassID INT
AS
   begin try
	select * FROM [dbo].[Class]
	WHERE [ClassId] = @ClassID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch

---------Course-------------------------------------
--SP to insert into Course table
go
CREATE PROC InsertIntoCourseTable @CrsID INT,@CrsInsID INT, @CrsName VARCHAR(20), @CrsDescription varchar(100), @PoolName varchar(100) , @MaxDegree int ,@MinDegree int
AS
   begin try
	INSERT INTO Course
	VALUES(@CrsID,@CrsInsID, @CrsName, @CrsDescription,@PoolName,@MaxDegree, @MinDegree)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch

   go
--SP to update Course table
CREATE PROC UpdateCourseTable @CrsID INT,@CrsInsID INT, @CrsName VARCHAR(20), @CrsDescription varchar(100), @PoolName varchar(100) , @MaxDegree int ,@MinDegree int
AS
   begin try
	UPDATE Course
	SET CrsName = @CrsName, [ins_ID]= @CrsInsID, [Description] = @CrsDescription , [QpoolName]=@PoolName ,[Max_degree] =@MaxDegree ,[Min_Degree] = @MinDegree
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch
   go
--SP to delete from Course table
CREATE PROC DeleteFromCourseTable @CrsID INT
AS
   begin try
	DELETE FROM Course
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED Value '
   end catch

--SP to Display Course table
go
CREATE PROC selectFromTableCourse @CrsID INT
AS
   begin try
	select * FROM Course
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED ID '
   end catch

---------Course_Instructor-------------------------------------
--SP to insert into Course_Instructor table
go
CREATE PROC InsertIntoCourse_InstructorTable @CrsID INT,@CrsInsID int ,@ClassID int
AS
   begin try
	INSERT INTO Course_instructor
	VALUES(@ClassID,@CrsID,@CrsInsID )
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch


   go

--SP to Display Course_Instructor table
CREATE PROC selectFromTableCourse_Instructor @CrsID INT , @ClassID INT ,@InstructorID INT
AS
   begin try
	select * FROM [dbo].[Course_instructor]
	WHERE [CourseID] = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED ID '
   end catch

---------Departement-------------------------------------
--SP to insert into Departement table
go
CREATE PROC InsertIntoDepartementTable @DeptID int , @DeptName VARCHAR(20)
AS
	INSERT INTO [dbo].[departement]
	VALUES(@DeptID  ,@DeptName)

--SP to update Departement table
go
CREATE PROC UpdateDepartementTable  @DeptName  VARCHAR(20) , @DeptID int
AS
    begin try
	UPDATE [dbo].[departement]
	SET [dept_name] = @DeptName
	WHERE [dept_id] = @DeptID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch

--SP to delete from Departement table
go
CREATE PROC DeleteFromTableDepartement @DeptID INT
AS
   begin try
	DELETE FROM [dbo].[departement]
	WHERE [dept_id] = @DeptID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch

--SP to Display Departement table
go
CREATE PROC disolayTableDepartement @DeptID INT
AS
   begin try
	select * FROM [dbo].[departement]
	WHERE [dept_id] = @DeptID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch


