CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Social_Media_Platform_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Social_Media_Platform`
  WHERE 1=2
);
