--CE_Appsheet_Layer.Chartmetric_Raw table is created using the Python script (Chartmetric Data Pull)

CREATE OR REPLACE TABLE `CE_Appsheet_Layer.CE_Creators` AS
(SELECT GENERATE_UUID() AS Creator_ID, A.* FROM(
SELECT DISTINCT "2d36bb3b-ef84-4300-85cd-e085454a110f" as Entity_ID, 'Creators' AS Entity_Name, Name AS Creator_Name, FALSE AS Influencer, TRUE AS Music_Artist FROM `CE_Appsheet_Layer.Chartmetric_Raw`) AS A);
------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE `CE_Appsheet_Layer.Creator_Artist_Map` AS
SELECT B.Creator_ID, A.artist_id AS Artist_ID FROM
`CE_Appsheet_Layer.Chartmetric_Raw` A
INNER JOIN `CE_Appsheet_Layer.CE_Creators` B
ON A.name = B.Creator_Name;
