CREATE OR REPLACE TABLE `CE_Datahub.CE_Twitter_Snapshot` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Twitter_ID,
A.twitter_followers AS Twitter_Followers,
NULL AS Twitter_Following,
A.twitter_retweets AS Twitter_Retweets,
NULL AS Twitter_Tweets,
NULL AS Twitter_Shares
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_Twitter_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Twitter_ID,
A.twitter_followers AS Twitter_Followers,
NULL AS Twitter_Following,
A.twitter_retweets AS Twitter_Retweets,
NULL AS Twitter_Tweets,
NULL AS Twitter_Shares,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
