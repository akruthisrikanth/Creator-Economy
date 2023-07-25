CREATE OR REPLACE TABLE `CE_Datahub.CE_Creators` AS
(SELECT GENERATE_UUID() AS Creator_ID, A.* FROM(
SELECT DISTINCT "2d36bb3b-ef84-4300-85cd-e085454a110f" as Entity_ID, 'Creators' AS Entity_Name, Name AS Creator_Name, FALSE AS Influencer, TRUE AS Music_Artist FROM `CE_External_Source.Chartmetric_Raw`) AS A);
