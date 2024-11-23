CREATE VIEW clinic_utilization
AS
SELECT
    c.id AS clinic_id,
    c.clinic_name,
    COUNT(s.id) AS number_of_sessions,
    COUNT(DISTINCT(s.patient_id)) AS unique_patients
FROM 
    OPENROWSET(
        BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/clinic.parquet/',
        FORMAT = 'PARQUET'
    ) AS c
LEFT JOIN 
    OPENROWSET(
        BULK 'https://devhealthdatalakecindia.dfs.core.windows.net/healthcare-cleaned-data-centralindia/cleaned_data/session.parquet/',
        FORMAT = 'PARQUET'
    ) AS s 
    ON c.id = s.clinic_id
WHERE
    LOWER(s.status) = 'confirmed'
GROUP BY
    c.id, c.clinic_name;