CREATE OR REPLACE TABLE `CE_Datahub.CE_Facebook_Snapshot` AS
SELECT 
B.Creator_ID,
C.Artist_ID, 
B.Creator_Name,
" " AS Facebook_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.facebook_likes AS Facebook_Likes,
A.facebook_talks AS Facebook_Talks,
NULL AS Facebook_Shares
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_Facebook_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID, 
B.Creator_Name,
" " AS Facebook_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.facebook_likes AS Facebook_Likes,
A.facebook_talks AS Facebook_Talks,
NULL AS Facebook_Shares,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
