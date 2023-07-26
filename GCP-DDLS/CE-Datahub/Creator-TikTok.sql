CREATE OR REPLACE TABLE `CE_Datahub.CE_TikTok_Snapshot` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS TikTok_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.TikTok_followers AS TikTok_Followers,
A.TikTok_Genz_followers,
A.Instagram_Genz_followers_percentage AS TikTok_Genz_Followers_Percentage,
NULL AS TikTok_Average_Views,
A.TikTok_number_of_top_tracks AS TikTok_Num_Top_Tracks,
A.TikTok_total_views_for_top_n_tracks AS TikTok_Views_Top_Tracks,
A.TikTok_avg_views_for_top_n_tracks AS TikTok_Views_Top_Tracks_Avg ,
A.TikTok_avg_creations_for_top_n_tracks AS TikTok_Creations_Top_Tracks_Avg,
A.TikTok_total_creations_for_top_n_tracks AS TikTok_Creations_Top_Tracks,
NULL AS TikTok_Videos,
NULL AS TikTok_Shares,
A.TikTok_avg_engagements_per_post AS TikTok_Avg_Engagement_per_Post
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_TikTok_Activity` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS TikTok_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.TikTok_followers AS TikTok_Followers,
A.TikTok_Genz_followers,
A.Instagram_Genz_followers_percentage AS TikTok_Genz_Followers_Percentage,
NULL AS TikTok_Average_Views,
A.TikTok_number_of_top_tracks AS TikTok_Num_Top_Tracks,
A.TikTok_total_views_for_top_n_tracks AS TikTok_Views_Top_Tracks,
A.TikTok_avg_views_for_top_n_tracks AS TikTok_Views_Top_Tracks_Avg ,
A.TikTok_avg_creations_for_top_n_tracks AS TikTok_Creations_Top_Tracks_Avg,
A.TikTok_total_creations_for_top_n_tracks AS TikTok_Creations_Top_Tracks,
NULL AS TikTok_Videos,
NULL AS TikTok_Shares,
A.TikTok_avg_engagements_per_post AS TikTok_Avg_Engagement_per_Post,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
