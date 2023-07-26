CREATE OR REPLACE TABLE `CE_Datahub.CE_Spotify_Snapshot` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Spotify_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.spotify_followers AS Spotify_Followers,
A.spotify_monthly_listeners AS Spotify_Monthly_Listeners,
NULL AS Spotify_Music_Uploads,
NULL AS Spotify_Streams,
NULL AS Spotify_Playlists,
NULL AS Spotify_Short_Form_Videos
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
--ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_Spotify_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS Spotify_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.spotify_followers AS Spotify_Followers,
A.spotify_monthly_listeners AS Spotify_Monthly_Listeners,
NULL AS Spotify_Music_Uploads,
NULL AS Spotify_Streams,
NULL AS Spotify_Playlists,
NULL AS Spotify_Short_Form_Videos,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
