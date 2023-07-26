CREATE OR REPLACE TABLE `tech-cali-b2c.CE_ML_Layer.Creator_Selection_Profile` AS
SELECT
A.Creator_ID,
A.artist_id AS Artist_ID,
A.name AS Creator_Name,
A.country_code AS Country_Code,
" " AS Geographic_Level,
[STRUCT(A.twitter_followers, A.spotify_followers, A.instagram_followers, A.youTube_subscribers, A.tikTok_followers, A.Instagram_Genz_followers, A.TikTok_Genz_followers, A.Youtube_Genz_subscribers)] AS Audience,
[STRUCT(A.twitter_retweets, A.youtube_monthly_video_views, A.spotify_monthly_listeners, A.TikTok_total_views_for_top_n_tracks)] AS Content_Performance,
[STRUCT(A.Instagram_avg_engagements_per_post, A.TikTok_avg_engagements_per_post, A.Youtube_avg_engagements_per_post, A.facebook_likes, A.facebook_talks)] AS Engagement,
A.TikTok_total_creations_for_top_n_tracks,
B.Z_Score
FROM
`tech-cali-b2c.CE_Analytics_Layer.Creator_Social_Profile` A
LEFT JOIN 
`tech-cali-b2c.CE_ML_Layer.Creator_Scoring` B
ON A.Artist_ID = CAST(B.Artist_ID AS STRING);
