CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Social_Profile_Logs`
AS(
  SELECT CAST(NULL AS STRING) AS Log_ID,
  * FROM `CE_Appsheet_Layer.Social_Profile`
  WHERE 1=2
);
