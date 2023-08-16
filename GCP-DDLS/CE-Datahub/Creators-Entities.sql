CREATE OR REPLACE TABLE `CE_External_Source.Chartmetric_Raw`
AS
WITH RankedData AS (
  SELECT
  *,
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY Snapshot_Date DESC) AS row_num
  FROM
    `CE_External_Source.Chartmetric_Raw`
)

SELECT
*
FROM
  RankedData
WHERE
  row_num = 1;
----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE `CE_Datahub.CE_Entities`(Entity_ID STRING, Entity_Name STRING, Entity_Type STRING);

INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Creators', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Trends', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Brands', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Content', " ");

----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE `CE_Datahub.CE_Creators` AS
(SELECT GENERATE_UUID() AS Creator_ID, A.* FROM(
SELECT DISTINCT "2d36bb3b-ef84-4300-85cd-e085454a110f" as Entity_ID, 'Creators' AS Entity_Name, Name AS Creator_Name, FALSE AS Influencer, TRUE AS Music_Artist FROM `CE_External_Source.Chartmetric_Raw`) AS A);

----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE `CE_Datahub.Creator_Artist_Map` AS
SELECT B.Creator_ID, A.artist_id AS Artist_ID FROM
`CE_External_Source.Chartmetric_Raw` A
INNER JOIN `CE_Datahub.CE_Creators` B
ON A.name = B.Creator_Name;
