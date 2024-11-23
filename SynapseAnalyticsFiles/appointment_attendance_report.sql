CREATE VIEW appointment_attendance_report
AS
SELECT 
	COUNT(s.id) AS total_sessions,
	SUM(CASE 
			WHEN LOWER(s.status) = 'confirmed' THEN 1
			ELSE 0
		END) AS confirmed,
	SUM(CASE 
			WHEN LOWER(s.status) = 'cancelled' THEN 1
			ELSE 0
		END) AS cancelled
FROM 
	OPENROWSET(
		BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/session.parquet/',
		FORMAT = 'PARQUET'
	)AS s;