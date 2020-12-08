--Number of Employees in each job type
CREATE OR ALTER PROCEDURE EMPLOYEE_COUNT_BY_JOB_TYPE (@count int OUTPUT, @job_type varchar(20))
AS 
BEGIN

SET @count = (SELECT COUNT(e.job_type)
FROM employee e
where job_type = @job_type
GROUP BY e.job_type);

SELECT @job_type AS JOB_TYPE, @count AS EMPLOYEE_COUNT
END;

DECLARE @count int;
EXEC EMPLOYEE_COUNT_BY_JOB_TYPE  @count OUTPUT, @job_type='Administration';
EXEC EMPLOYEE_COUNT_BY_JOB_TYPE  @count OUTPUT, @job_type='Engineer';
EXEC EMPLOYEE_COUNT_BY_JOB_TYPE  @count OUTPUT, @job_type='Traffic Monitor';
EXEC EMPLOYEE_COUNT_BY_JOB_TYPE  @count OUTPUT, @job_type='Airport Authority';