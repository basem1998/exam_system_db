----- sp to take Monthly Full backup 
create or alter proc MonthlyBackup_SP
as
begin
DECLARE @BackupPath NVARCHAR(255) = 'H:\ITI dot net 11-2023\SQL\Project\Final\dailybackups\OnlineExameBackup.bak'

BACKUP DATABASE [OnlineExame]
TO DISK = @BackupPath 
end


----- sp to take Weekly Defferential backup 
create or alter proc WeeklyBackup_SP
as
begin
DECLARE @BackupPath NVARCHAR(255) = 'H:\ITI dot net 11-2023\SQL\Project\Final\dailybackups\OnlineExameBackup.bak'

BACKUP DATABASE [OnlineExame]
TO DISK = @BackupPath 
WITH DIFFERENTIAL
end

-- sp to take Daily Transactional daily backup 
create or alter proc DailyBackup_SP
as
begin
DECLARE @BackupPath NVARCHAR(255) = 'H:\ITI dot net 11-2023\SQL\Project\Final\dailybackups\OnlineExameBackup.trn'

BACKUP log  [OnlineExame]
TO DISK = @BackupPath 
end

--execution
exec MonthlyBackup_SP
exec WeeklyBackup_SP
exec DailyBackup_SP





--implementation using sql server agent
