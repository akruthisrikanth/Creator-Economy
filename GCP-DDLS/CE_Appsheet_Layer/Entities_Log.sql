CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Entities_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Entities`
  WHERE 1=2
);
