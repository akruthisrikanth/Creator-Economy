CREATE OR REPLACE TABLE `CE_Datahub.CE_YouTube_Snapshot` AS
SELECT 
B.Creator_ID, 
C.Artist_ID,
B.Creator_Name,
" " AS YouTube_ID,
" " AS YouTube_Username,
" " AS YouTube_Channel_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.Youtube_subscribers AS YouTube_Subscribers,
A.Youtube_Genz_subscribers,
A.Youtube_Genz_subscribers_percentage AS Youtube_Genz_Subscribers_Percentage,
NULL AS YouTube_Videos,
NULL AS YouTube_Music_Uploads,
A.youtube_channel_views AS YouTube_Channel_Views,
A.youtube_daily_video_views AS YouTube_Daily_Video_Views,
A.youtube_monthly_video_views AS YouTube_Monthly_Video_Views,
NULL AS YouTube_Watch_Time,
NULL AS YouTube_Shorts_Views,
NULL AS YouTube_Total_Videos,
NULL AS YouTube_Short_Form_Videos,
NULL AS YouTube_Long_Form_Videos,
NULL AS YouTube_Shares,
A.youtube_avg_engagements_per_post AS YouTube_Avg_Engagement_per_Post
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
-- ON A.name = B.Creator_Name;

CREATE OR REPLACE TABLE `CE_Datahub.CE_YouTube_Activity` AS
SELECT 
B.Creator_ID,
C.Artist_ID, 
B.Creator_Name,
" " AS YouTube_ID,
" " AS YouTube_Username,
" " AS YouTube_Channel_ID,
A.country_code AS Country_Code,
A.genres AS Genres,
A.Youtube_subscribers AS YouTube_Subscribers,
A.Youtube_Genz_subscribers,
A.Youtube_Genz_subscribers_percentage AS Youtube_Genz_Subscribers_Percentage,
NULL AS YouTube_Videos,
NULL AS YouTube_Music_Uploads,
A.youtube_channel_views AS YouTube_Channel_Views,
A.youtube_daily_video_views AS YouTube_Daily_Video_Views,
A.youtube_monthly_video_views AS YouTube_Monthly_Video_Views,
NULL AS YouTube_Watch_Time,
NULL AS YouTube_Shorts_Views,
NULL AS YouTube_Total_Videos,
NULL AS YouTube_Short_Form_Videos,
NULL AS YouTube_Long_Form_Videos,
NULL AS YouTube_Shares,
A.youtube_avg_engagements_per_post AS YouTube_Avg_Engagement_per_Post,
A.Snapshot_Date AS Date
FROM
`CE_External_Source.Chartmetric_Raw` A
LEFT JOIN `CE_Datahub.Creator_Artist_Map` C
ON A.artist_id = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_Creators` B
ON C.Creator_ID = B.Creator_ID;
