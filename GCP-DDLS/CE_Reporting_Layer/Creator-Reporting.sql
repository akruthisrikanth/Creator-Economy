CREATE OR REPLACE TABLE `tech-cali-b2c.CE_Reporting_Layer.Creator_Reporting`
AS SELECT  
Artist_ID,
Creator_Name AS `Artist Name`,
Final_Selection_Score AS `Artist Selection Score`,
Audience_Score AS `Audience Score`, 
Content_Performance_Score AS `Content Performance Score`, 
Engagement_Score AS `Engagement Score`,
" " AS `Social Score`,
Audience_Score_Label AS `Audience Score Bucket`, 
Content_Performance_Score_Label AS `Content Performance Score Bucket`, 
Engagement_Score_Label AS `Engagement Score Bucket`,
" " AS `Social Score Bucket`,
Final_Selection_Score_Label AS `Artist Selection Score Bucket`,
YouTube_Subscribers AS `YouTube Subscribers`,
YouTube_Genz_Subscribers AS `YouTube Genz Subscribers`,
Spotify_Followers AS `Spotify Followers`,
Twitter_Followers AS `Twitter Followers`,
Instagram_Followers AS `Instagram Followers`,
Instagram_Genz_Followers AS `Instagram Genz Followers`,
TikTok_Followers AS `TikTok Followers`,
TikTok_Genz_Followers AS `TikTok Genz Followers`,
Spotify_Monthly_Listeners AS `Spotify Listeners`,
Twitter_Retweets AS `Twitter Retweets`,
TikTok_Creations_Top_Tracks AS `TikTok Creations`,
TikTok_Views_Top_Tracks AS `TikTok Views`,
YouTube_Monthly_Video_Views AS `YT Views`,
Facebook_Likes AS `Likes`,
Facebook_Talks AS `Talks`,
Instagram_Avg_Engagement_per_Post AS `Instagram Enagagements`,
TikTok_Avg_Engagement_per_Post AS `TikTok Engagements`,
YouTube_Avg_Engagement_per_Post AS `YouTube Engagements`
FROM `tech-cali-b2c.CE_ML_Layer.Creator_Selection_Profile`,
UNNEST(Z_Score) AS Z_Score_alias,
UNNEST(Audience) AS Audience_alias,
UNNEST(Content_Performance) AS Activity_alias,
UNNEST(Engagement) AS Engagement_alias;
