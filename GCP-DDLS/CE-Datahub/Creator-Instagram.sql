CREATE OR REPLACE TABLE `CE_Datahub.CE_Instagram_Snapshot` AS
SELECT 
B.Creator_ID,
C.Artist_ID,  
B.Creator_Name,
" " AS Instagram_ID,
A.Instagram_followers AS Instagram_Followers,
A.Instagram_Genz_Followers, 
NULL AS Instagram_Following,
NULL AS Instagram_Posts,
NULL AS Instagram_Total_Reels,
NULL AS Instagram_Total_Reels_Watch_Time,
NULL AS Instagram_Total_Reels_Views,
NULL AS Instagram_Likes,
NULL AS Instagram_Dislikes,
NULL AS Instagram_Shares,
A.Instagram_avg_engagements_per_post AS Instagram_Avg_Engagement_per_Post
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_Instagram_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Instagram_ID,
A.Instagram_followers AS Instagram_Followers,
A.Instagram_Genz_Followers,
NULL AS Instagram_Following,
NULL AS Instagram_Posts,
NULL AS Instagram_Total_Reels,
NULL AS Instagram_Total_Reels_Watch_Time,
NULL AS Instagram_Total_Reels_Views,
NULL AS Instagram_Likes,
NULL AS Instagram_Dislikes,
NULL AS Instagram_Shares,
A.Instagram_avg_engagements_per_post AS Instagram_Avg_Engagement_per_Post,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
