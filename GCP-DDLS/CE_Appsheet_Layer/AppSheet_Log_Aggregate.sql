CREATE OR REPLACE TABLE `CE_Appsheet_Layer.CE_AppSheet_Log_Aggregate`
AS
WITH Creators_Log_Aggregate AS(
  SELECT "Creators" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Creators_Logs`
GROUP BY 1,2,3
) ,
Albums_Log_Aggregate AS(
  SELECT "Albums" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Albums_Logs`
GROUP BY 1,2,3
) ,
Entities_Log_Aggregate AS(
  SELECT "Entities" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Entities_Logs`
GROUP BY 1,2,3
) ,
Influencers_Log_Aggregate AS(
  SELECT "Influencers" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Influencers_Logs`
GROUP BY 1,2,3
) ,
Music_Artists_Log_Aggregate AS(
  SELECT "Music Artists" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Music_Artists_Logs`
GROUP BY 1,2,3
) ,
Social_Media_Platform_Log_Aggregate AS(
  SELECT "Social Media Platform" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Social_Media_Platform_Logs`
GROUP BY 1,2,3
) ,
Social_Profile_Log_Aggregate AS(
  SELECT "Social Profile" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Social_Profile_Logs`
GROUP BY 1,2,3
) ,
Songs_Log_Aggregate AS(
  SELECT "Songs" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Songs_Logs`
GROUP BY 1,2,3
) ,
Trends_Log_Aggregate AS(
  SELECT "Trends" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Trends_Logs`
GROUP BY 1,2,3
) ,
Trends_Videos_Log_Aggregate AS(
  SELECT "Trends x Videos" AS Table_Name,
  `Updated_At` AS Contribution_Timestamp,
  `Updated_By` AS Contribution_By,
  COUNT(DISTINCT Log_ID) AS Contributions
  FROM `CE_Appsheet_Layer.Trends_Videos_Logs`
GROUP BY 1,2,3
) ,
MERGE_ALL AS(
  SELECT * FROM Creators_Log_Aggregate
  UNION ALL
  SELECT * FROM Albums_Log_Aggregate
  UNION ALL
  SELECT * FROM Entities_Log_Aggregate
  UNION ALL
  SELECT * FROM Influencers_Log_Aggregate
  UNION ALL
  SELECT * FROM Music_Artists_Log_Aggregate
  UNION ALL
  SELECT * FROM Social_Media_Platform_Log_Aggregate
  UNION ALL
  SELECT * FROM Social_Profile_Log_Aggregate
  UNION ALL
  SELECT * FROM Songs_Log_Aggregate
  UNION ALL
  SELECT * FROM Trends_Log_Aggregate
  UNION ALL
  SELECT * FROM Trends_Videos_Log_Aggregate
)

SELECT *, DATE_TRUNC(Contribution_Timestamp, DAY) AS Contribution_Date,DATE_TRUNC(Contribution_Timestamp, MONTH) AS Contribution_Month, DATE_TRUNC(Contribution_Timestamp, QUARTER) AS Contribution_Quarter FROM MERGE_ALL
