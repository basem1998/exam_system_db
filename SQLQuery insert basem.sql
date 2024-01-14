INSERT INTO instructor (ins_id, Super_id, name, userName, password)
VALUES 


(1, NULL, 'Ahmed', 'Ahmed_ali', 'ahmed123'),
(2, 1, 'Khaled', 'Khaled_m', 'Kh100'),

(3, 2, 'Mohamed', 'Mohamed_ali', 'mpass'),
(4, 1, 'Fatima Hassan', 'fatima_hassan', 'pass456'),
(5, 1, 'Samy', 'Samy_ahmed', 'Kh100'),

(6, 3, 'Kairy', 'khairy_ali', 'Kh600');


INSERT INTO course (CrsId, ins_ID, CrsName, Description, QpoolName, Max_degree, Min_Degree)
VALUES 
(1, 1, 'Introduction_Programming', 'Basic programming concepts and logic', 'Programming_Qpool', 100, 50),
(2, 2, 'Database Management', 'Fundamentals of database design and management', 'DB_Qpool', 100, 50),
(3, 5, 'Web Development Basics', 'Introduction to web development technologies', 'Web_Qpool', 100, 50),
(4, 6, 'Software Engineering ', 'Key principles in software engineering', 'SE_Qpool', 100, 50),
(5, 4, 'Mobile App Development', 'Building mobile applications for iOS and Android', 'Mobile_Qpool', 100, 50),
(6, 2, 'Data Structures ', 'Advanced data structures and algorithm analysis', 'DSA_Qpool', 100, 50);

INSERT INTO Class (ClassName)
VALUES 
('Class A'),
('Class B'),
('Class C'),
('Class D'),
('Class E');


INSERT INTO Course_instructor (classId, CourseID, InstructorID)
VALUES 
(1, 2, 4),
(2, 6, 3),
(3, 1, 1),
(4, 4, 2),
(5, 5, 5),
(1, 6, 6),
(2, 1, 2),
(3, 2, 4);

-- Insert data into the 'question' table




-- Insert data into the 'question' table
INSERT INTO question (Qid, Qtext, Qtype, correct_answer, degree, CrsId)
VALUES 
(100, 'Which SQL function is used to count the number of rows in a SQL query?', 'MCQ', 'D', 1, 1),
(101, 'Which SQL keyword is used to retrieve a maximum value?', 'MCQ', 'C', 1, 1),
(102, 'Which of the following SQL clauses is used to DELETE tuples from a database table?', 'MCQ', 'A', 1, 1),
(103, '___________ removes all rows from a table without logging the individual row deletions.', 'MCQ', 'D', 1, 1),
(104, 'Which of the following is not a DDL command?', 'MCQ', 'A', 1, 1),
(105, 'Which of the following are TCL commands?', 'MCQ', 'D', 1, 1),
(106, '________________ is not a category of SQL command.', 'MCQ', 'B', 1, 1),
(107, 'If you don’t specify ASC or DESC after a SQL ORDER BY clause, the following is used by default ______________.', 'MCQ', 'A', 1, 1),
(108, 'Which of the following statement is true?', 'MCQ', 'A', 1, 1),
(109, 'What is the purpose of the SQL AS clause?', 'MCQ', 'A', 1, 1),
(110, 'Management Studio is ________ used for development of SQL Server database.', 'MCQ', 'A', 1, 1),
(111, 'Which panel presents a list of objects under the selected node?', 'MCQ', 'B', 1, 2),
(112, 'Template Explorer is used to manage ____________.', 'MCQ', 'A', 1, 2),
(113, 'Which of the following shortcut is used for displaying error list?', 'MCQ', 'C', 1, 2),
(114, '_____________ is not available on the standard toolbar.', 'MCQ', 'A', 1, 2),
(115, 'Which command is used to reset default configuration in SSMS?', 'MCQ', 'D', 1, 2),
(116, '_________ is a tool in SSMS used to manage multiple servers.', 'MCQ', 'A', 1, 2),
(117, 'Which of the following is a database object?', 'MCQ', 'D', 1, 2),
(118, 'Which of the following tools is used for designing the schema of the database in SSMS?', 'MCQ', 'C', 1, 2),
(119, 'Which of the following pane options is not provided by Query Designer?', 'MCQ', 'D', 1, 3),
(120, 'SMO in SQL Server stands for ___________.', 'MCQ', 'D', 1, 3),
(121, 'Which of the following features is not provided by SSS 2008?', 'MCQ', 'A', 1, 3),
(122, 'Ctrl+K+K shortcut refers to ___________.', 'MCQ', 'B', 1, 3),
(123, 'Which of the following shortcuts is used to clear all bookmarks?', 'MCQ', 'A', 1, 3),
(124, '__________ menu allows the user to set up some keyboard shortcuts.', 'MCQ', 'C', 1, 3),
(150, 'The condition in a WHERE clause can refer to only one value.', 'TFQ', 'F', 1, 3),
(151, 'The ADD command is used to enter one row of data or to add multiple rows as a result of a query.', 'TFQ', 'F', 1, 3),
(152, 'SQL provides the AS keyword, which can be used to assign meaningful column names to the results of queries using the SQL built-in functions.', 'TFQ', 'T', 1, 3),
(153, 'The SELECT command, with its various clauses, allows users to query the data contained in the tables and ask many different questions or ad hoc queries.', 'TFQ', 'T', 1, 3),
(154, 'A SELECT statement within another SELECT statement and enclosed in square brackets ([...]) is called a subquery.', 'TFQ', 'F', 1, 3),
(155, 'The rows of the result relation produced by a SELECT statement can be sorted, but only by one column.', 'TFQ', 'F', 1, 3),
(156, 'There is an equivalent join expression that can be substituted for all subquery expressions.', 'TFQ', 'F', 1, 3),
(157, 'A dynamic view is one whose contents materialize when referenced.', 'TFQ', 'T', 1, 3),
(158, 'SQL is a programming language.', 'TFQ', 'F', 1, 4),
(159, 'SELECT DISTINCT is used if a user wishes to see duplicate columns in a query.', 'TFQ', 'F', 1, 4),
(160, 'Indexes can usually be created for both primary and secondary keys.', 'TFQ', 'T', 1, 4),
(161, 'Each index consumes extra storage space and also requires overhead maintenance time whenever indexed data change value.', 'TFQ', 'T', 1, 4),
(162, 'The HAVING clause acts like a WHERE clause, but it identifies groups that meet a criterion, rather than rows.', 'TFQ', 'T', 1, 4),
(163, 'SQL is a data sublanguage.', 'TFQ', 'T', 1, 1),
(164, 'The qualifier DISTINCT must be used in an SQL statement when we want to eliminate duplicate rows.', 'TFQ', 'T', 1, 4),
(165, 'DISTINCT and its counterpart, ALL, can be used more than once in a SELECT statement.', 'TFQ', 'F', 1, 4),
(166, 'The result of every SQL query is a table.', 'TFQ', 'T', 1, 4),
(167, 'COUNT(field_name) tallies only those rows that contain a value; it ignores all null values.', 'TFQ', 'T', 1, 4),
(168, 'SUM, AVG, MIN, and MAX can only be used with numeric columns.', 'TFQ', 'F', 1, 4),
(169, 'Most companies keep at least two versions of any database they are using.', 'TFQ', 'T', 1, 4),
(170, 'The format SELECT-FROM-WHERE is the fundamental framework of SQL SELECT statements.', 'TFQ', 'T', 1, 5),
(171, 'Indexes may be created or dropped at any time.', 'TFQ', 'T', 1, 5),
(172, 'The SQL statement: SELECT Number1 + Number 2 AS Total FROM NUMBER_TABLE; adds two numbers from each row together and lists the results in a column named Total.', 'TFQ', 'T', 1, 5),
(173, 'ORDER BY can be combined with the SELECT statements.', 'TFQ', 'T', 1, 5),
(174, 'Data manipulation language (DML) commands are used to define a database, including creating, altering, and dropping tables and establishing constraints.', 'TFQ', 'F', 1, 5),
(200, 'The capability of an object in C# to take a number of different forms and hence display behavior as according is known as ___________.', 'MCQ', 'B', 2, 2),
(201, 'What will be the output of the following C# code? \n\n public class sample { \n public static int x = 100; \n public static int y = 150; \n } \n public class newspaper :sample { \n new public static int x = 1000; \n static void Main(string[] args) { \n console.writeline(sample.x + " " + sample.y + " " + x); \n } \n }', 'MCQ', 'C', 2, 5),
(202, 'Which of the following keyword is used to change data and behavior of a base class by replacing a member of the base class with a new derived member?', 'MCQ', 'C', 2, 5),
(203, 'Correct way to overload +operator?', 'MCQ', 'D', 2, 2),
(204, 'What will be the correct statement of the following C# code? \n\n public class maths { \n public int x; \n public virtual void a() { \n } \n } \n public class subject : maths { \n new public void a() { \n } \n }', 'MCQ', 'D', 2, 6),
(205, 'Select the sequence of execution of functions f1(), f2() & f3() in C# .NET CODE? \n\n class base { \n public void f1() {} \n public virtual void f2() {} \n public virtual void f3() {} \n } \n class derived :base { \n new public void f1() {} \n public override void f2() {} \n public new void f3() {} \n } \n class Program { \n static void Main(string[] args) { \n baseclass b = new derived(); \n b.f1 (); \n b.f2 (); \n b.f3 (); \n } \n }', 'MCQ', 'B', 2, 6),
(206, 'Which of the following statements is correct?', 'MCQ', 'C', 2, 6),
(207, 'Correct code to be added for overloaded operator – for the following C# code? \n\n class csharp { \n int x, y, z; \n public csharp() { \n } \n public csharp(int a ,int b ,int c) { \n x = a; \n y = b; \n z = c; \n } \n Add the correct set of code here \n public void display() { \n console.writeline(x + " " + y + " " + z); \n } \n } \n class program { \n static void Main(String[] args) { \n csharp s1 = new csharp(5 ,6 ,8); \n csharp s3 = new csharp(); \n s3 = - s1; \n s3.display(); \n } \n }', 'MCQ', 'C', 2, 6),
(208, 'Selecting the appropriate method out of the number of overloaded methods by matching arguments in terms of number, type, and order and binding that selected method to the object at compile time is called?', 'MCQ', 'D', 2, 6),
(209, 'Wrong statement about runtime polymorphism is?', 'MCQ', 'C', 2, 6);


-- Insert data into the 'mcq_choise' table for MCQ questions
INSERT INTO mcq_choise (Qid, choise_text)
VALUES 
(100, 'B) NUMBER()'),
(100, 'C) SUM()'),
(100, 'D) COUNT(*)'),

(101, 'A) MOST'),
(101, 'B) TOP'),
(101, 'C) MAX'),
(101, 'D) UPPER'),

(102, 'A) DELETE'),
(102, 'B) REMOVE'),
(102, 'C) DROP'),
(102, 'D) CLEAR'),

(103, 'A) DELETE'),
(103, 'B) REMOVE'),
(103, 'C) DROP'),
(103, 'D) TRUNCATE'),

(104, 'A) UPDATE'),
(104, 'B) TRUNCATE'),
(104, 'C) ALTER'),
(104, 'D) None of the Mentioned'),

(105, 'A) UPDATE and TRUNCATE'),
(105, 'B) SELECT and INSERT'),
(105, 'C) GRANT and REVOKE'),
(105, 'D) ROLLBACK and SAVEPOINT'),

(106, 'A) TCL'),
(106, 'B) SCL'),
(106, 'C) DCL'),
(106, 'D) DDL'),

(107, 'A) ASC'),
(107, 'B) DESC'),
(107, 'C) There is no default value'),
(107, 'D) None of the mentioned'),

(108, 'A) DELETE does not free the space '),
(108, 'B) Both DELETE and TRUNCATE free the '),
(108, 'C) Both DELETE and TRUNCATE does not free '),
(108, 'D) DELETE free the space containing the table '),

(109, 'A) The AS SQL clause is used to change the name of a column in the result set or to assign a name to a derived column'),
(109, 'B) The AS clause is used with the JOIN clause only'),
(109, 'C) The AS clause defines a search condition'),
(109, 'D) All of the mentioned'),

(110, 'A) Front end tool'),
(110, 'B) Back end tool'),
(110, 'C) Database engine'),
(110, 'D) SQL Server'),

(111, 'A) Template Explorer'),
(111, 'B) Object Explorer'),
(111, 'C) Properties window'),
(111, 'D) Query Editor'),

(112, 'A) T-SQL scripts'),
(112, 'B) Registered Servers'),
(112, 'C) Properties'),
(112, 'D) Query design'),

(113, 'A) Ctrl + /'),
(113, 'B) Ctrl + |'),
(113, 'C) Ctrl + \'),
(113, 'D) Ctrl + !'),

(114, 'A) Error List'),
(114, 'B) Object Explorer'),
(114, 'C) Query Editor'),
(114, 'D) Properties windows'),

(115, 'A) Clear'),
(115, 'B) Hide'),
(115, 'C) Reset all'),
(115, 'D) Reset'),

(116, 'A) Registered Servers'),
(116, 'B) Query Editor'),
(116, 'C) Template Explorer'),
(116, 'D) Context Explorer'),

(117, 'A) Tables'),
(117, 'B) Triggers'),
(117, 'C) Functions'),
(117, 'D) All of the mentioned'),

(118, 'A) Query Designer'),
(118, 'B) Database Diagrams'),
(118, 'C) Table designer'),
(118, 'D) Query Editor'),

(119, 'A) Diagram pane'),
(119, 'B) Grid pane'),
(119, 'C) Results pane'),
(119, 'D) Query pane'),

(120, 'A) Server Management Object'),
(120, 'B) Service Management Object'),
(120, 'C) SQL Management Object'),
(120, 'D) SQL Server Management Object'),

(121, 'A) Automatic formatting'),
(121, 'B) IntelliSense'),
(121, 'C) Code Outlining'),
(121, 'D) SQLCMD'),

(122, 'A) Refresh IntelliSense'),
(122, 'B) Add or remove a bookmark'),
(122, 'C) Enable all bookmarks'),
(122, 'D) Move to the next bookmark'),

(123, 'A) Ctrl+K+L'),
(123, 'B) Ctrl+K+O'),
(123, 'C) Ctrl+K+B'),
(123, 'D) Ctrl+K+P'),

(124, 'A) Edit'),
(124, 'B) File'),
(124, 'C) Tools'),
(124, 'D) None of the Mentioned'),

(200, 'A) Encapsulation'),
(200, 'B) Polymorphism'),
(200, 'C) Abstraction'),
(200, 'D) None of the mentioned'),

(201, 'A) 100 150 1000'),
(201, 'B) 1000 150 1000'),
(201, 'C) 100 150 1000'),
(201, 'D) 100 150 100'),

(202, 'A) Overloads'),
(202, 'B) Overrides'),
(202, 'C) new'),
(202, 'D) base'),

(203, 'A) public sample operator + (sample a, sample b)'),
(203, 'B) public abstract operator + (sample a,sample b)'),
(203, 'C) public static sample operator + (sample a, sample b)'),
(203, 'D) all of the mentioned'),

(204, 'A) The subject class version of a() method gets called using sample class reference which holds subject class object'),
(204, 'B) subject class hides a() method of base class'),
(204, 'C) The code replaces the subject class version of a() with its math class version'),
(204, 'D) None of the mentioned'),

(205, 'A) f1() of derived class get executed\n   f2() of derived class get executed\n   f3() of base class get executed'),
(205, 'B) f1() of base class get executed\n   f2() of derived class get executed\n   f3() of base class get executed'),
(205, 'C) f1() of base class get executed\n   f2() of derived class get executed\n   f3() of derived class get executed'),
(205, 'D) f1() of derived class get executed\n   f2() of base class get executed\n   f3() of base class get executed'),

(206, 'A) Each derived class does not have its own version of a virtual method'),
(206, 'B) If a derived class does not have its own version of virtual method then one in base class is used'),
(206, 'C) By default methods are virtual'),
(206, 'D) All of the mentioned'),

(207, 'A) \n    public static csharp operator -(csharp s1)\n    {\n        csharp t = new csharp();\n        t.x = s1.x;\n        t.y = s1.y;\n        t.z = -s1.z;\n        return t;\n    }'),
(207, 'B) \n    public static csharp operator -(csharp s1)\n    {\n        csharp t = new csharp();\n        t.x = s1.x;\n        t.y = s1.y;\n        t.z = s1.z;\n        return t;\n    }'),
(207, 'C) \n    public static csharp operator -(csharp s1)\n    {\n        csharp t = new csharp();\n        t.x = -s1.x;\n        t.y = -s1.y;\n        t.z = -s1.z;\n        return t;\n    }'),
(207, 'D) None of the mentioned'),

(208, 'A) Static binding'),
(208, 'B) Static Linking'),
(208, 'C) Compile time polymorphism'),
(208, 'D) All of the mentioned'),

(209, 'A) The overridden base method should be virtual, abstract or override'),
(209, 'B) An abstract method is implicitly a virtual method'),
(209, 'C) An abstract inherited property cannot be overridden in a derived class'),
(209, 'D) Both override method and virtual method must have same access level modifier');



