CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Trends_Videos_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Trends_Videos`
  WHERE 1=2
);
