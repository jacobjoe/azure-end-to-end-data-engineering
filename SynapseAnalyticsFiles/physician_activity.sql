CREATE VIEW physician_activity
AS
SELECT
    p.id AS physician_id,
    p.first_name,
    p.last_name,
    p.npi_number,
    COUNT(s.id) AS total_sessions,
    AVG(session_duration_mins) AS avg_session_duration_mins
FROM 
    OPENROWSET(
        BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/physician.parquet/', 
        FORMAT='PARQUET'
    ) AS p
LEFT JOIN 
    OPENROWSET(
        BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/session.parquet/', 
        FORMAT='PARQUET'
    ) AS s 
    ON p.id = s.physician_id
WHERE 
    LOWER(s.status) = 'confirmed'
GROUP BY
    p.id, p.first_name, p.last_name, p.npi_number;