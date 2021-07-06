CREATE TABLE Capability (
CapabilityID int NOT NULL,
CapabilityName varchar(255),
JobFamilyID int,
CapabilityLeadID int,
PRIMARY KEY (CapabilityID),
FOREIGN KEY (JobFamilyID) REFERENCES JobFamily(JobFamilyID)
FOREIGN KEY (CapabilityLeadID) REFERENCES CapabilityLead(CapabilityLeadID)
);

CREATE TABLE Role (
RoleID int NOT NULL,
RoleName varchar(255),
RoleSpec varchar(255),
CapabilityID int, 
BandID int,
PRIMARY KEY (RoleID),
FOREIGN KEY (CapabilityID) REFERENCES Capability(CapabilityID)
FOREIGN KEY (BandID) REFERENCES Band(BandID)
);

CREATE TABLE Band (
BandID int NOT NULL,
BandName varchar(255),
BandLevel int,
Responsibilities varchar(255),
TrainingID,
CompetenciesID,
PRIMARY KEY (BandID),
FOREIGN KEY (CompetenciesID) REFERENCES Competencies(CompetenciesID)
FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)

);

CREATE TABLE JobFamily (
JobFamilyID int NOT NULL,
JobFamilyName varchar(255),
PRIMARY KEY (JobFamilyID)
);

CREATE TABLE Users (
UserID int NOT NULL,
UserType varchar(255),
UserPassword varchar(255),
PRIMARY KEY (UserID)
);

CREATE TABLE Training (
TrainingID int NOT NULL,
TrainingName varchar(255),
TrainingType varchar(255),
TrainingLink varchar(255),
PRIMARY KEY (TrainingID)
);

CREATE TABLE Competencies  (
CompetenciesID int NOT NULL,
CompetenciesName varchar(255),
PRIMARY KEY (CompetenciesID)
);

CREATE TABLE CapabilityLeads  (
CapabilityLeadID int NOT NULL,
CapabilityLeadName varchar(255),
CapabilityLeadPhoto varchar(255),
CapabilityLeadMessage varchar(255),
PRIMARY KEY (CapabilityLeadID)
);
