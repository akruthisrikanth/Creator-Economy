CREATE OR REPLACE TABLE `tech-cali-b2c.CE_Analytics_Layer.Creator_Social_Profile` AS
SELECT
Creator_ID, 
Artist_ID AS artist_id,
Creator_Name AS name,
Country_Code AS country_code,
Genres AS genres,
Spotify_Followers AS spotify_followers,
Spotify_Monthly_Listeners AS spotify_monthly_listeners,
Facebook_Likes AS facebook_likes,
Facebook_Talks AS facebook_talks,
Twitter_Followers AS twitter_followers,
Twitter_Retweets AS twitter_retweets,
YouTube_Channel_Views AS youtube_channel_views,
YouTube_Daily_Video_Views AS youtube_daily_video_views,
YouTube_Monthly_Video_Views AS youtube_monthly_video_views,
TikTok_Followers AS TikTok_followers,
TikTok_Genz_Followers AS TikTok_Genz_followers,
TikTok_Genz_Followers_Percentage AS TikTok_Genz_followers_percentage,
TikTok_Avg_Engagement_per_Post AS TikTok_avg_engagements_per_post,
TikTok_Num_Top_Tracks AS TikTok_number_of_top_tracks,
TikTok_Creations_Top_Tracks AS TikTok_total_creations_for_top_n_tracks,
TikTok_Creations_Top_Tracks_Avg AS TikTok_avg_creations_for_top_n_tracks,
TikTok_Views_Top_Tracks AS TikTok_total_views_for_top_n_tracks,
TikTok_Views_Top_Tracks_Avg AS TikTok_avg_views_for_top_n_tracks,
Instagram_Followers AS Instagram_followers,
Instagram_Genz_Followers AS Instagram_Genz_followers,
Instagram_Genz_Followers_Percentage AS Instagram_Genz_followers_percentage,
Instagram_Avg_Engagement_per_Post AS Instagram_avg_engagements_per_post,
YouTube_Subscribers AS Youtube_subscribers,
YouTube_Genz_Subscribers AS Youtube_Genz_subscribers,
YouTube_Genz_Subscribers_Percentage AS Youtube_Genz_subscribers_percentage,
YouTube_Avg_Engagement_per_Post AS Youtube_avg_engagements_per_post
FROM(
(SELECT
A.Creator_ID,
A.Artist_ID,
A.Creator_Name,
A.Country_Code,
A.Genres,
A.Twitter_ID,
A.Twitter_Followers,
A.Twitter_Following,
A.Twitter_Retweets,
A.Twitter_Tweets,
A.Twitter_Shares,
B.Instagram_ID,
B.Instagram_Followers,
B.Instagram_Genz_Followers,
B.Instagram_Genz_Followers_Percentage,
B.Instagram_Following,
B.Instagram_Posts,
B.Instagram_Total_Reels,
B.Instagram_Total_Reels_Watch_Time,
B.Instagram_Total_Reels_Views,
B.Instagram_Likes,
B.Instagram_Dislikes,
B.Instagram_Shares,
B.Instagram_Avg_Engagement_per_Post,
C.TikTok_ID,
C.TikTok_Followers,
C.TikTok_Genz_Followers,
C.TikTok_Genz_Followers_Percentage,
C.TikTok_Videos,
C.TikTok_Average_Views,
C.TikTok_Num_Top_Tracks,
C.TikTok_Views_Top_Tracks_Avg,
C.TikTok_Views_Top_Tracks,
C.TikTok_Creations_Top_Tracks,
C.TikTok_Creations_Top_Tracks_Avg,
C.TikTok_Shares,
C.TikTok_Avg_Engagement_per_Post,
D.YouTube_ID,
D.YouTube_Channel_ID,
D.YouTube_Subscribers,
D.YouTube_Genz_Subscribers,
D.YouTube_Genz_Subscribers_Percentage,
D.YouTube_Videos,
D.YouTube_Music_Uploads,
D.YouTube_Channel_Views,
D.YouTube_Watch_Time,
D.YouTube_Shorts_Views,
D.YouTube_Username,
D.YouTube_Total_Videos,
D.YouTube_Long_Form_Videos,
D.YouTube_Short_Form_Videos,
D.YouTube_Daily_Video_Views,
D.YouTube_Monthly_Video_Views,
D.YouTube_Avg_Engagement_per_Post,
E.Twitch_ID,
E.Twitch_Followers,
E.Twitch_Videos,
E.Twitch_Shares,
F.Spotify_ID,
F.Spotify_Followers,
F.Spotify_Monthly_Listeners,
F.Spotify_Music_Uploads,
F.Spotify_Streams,
F.Spotify_Playlists,
F.Spotify_Short_Form_Videos,
G.Facebook_ID,
G.Facebook_Likes,
G.Facebook_Talks,
G.Facebook_Shares
FROM 
`CE_Datahub.CE_Twitter_Snapshot` A
LEFT JOIN `CE_Datahub.CE_Instagram_Snapshot` B
-- ON A.Creator_ID = B.Creator_ID
ON A.Artist_ID = B. Artist_ID
LEFT JOIN `CE_Datahub.CE_TikTok_Snapshot` C
ON B.Artist_ID = C.Artist_ID
LEFT JOIN `CE_Datahub.CE_YouTube_Snapshot` D
ON C.Artist_ID = D.Artist_ID
LEFT JOIN `CE_Datahub.CE_Twitch_Snapshot` E
ON D.Artist_ID = E.Artist_ID
LEFT JOIN `CE_Datahub.CE_Spotify_Snapshot` F
ON E.Artist_ID = F.Artist_ID
LEFT JOIN `CE_Datahub.CE_Facebook_Snapshot` G
ON F.Artist_ID = G.Artist_ID));
