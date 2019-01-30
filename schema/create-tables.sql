CREATE TABLE `Patient` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` string  NOT NULL ,
    `Address` string  NOT NULL ,
    `City` string  NOT NULL ,
    `Contact_Number` int  NOT NULL ,
    `Email` string  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Staff` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` string  NOT NULL ,
    `Department` string  NOT NULL ,
    `Position` string  NOT NULL ,
    `Address` string  NOT NULL ,
    `Contact_number` int  NOT NULL ,
    `Email` string  NOT NULL ,
    `Shift_ID` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `fk_Staff_Shift_ID` FOREIGN KEY(`Shift_ID`) REFERENCES `Shift` (`Identifier`);
);

CREATE TABLE `Appointments` (
    `Identifer` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Scheduled_On` Date  NOT NULL ,
    `Patient_ID` int  NOT NULL ,
    `Staff_Allocated` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `fk_Appointments_Patient_ID` FOREIGN KEY(`Patient_ID`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `fk_Appointments_Staff_Allocated` FOREIGN KEY(`Staff_Allocated`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Shift` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Start_Time` timestamp  NOT NULL ,
    `End_Time` timestamp  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Hospitalization` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Patient_ID` int  NOT NULL ,
    `Staff_Allocated` int  NOT NULL ,
    `Room_Allocated` int  NOT NULL ,
    `Hospitalized_On` date  NOT NULL ,
    `Discharged_On` date  NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `fk_Hospitalization_Patient_ID` FOREIGN KEY(`Patient_ID`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `fk_Hospitalization_Staff_Allocated` FOREIGN KEY(`Staff_Allocated`) REFERENCES `Staff` (`Identifier`),
    CONSTRAINT `fk_Hospitalization_Room_Allocated` FOREIGN KEY(`Room_Allocated`) REFERENCES `Room` (`Identifier`)
);

CREATE TABLE `Room` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Number` int  NOT NULL ,
    `Floor` int  NOT NULL ,
    `Wing` varchar(5)  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);
