CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Music_Artists_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Music_Artists`
  WHERE 1=2
);
