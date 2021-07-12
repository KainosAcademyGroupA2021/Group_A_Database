CREATE TABLE `Band` (
    `BandID` int NOT NULL AUTO_INCREMENT,
    `BandName` varchar(255) DEFAULT NULL,
    `BandLevel` int DEFAULT NULL,
    `Responsibilities` varchar(255) DEFAULT NULL,
    `TrainingID` int DEFAULT NULL,
    `CompetenciesID` int DEFAULT NULL,
    PRIMARY KEY (`BandID`),
    KEY `CompetenciesID` (`CompetenciesID`),
    KEY `TrainingID` (`TrainingID`),
    CONSTRAINT `Band_ibfk_1` FOREIGN KEY (`CompetenciesID`) REFERENCES `Competencies` (`CompetenciesID`),
    CONSTRAINT `Band_ibfk_2` FOREIGN KEY (`TrainingID`) REFERENCES `Training` (`TrainingID`)
);

CREATE TABLE `Capability` (
    `CapabilityID` int NOT NULL AUTO_INCREMENT,
    `CapabilityName` varchar(255) DEFAULT NULL,
    `CapabilityLeadID` int DEFAULT NULL,
    PRIMARY KEY (`CapabilityID`),
    KEY `CapabilityLeadID` (`CapabilityLeadID`),
    CONSTRAINT `Capability_ibfk_2` FOREIGN KEY (`CapabilityLeadID`) REFERENCES `CapabilityLeads` (`CapabilityLeadID`)
);

CREATE TABLE `CapabilityLeads` (
    `CapabilityLeadID` int NOT NULL AUTO_INCREMENT,
    `CapabilityLeadName` varchar(255) DEFAULT NULL,
    `CapabilityLeadPhoto` varchar(255) DEFAULT NULL,
    `CapabilityLeadMessage` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`CapabilityLeadID`)
);

CREATE TABLE `Competencies` (
    `CompetenciesID` int NOT NULL AUTO_INCREMENT,
    `CompetenciesName` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`CompetenciesID`)
);

CREATE TABLE `JobFamily` (
    `JobFamilyID` int NOT NULL AUTO_INCREMENT,
    `JobFamilyName` varchar(255) DEFAULT NULL,
    `CapabilityID` int NOT NULL,
    PRIMARY KEY (`JobFamilyID`),
    KEY `fk_capability_id` (`CapabilityID`),
    CONSTRAINT `fk_capability_id` FOREIGN KEY (`CapabilityID`) REFERENCES `Capability` (`CapabilityID`)
);

CREATE TABLE `Role` (
    `RoleID` int NOT NULL AUTO_INCREMENT,
    `RoleName` varchar(255) DEFAULT NULL,
    `RoleSpec` varchar(255) DEFAULT NULL,
    `BandID` int DEFAULT NULL,
    `JobFamilyID` int NOT NULL,
    `RoleSpecSummary` varchar(255),
    PRIMARY KEY (`RoleID`),
    KEY `BandID` (`BandID`),
    KEY `fk_jobfamily_id` (`JobFamilyID`),
    CONSTRAINT `fk_jobfamily_id` FOREIGN KEY (`JobFamilyID`) REFERENCES `JobFamily` (`JobFamilyID`),
    CONSTRAINT `Role_ibfk_2` FOREIGN KEY (`BandID`) REFERENCES `Band` (`BandID`)
);

CREATE TABLE `Training` (
    `TrainingID` int NOT NULL AUTO_INCREMENT,
    `TrainingName` varchar(255) DEFAULT NULL,
    `TrainingType` varchar(255) DEFAULT NULL,
    `TrainingLink` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`TrainingID`)
);

CREATE TABLE `Users` (
    `UserID` int NOT NULL AUTO_INCREMENT,
    `UserType` varchar(255) DEFAULT NULL,
    `UserPassword` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`UserID`)
);