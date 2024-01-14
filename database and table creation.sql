create database OnlineExame
ON PRIMARY
  (name = 'ExamSystem_Data',
  filename = 'E:\ITI\projects\sqlproject\ExamSystem_Data.mdf',
  size = 20MB,
  maxsize = 200MB,
  filegrowth = 10MB),

filegroup QuestionsFileGroup
  (name = 'ExamSystem_FG1',
  filename = 'E:\ITI\projects\sqlproject\ExamSystem.ndf',
  size = 20MB,
  maxsize = 200MB,
  filegrowth = 10MB)
log on
  (name = 'ExamiSystem_Log',
  filename = 'E:\ITI\projects\sqlproject\ExamSystem_Log.ldf',
  size = 20MB,
  maxsize = 200MB,
  filegrowth = 10MB)


use OnlineExame

---done
  create table instructor 
(
ins_id int ,
Super_id int ,
name varchar(25) not null,
userName varchar(25) not null ,
password varchar (25) not null,
constraint instructor_PK primary key (ins_ID),
constraint instructor_FK foreign key (Super_id)  references instructor (ins_id)
)
 
 --done
create table course (
     CrsId int primary key,
	 ins_ID int ,
     CrsName varchar(25) not null,
	Description varchar(100) not null,
	QpoolName varchar(100) unique,
    Max_degree int not null,
	Min_Degree int not null,
	constraint course_instructor_FK foreign key (ins_ID)  references instructor (ins_ID)
)
--- done
create table branch (
    branch_id int primary key,
    branch_city varchar(20) not null
)
--done
create table intake (
    intake_id int primary key,
    intake_name varchar(50) not null,
	
)

--done
create table departement (
    dept_id int primary key,
    dept_name varchar(25) not null,
)
---done
 create table department_branch
(
  dept_id int ,
  branch_id int, 
  student_id int ,
  constraint dept_branch_pk primary key (dept_id  , branch_id ,  student_id),
  constraint dept_branch_depart_fk foreign key (dept_id) references  departement(dept_id),
  constraint dept_branch_branch_fk foreign key (branch_id) references branch(branch_id),
  constraint dept_branch_student_fk foreign key (student_id )references student(st_id)

)
 

--done 
create table track (
    track_id int primary key,
    track_name varchar(50) not null ,
	
)
--done
create table student (
    st_id int primary key,
    branch_id int,
    intake_id int,
    track_id int,
    name varchar(50) not null,
    gender varchar(10) not null,
    username varchar(50)not null unique,
    password varchar(50) not null,
    constraint student_branch_fk foreign key (branch_id) references branch(branch_id),
    constraint student_intake_fk foreign key (intake_id) references intake(intake_id),
    constraint student_track_fk foreign key (track_id) references track(track_id)
)

---done
create table exam (
    exam_id int primary key,
    course_id int,
	ins_id int,
    exam_type varchar(50) not null,
    start_time datetime not null,
    end_time datetime not null,
    total_time int,
    exam_date date,
    constraint exam_course_fk foreign key (course_id) references course(CrsId),
	constraint exam_ins_fk foreign key (ins_id) references instructor(ins_id)
)


--done
create table allowance_option
(
	examID int ,
	allowance_option varchar(250) ,
	constraint allowance_option_PK primary key (examID, allowance_option),
	constraint allowance_option_FK foreign key (examID) references exam (exam_id)
)

--done
create table question (
    Qid int primary key,
    Qtext varchar(max) not null,
	Qtype varchar(20) not null,
    correct_answer varchar(max) not null,
    degree int not null,
	CrsId int, 
	constraint CrsId_FK foreign key (CrsId)  references course (CrsId)
)
--done
create table mcq_choise (
     Qid int,
    choise_text varchar(200) ,
    Iscorrect bit,
    full_degree int,
	constraint mcqchoise_pk primary key (Qid ,choise_text)  ,
	constraint mcqchoise_fk foreign key (Qid)  references question (Qid)
)






create table Class
(
	ClassId int primary key Identity(1,1),
	ClassName varchar(20) not null,	
)

CREATE TABLE Course_instructor 
 (  
    classId int ,
    CourseID int ,
    InstructorID int , 
    CONSTRAINT Course_ins_ins_fk  FOREIGN KEY (InstructorID) REFERENCES instructor(ins_id),
    CONSTRAINT Course_ins_course_fk FOREIGN KEY( CourseID )REFERENCES course(CrsId),
	CONSTRAINT Course_ins_class_fk FOREIGN KEY( classId )REFERENCES class(classId),

    CONSTRAINT CourseInstructor_PK PRIMARY KEY (classId,CourseID,InstructorID) 
)

--done
create table student_crs (
    stu_id int,
    crs_id int,
    primary key (stu_id, crs_id),
    foreign key (stu_id) references student(st_id),
    foreign key (crs_id) references course(CrsId)
)

--done
create table student_exam(
    
    exam_id int,
    student_id int,
    StartTime time,
	Endtime Time,
	Date_Exam datetime,
    constraint studentExam_Exam_fk foreign key (exam_id) references exam(exam_id),
    constraint studentExam_student_fk foreign key (student_id) references student(st_id)
)

--done
create table student_answers (
    
    student_id int,
    exam_id int,
	question_id int,
    student_answer varchar(255) ,
    Iscorrect bit ,
    constraint studentAns_pk primary key (question_id, student_id,exam_id),
    constraint studentAnswer_exam_fk foreign key (exam_id) references exam(exam_id) ,
    constraint studentAnswer_question_fk foreign key (question_id) references question(Qid),
    constraint studentAnswers_student_fk foreign key (student_id) references student(st_id)   
)
--done
create table exam_question (
    exam_id int,
    question_id int,
    constraint examQuestion_pk primary key (exam_id,question_id),
    constraint examQuestion_exam_fk foreign key (exam_id) references exam (exam_id),
    constraint examQuestion_fk foreign key (question_id) references question(Qid)
)
