CREATE OR REPLACE TABLE
  `CE_Appsheet_Layer.Chartmetric_Raw` AS
SELECT
  *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY name) AS row_num
  FROM
    `CE_Appsheet_Layer.Chartmetric_Raw`)
WHERE
  row_num = 1;
-------------------------------------------------------------------------------------------------------------

INSERT INTO `CE_Appsheet_Layer.Creators`(Creator_ID, Entity_Type, Creator_Name, Location, Artist, Entity_ID)
SELECT
GENERATE_UUID(), 
"Artists",
name,
country_code,
True,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw`;

----------------------------------------------------------------------------------------------------------------
INSERT INTO `CE_Appsheet_Layer.Music_Artists`(Creator_ID, Artist_ID, Entity_Type, Artist_Type, Artist_name)
SELECT 
Creator_ID,
GENERATE_UUID(),
"Artists",
"Music",
Creator_Name
FROM `CE_Appsheet_Layer.Creators`;

----------------------------------------------------------------------------------------------------------------
INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","0b5d3085","TikTok", Num_Followers,"adfa7ea8" FROM(
SELECT GENERATE_UUID(),
B.Creator_Name,
"Artists",
"0b5d3085",
"TikTok",
SAFE_CAST(A.TikTok_followers AS INT64) AS Num_Followers,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN `CE_Appsheet_Layer.Creators` B
ON A.name = B.Creator_Name)
WHERE Num_Followers IS NOT NULL;


INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","4b8b9ced","YouTube", Num_Followers,"adfa7ea8" FROM(
SELECT 
GENERATE_UUID(),
B.Creator_Name,
"Artists",
"4b8b9ced",
"YouTube",
SAFE_CAST(A.Youtube_subscribers AS INT64) AS Num_Followers,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN 
`CE_Appsheet_Layer.Creators` B
ON A.name = B.Creator_Name)
WHERE Num_Followers IS NOT NULL;

INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","658be9ea","Twitter", Num_Followers,"adfa7ea8" FROM(
SELECT  
GENERATE_UUID(),
B.Creator_Name,
"Artists",
"658be9ea",
"Twitter",
SAFE_CAST(A.twitter_followers AS INT64) AS Num_Followers,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN 
`CE_Appsheet_Layer.Creators` B
ON A.name = B.Creator_Name)
WHERE Num_Followers IS NOT NULL;

INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","842fb81e","Instagram", Num_Followers,"adfa7ea8" FROM(
SELECT  
GENERATE_UUID(),
B.Creator_Name,
"Artists",
"842fb81e",
"Instagram",
SAFE_CAST(A.Instagram_followers AS INT64) AS Num_Followers,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN 
`CE_Appsheet_Layer.Creators` B
ON A.name = B.Creator_Name)
WHERE Num_Followers IS NOT NULL;
