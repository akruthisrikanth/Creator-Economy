CREATE OR REPLACE TABLE `tech-cali-b2c.CE_ML_Layer.Creator_Selection_Profile` AS
SELECT
A.Creator_ID,
A.Artist_ID,
A.Creator_Name,
" " AS Geographic_Level,
[STRUCT(A.Twitter_Followers, A.Spotify_Followers, A.Instagram_Followers, A.YouTube_Subscribers, A.TikTok_Followers, A.Instagram_Genz_Followers, A.TikTok_Genz_Followers, A.YouTube_Genz_Subscribers)] AS Audience,
[STRUCT(A.Twitter_Retweets, A.YouTube_Monthly_Video_Views, A.Spotify_Monthly_Listeners, A.TikTok_Views_Top_Tracks)] AS Content_Performance,
[STRUCT(A.Instagram_Avg_Engagement_per_Post, A.TikTok_Avg_Engagement_per_Post, A.YouTube_Avg_Engagement_per_Post, A.Facebook_Likes, A.Facebook_Talks)] AS Engagement,
A.TikTok_Creations_Top_Tracks,
Z_Score
FROM
`tech-cali-b2c.CE_Analytics_Layer.Creator_Social_Profile` A
LEFT JOIN 
`tech-cali-b2c.CE_ML_Layer.Creator_Scoring` B
ON A.Artist_ID = CAST(B.Artist_ID AS STRING);
