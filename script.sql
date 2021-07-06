CREATE TABLE Capability (
CapabilityID int NOT NULL AUTO_INCREMENT,
CapabilityName varchar(255),
JobFamilyID int,
CapabilityLeadID int,
PRIMARY KEY (CapabilityID),
FOREIGN KEY (JobFamilyID) REFERENCES JobFamily(JobFamilyID),
FOREIGN KEY (CapabilityLeadID) REFERENCES CapabilityLeads(CapabilityLeadID)
);

CREATE TABLE Role (
RoleID int NOT NULL AUTO_INCREMENT,
RoleName varchar(255),
RoleSpec varchar(255),
CapabilityID int, 
BandID int,
PRIMARY KEY (RoleID),
FOREIGN KEY (CapabilityID) REFERENCES Capability(CapabilityID),
FOREIGN KEY (BandID) REFERENCES Band(BandID)
);

CREATE TABLE Band (
BandID int NOT NULL AUTO_INCREMENT,
BandName varchar(255),
BandLevel int,
Responsibilities varchar(255),
TrainingID int,
CompetenciesID int,
PRIMARY KEY (BandID),
FOREIGN KEY (CompetenciesID) REFERENCES Competencies(CompetenciesID),
FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);

CREATE TABLE JobFamily (
JobFamilyID int NOT NULL AUTO_INCREMENT,
JobFamilyName varchar(255),
PRIMARY KEY (JobFamilyID)
);

CREATE TABLE Users (
UserID int NOT NULL AUTO_INCREMENT,
UserType varchar(255),
UserPassword varchar(255),
PRIMARY KEY (UserID)
);

CREATE TABLE Training (
TrainingID int NOT NULL AUTO_INCREMENT,
TrainingName varchar(255),
TrainingType varchar(255),
TrainingLink varchar(255),
PRIMARY KEY (TrainingID)
);

CREATE TABLE Competencies  (
CompetenciesID int NOT NULL AUTO_INCREMENT,
CompetenciesName varchar(255),
PRIMARY KEY (CompetenciesID)
);

CREATE TABLE CapabilityLeads  (
CapabilityLeadID int NOT NULL AUTO_INCREMENT,
CapabilityLeadName varchar(255),
CapabilityLeadPhoto varchar(255),
CapabilityLeadMessage varchar(255),
PRIMARY KEY (CapabilityLeadID)
);


INSERT INTO JobFamily (JobFamilyID, JobFamilyName) VALUES ('Engineering Strategy and Planning');

INSERT INTO CapabilityLeads (CapabilityLeadName, CapabilityLeadPhoto, CapabilityLeadMessage) VALUES ('Aislinn McBride', 'url', ‘'apability Lead message');

INSERT INTO Capability (CapabilityName, JobFamilyID, CapabilityLeadID) VALUES ('Engineering', 1, 1);

INSERT INTO Competencies (CompetenciesName) VALUES ('Communication & influence, Personal performance, Working with others, Setting direction development & accountability, Supporting & delivering strategy, Commerciality & risk');

INSERT INTO Training (TrainingName, TrainingType, TrainingLink) VALUES ('Training name', 'Professional skills', 'training link');

INSERT INTO Band (BandName, BandLevel, Responsibilities, TrainingID, CompetenciesID) VALUES ('Trainee', 7,  'responsibilities', 1, 1);

INSERT INTO Role (RoleName, RoleSpec, CapabilityID, BandID) VALUES ('Software Engineer', 'link to spec', 1, 1);
