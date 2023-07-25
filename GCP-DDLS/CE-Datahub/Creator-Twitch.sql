CREATE OR REPLACE TABLE `CE_Datahub.CE_Twitch_Snapshot` AS
SELECT 
B.Creator_ID,
C.Artist_ID, 
B.Creator_Name,
" " AS Twitch_ID,
NULL AS Twitch_Followers,
NULL AS Twitch_Videos,
NULL AS Twitch_Shares
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_Twitch_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Twitch_ID,
NULL AS Twitch_Followers,
NULL AS Twitch_Videos,
NULL AS Twitch_Shares,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
