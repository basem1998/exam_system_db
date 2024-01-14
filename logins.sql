---------------------Logins_Accounts_Permissions

---Login creation
use master
create login admin0 with password = '123456'
create login tr_mngr0 with password = '123456'
create login instructor0 with password = '123456'
create login student0 with password = '123456'

use OnlineExame
---Roles creation
create role AdminRole
create role TrainingManagerRole
create role InstructorRole
create role StudentRole




-- Create users and assign roles
create user admin0 for login admin0
create user tr_mngr0 for login tr_mngr0
create user instructor0 for login instructor0
create user student0 for login student0


use [OnlineExame]
-- Assign roles to users
alter role AdminRole add MEMBER admin0

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[allowance_option] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[branch] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Class] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[course] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Course_instructor] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[departement] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[department_branch] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[exam] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[exam_question] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[instructor] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[departement] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[department_branch] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[exam] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[exam_question] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[instructor] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[intake] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[mcq_choise] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[question] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[student] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[student_answers] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[student_crs] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[student_exam] TO AdminRole
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[track] TO AdminRole



GRANT EXECUTE ON PROCEDURE  TO admin0

