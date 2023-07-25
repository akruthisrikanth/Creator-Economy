CREATE OR REPLACE TABLE `tech-cali-b2c.CE_Analytics_Layer.Creator_Social_Profile` AS
SELECT
A.Creator_ID,
A.Artist_ID,
A.Creator_Name,
A.Twitter_ID,
A.Twitter_Followers,
A.Twitter_Following,
A.Twitter_Retweets,
A.Twitter_Tweets,
A.Twitter_Shares,
B.Instagram_ID,
B.Instagram_Followers,
B.Instagram_Genz_Followers,
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
C.TikTok_Videos,
C.TikTok_Average_Views,
C.TikTok_Views_Top_Tracks,
C.TikTok_Creations_Top_Tracks,
C.TikTok_Shares,
C.TikTok_Avg_Engagement_per_Post,
D.YouTube_ID,
D.YouTube_Channel_ID,
D.YouTube_Subscribers,
D.YouTube_Genz_Subscribers,
D.YouTube_Videos,
D.YouTube_Music_Uploads,
D.YouTube_Channel_Views,
D.YouTube_Watch_Time,
D.YouTube_Shorts_Views,
D.YouTube_Username,
D.YouTube_Total_Videos,
D.YouTube_Long_Form_Videos,
D.YouTube_Short_Form_Videos,
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
ON F.Artist_ID = G.Artist_ID;
