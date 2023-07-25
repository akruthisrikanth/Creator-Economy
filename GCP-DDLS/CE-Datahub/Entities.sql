-- INSERT into `CE_Datahub.CE_Creators` SELECT GENERATE_UUID(), Name, FALSE, TRUE FROM `CE_External_Source.Chartmetric_Raw`; 

CREATE OR REPLACE TABLE `CE_Datahub.CE_Entities`(Entity_ID STRING, Entity_Name STRING, Entity_Type STRING);

INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Creators', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Trends', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Brands', " ");
INSERT INTO `CE_Datahub.CE_Entities` VALUES(Generate_UUID(), 'Content', " ");
