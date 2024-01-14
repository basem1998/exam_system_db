--------------------------------------------------Indexes-----------------------------------
create nonclustered index IX_StdAnswers_StdQstId
on [dbo].[student_answers]([student_id], [question_id])

create nonclustered index courseName_IX
on [dbo].[course] ([CrsName])

create nonclustered index Stu_Intake_User
on [dbo].[student] ([track_id],[username])

create nonclustered index questionByCourse
on [dbo].[question]([CrsId])

create nonclustered index Exam_date_IX
on [dbo].[student_exam]([Date_Exam])