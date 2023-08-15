INSERT INTO `CE_Appsheet_Layer.Creators`(Creator_ID, Entity_Type, Creator_Name, Location, Artist, Entity_ID)
SELECT Creator_ID, "Artists",name,country_code,True,"adfa7ea8" FROM(
SELECT
B.Creator_ID, 
ROW_NUMBER() OVER(PARTITION BY name ORDER BY name) as row_num,
"Artists",
A.name,
A.country_code,
True,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN `CE_Appsheet_Layer.Creator_Artist_Map` B
ON A.artist_id = B.Artist_ID)
WHERE row_num = 1;

----------------------------------------------------------------------------------------------------------------
INSERT INTO `CE_Appsheet_Layer.Music_Artists`(Creator_ID, Artist_ID, Entity_Type, Artist_Type, Artist_name)
SELECT Creator_ID,GENERATE_UUID(),"Artists","Music", Creator_Name FROM(
SELECT Creator_ID,
ROW_NUMBER() OVER(PARTITION BY Creator_Name ORDER BY Creator_Name) as row_num,
GENERATE_UUID(),
"Artists",
"Music",
Creator_Name
FROM `CE_Appsheet_Layer.Creators`)
WHERE row_num =1;

----------------------------------------------------------------------------------------------------------------
INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","0b5d3085","TikTok", Num_Followers,"adfa7ea8" FROM(
SELECT GENERATE_UUID(),
ROW_NUMBER() OVER(PARTITION BY Creator_Name ORDER BY Creator_Name) as row_num,
B.Creator_Name,
"Artists",
"0b5d3085",
"TikTok",
SAFE_CAST(A.TikTok_followers AS INT64) AS Num_Followers,
"adfa7ea8"
FROM `CE_Appsheet_Layer.Chartmetric_Raw` A
LEFT JOIN `CE_Appsheet_Layer.Creators` B
ON A.name = B.Creator_Name)
WHERE row_num = 1;


INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","4b8b9ced","YouTube", Num_Followers,"adfa7ea8" FROM(
SELECT 
GENERATE_UUID(),
ROW_NUMBER() OVER(PARTITION BY Creator_Name ORDER BY Creator_Name) as row_num,
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
WHERE row_num = 1;

INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","658be9ea","Twitter", Num_Followers,"adfa7ea8" FROM(
SELECT  
GENERATE_UUID(),
ROW_NUMBER() OVER(PARTITION BY Creator_Name ORDER BY Creator_Name) as row_num,
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
WHERE row_num = 1;

INSERT INTO `CE_Appsheet_Layer.Social_Profile`(Social_Profile_ID, Creator_Name, Entity_Type, Social_Media_Platform_ID, Social_Media_Platform, Num_Followers, Entity_ID)
SELECT GENERATE_UUID(),Creator_Name,"Artists","842fb81e","Instagram", Num_Followers,"adfa7ea8" FROM(
SELECT  
GENERATE_UUID(),
ROW_NUMBER() OVER(PARTITION BY Creator_Name ORDER BY Creator_Name) as row_num,
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
where row_num = 1;
