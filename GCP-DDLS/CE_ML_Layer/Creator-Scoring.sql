CREATE OR REPLACE TABLE `tech-cali-b2c.CE_ML_Layer.Creator_Scoring`
AS SELECT
B.Creator_ID,
name AS Creator_Name,
A.artist_id AS Artist_ID,
A.country_code,
[STRUCT(spotify_followers_zscore AS Spotify_Followers_Zscore, 
spotify_monthly_listeners_zscore AS Spotify_Monthly_Listeners_Zscore, 
facebook_likes_zscore AS Facebook_Likes_Zscore, 
facebook_talks_zscore AS Facebook_Talks_Zscore, 
twitter_followers_zscore AS Twitter_Followers_Zscore, 
twitter_retweets_zscore AS Twitter_Retweets_Zscore, 
youtube_monthly_video_views_zscore AS Youtube_Monthly_Video_Views_Zscore, 
TikTok_followers_zscore AS Tiktok_Followers_Zscore, 
TikTok_Genz_followers_zscore AS Tiktok_Genz_Followers_Zscore, 
TikTok_avg_engagements_per_post_zscore AS Tiktok_Avg_Engagements_Per_Post_Zscore, 
TikTok_total_creations_for_top_n_tracks_zscore AS Tiktok_Total_Creations_For_Top_N_Tracks_Zscore, 
TikTok_total_views_for_top_n_tracks_zscore AS Tiktok_Total_Views_For_Top_N_Tracks_Zscore, 
Instagram_followers_zscore AS Instagram_Followers_Zscore, 
Instagram_Genz_followers_zscore AS Instagram_Genz_Followers_Zscore, 
Instagram_avg_engagements_per_post_zscore AS Instagram_Avg_Engagements_Per_Post_Zscore, 
Youtube_subscribers_zscore AS Youtube_Subscribers_Zscore, 
Youtube_Genz_subscribers_zscore AS Youtube_Genz_Subscribers_Zscore, 
Youtube_avg_engagements_per_post_zscore AS Youtube_Avg_Engagements_Per_Post_Zscore, 
spotify_followers_z_score AS Spotify_Followers_Z_Score, 
spotify_followers_z_score_label AS Spotify_Followers_Z_Score_Label, 
spotify_monthly_listeners_z_score AS Spotify_Monthly_Listeners_Z_Score, 
spotify_monthly_listeners_z_score_label AS Spotify_Monthly_Listeners_Z_Score_Label, 
facebook_likes_z_score AS Facebook_Likes_Z_Score, 
facebook_likes_z_score_label AS Facebook_Likes_Z_Score_Label, 
facebook_talks_z_score AS Facebook_Talks_Z_Score, 
facebook_talks_z_score_label AS Facebook_Talks_Z_Score_Label, 
twitter_followers_z_score AS Twitter_Followers_Z_Score, 
twitter_followers_z_score_label AS Twitter_Followers_Z_Score_Label, 
twitter_retweets_z_score AS Twitter_Retweets_Z_Score, 
twitter_retweets_z_score_label AS Twitter_Retweets_Z_Score_Label, 
youtube_monthly_video_views_z_score AS Youtube_Monthly_Video_Views_Z_Score, 
youtube_monthly_video_views_z_score_label AS Youtube_Monthly_Video_Views_Z_Score_Label, 
TikTok_followers_z_score AS Tiktok_Followers_Z_Score, 
TikTok_followers_z_score_label AS Tiktok_Followers_Z_Score_Label, 
TikTok_Genz_followers_z_score AS Tiktok_Genz_Followers_Z_Score, 
TikTok_Genz_followers_z_score_label AS Tiktok_Genz_Followers_Z_Score_Label, 
TikTok_avg_engagements_per_post_z_score AS Tiktok_Avg_Engagements_Per_Post_Z_Score, 
TikTok_avg_engagements_per_post_z_score_label AS Tiktok_Avg_Engagements_Per_Post_Z_Score_Label, 
TikTok_total_creations_for_top_n_tracks_z_score AS Tiktok_Total_Creations_For_Top_N_Tracks_Z_Score, 
TikTok_total_creations_for_top_n_tracks_z_score_label AS Tiktok_Total_Creations_For_Top_N_Tracks_Z_Score_Label, 
TikTok_total_views_for_top_n_tracks_z_score AS Tiktok_Total_Views_For_Top_N_Tracks_Z_Score, 
TikTok_total_views_for_top_n_tracks_z_score_label AS Tiktok_Total_Views_For_Top_N_Tracks_Z_Score_Label, 
Instagram_followers_z_score AS Instagram_Followers_Z_Score, 
Instagram_followers_z_score_label AS Instagram_Followers_Z_Score_Label, 
Instagram_Genz_followers_z_score AS Instagram_Genz_Followers_Z_Score, 
Instagram_Genz_followers_z_score_label AS Instagram_Genz_Followers_Z_Score_Label, 
Instagram_avg_engagements_per_post_z_score AS Instagram_Avg_Engagements_Per_Post_Z_Score, 
Instagram_avg_engagements_per_post_z_score_label AS Instagram_Avg_Engagements_Per_Post_Z_Score_Label, 
Youtube_subscribers_z_score AS Youtube_Subscribers_Z_Score, 
Youtube_subscribers_z_score_label AS Youtube_Subscribers_Z_Score_Label, 
Youtube_Genz_subscribers_z_score AS Youtube_Genz_Subscribers_Z_Score, 
Youtube_Genz_subscribers_z_score_label AS Youtube_Genz_Subscribers_Z_Score_Label, 
Youtube_avg_engagements_per_post_z_score AS Youtube_Avg_Engagements_Per_Post_Z_Score, 
Youtube_avg_engagements_per_post_z_score_label AS Youtube_Avg_Engagements_Per_Post_Z_Score_Label,
-- genre_score AS Genre_Score, 
-- major_genre AS Major_Genre, 
Audience_Score, 
Content_Performance_Score, 
Engagement_Score, 
Final_Selection_Score, 
Audience_Score_Label, 
Content_Performance_Score_Label, 
Engagement_Score_Label, 
Final_Selection_Score_Label)] AS Z_Score
FROM `tech-cali-b2c.CE_ML_Layer.New_Weights_Score` A
LEFT JOIN 
 `tech-cali-b2c.CE_Datahub.Creator_Artist_Map` B
 ON CAST(A.artist_id AS STRING) = B.Artist_ID
