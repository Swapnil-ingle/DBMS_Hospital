CREATE TABLE `Patient` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` string NOT NULL,
  `Address` string NOT NULL,
  `City` string NOT NULL,
  `Contact_Number` int NOT NULL,
  `Email` string NOT NULL,
  PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Staff` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` string NOT NULL,
  `Department` string NOT NULL,
  `Position` string NOT NULL,
  `Address` string NOT NULL,
  `Contact_number` int NOT NULL,
  `Email` string NOT NULL,
  `Shift_ID` int NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Staff_Shift_ID` FOREIGN KEY (`Shift_ID`) REFERENCES `Shift` (`Identifier`);
);

CREATE TABLE `Appointments` (
  `Identifer` bigint(20) NOT NULL AUTO_INCREMENT,
  `Scheduled_On` Date NOT NULL,
  `Patient_ID` int NOT NULL,
  `Staff_Allocated` int NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Appointments_Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Identifier`),
  CONSTRAINT `FK_Appointments_Staff_Allocated` FOREIGN KEY (`Staff_Allocated`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Shift` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Start_Time` timestamp NOT NULL,
  `End_Time` timestamp NOT NULL,
  PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Hospitalization` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Staff_Allocated` int NOT NULL,
  `Room_Allocated` int NOT NULL,
  `Hospitalized_On` date NOT NULL,
  `Discharged_On` date NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Staff_Allocated` FOREIGN KEY (`Staff_Allocated`) REFERENCES `Staff` (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Room_Allocated` FOREIGN KEY (`Room_Allocated`) REFERENCES `Room` (`Identifier`)
);

CREATE TABLE `Room` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Number` int NOT NULL,
  `Floor` int NOT NULL,
  `Wing` varchar(5) NOT NULL,
  PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Prescriptions` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Issued_To` int  NOT NULL,
    `Issued_By` int  NOT NULL,
    `Drug_Issued` int  NOT NULL,
    `Prescription_Date` date  NOT NULL,
    `Dosage` int  NOT NULL,
    `Comments` text  NOT NULL,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Issued_To` FOREIGN KEY(`Issued_To`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Issued_By` FOREIGN KEY(`Issued_By`) REFERENCES `Staff` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Drug_Issued` FOREIGN KEY(`Drug_Issued`) REFERENCES `Drugs` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Dosage` FOREIGN KEY(`Dosage`) REFERENCES `Dosage` (`Identifier`)
);

CREATE TABLE `Drugs` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Short_name` varchar(50) NOT NULL,
    `Long_name` varchar(255) NOT NULL,
    `Stock_quantity` int NOT NULL,
    `Expiry_Date` date NOT NULL,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Dosage` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `No_Of_Dosage` int NOT NULL,
    `Period_Interval` varchar(10) NOT NULL,
    PRIMARY KEY (`Identifier`)
);
