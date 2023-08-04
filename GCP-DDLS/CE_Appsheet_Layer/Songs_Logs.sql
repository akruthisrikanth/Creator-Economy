CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Songs_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Songs`
  WHERE 1=2
);
