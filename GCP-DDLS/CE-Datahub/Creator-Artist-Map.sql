CREATE OR REPLACE TABLE `CE_Datahub.Creator_Artist_Map` AS
SELECT B.Creator_ID, A.artist_id AS Artist_ID FROM
`CE_External_Source.Chartmetric_Raw` A
INNER JOIN `CE_Datahub.CE_Creators` B
ON A.name = B.Creator_Name;
