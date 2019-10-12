--En pcadmin

---------CREATE DAILY_TOP JOB---------
BEGIN
dbms_scheduler.create_schedule (
	schedule_name => 'INTERVAL_DAILY_2300',
	start_date => trunc(SYSDATE)+23/24,
		--start today 23:00
	repeat_interval => 'FREQ=DAILY;
	BYDAY=MON,TUE,WED,THU,FRI,SAT,SUN;
	BYHOUR=23;',
	comments => 'Executes every day 23:00');
    
DBMS_SCHEDULER.CREATE_JOB(
	job_name => 'DAILY_TOP_VOTED_REPORT',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN
	pkg_daily_top.generateDailyReport; END;',
	schedule_name => 'INTERVAL_DAILY_2300',
    enabled => TRUE,
    comments => 'Creates daily top for most voted proposal by community');
END;
