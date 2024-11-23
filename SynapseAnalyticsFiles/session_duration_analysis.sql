CREATE VIEW session_duration_analysis
AS
SELECT
    AVG(session_duration_mins) AS avg_session_mins,
    MIN(session_duration_mins) AS min_session_mins,
    MAX(session_duration_mins) AS max_session_mins
FROM 
    OPENROWSET(
        BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/session.parquet/',
        FORMAT = 'PARQUET'
    ) s;