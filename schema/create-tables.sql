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

CREATE TABLE `Billing` (
    `Identifier` bigint(20)  NOT NULL ,
    `Patient_ID` int  NOT NULL ,
    `Amount` decimal(10,2)  NOT NULL ,
    `Date` date  NOT NULL ,
    `Insured_ID` int  NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Billing_Patient_ID` FOREIGN KEY(`Patient_ID`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `FK_Billing_Insured_ID` FOREIGN KEY(`Insured_ID`) REFERENCES `Insurance_Providers` (`Identifier`)
);

CREATE TABLE `Leaves` (
    `Identifier` bigint(20)  NOT NULL ,
    `Staff_ID` int  NOT NULL ,
    `Date` date  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Leaves_Staff_ID` FOREIGN KEY(`Staff_ID`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Salary` (
    `Identifier` bigint(20)  NOT NULL ,
    `Staff_ID` int  NOT NULL ,
    `Amount` decimal(10,2)  NOT NULL ,
    `Credited_On` date  NOT NULL ,
    `Account_Number` varchar(10)  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Salary_Staff_ID` FOREIGN KEY(`Staff_ID`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Expenses` (
    `Identifier` bigint(20)  NOT NULL ,
    `Type_Of_Expense` int  NOT NULL ,
    `Date` date  NOT NULL ,
    `Amount_Spent` decimal(10,2)  NOT NULL ,
    `Supervised_By` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Expenses_Type_Of_Expense` FOREIGN KEY(`Type_Of_Expense`) REFERENCES `Expense_Type` (`Identifier`),
    CONSTRAINT `FK_Expenses_Supervised_By` FOREIGN KEY(`Supervised_By`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Expense_Type` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    `Detail` text  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Departments` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    `Building` int  NOT NULL ,
    `Budget` decimal(10,2)  NOT NULL ,
    `Head_Staff` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Departments_Building` FOREIGN KEY(`Building`) REFERENCES `Buildings` (`Identifier`),
    CONSTRAINT `FK_Departments_Head_Staff` FOREIGN KEY(`Head_Staff`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Buildings` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Insurance_Providers` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Insurance_Plans` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    `Premium` decimal(10,2)  NOT NULL ,
    `Coverage` decimal(10,2)  NOT NULL ,
    `Insurance_Provider` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Insurance_Plans_Insurance_Provider` FOREIGN KEY(`Insurance_Provider`) REFERENCES `Insurance_Providers` (`Identifier`)
);

CREATE TABLE `Hospitals_Covered_By_IP` (
    `Identifier` bigint(20)  NOT NULL ,
    `Name` varchar(20)  NOT NULL ,
    `Insurance_Provider` int  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Hospitals_Covered_By_IP_Insurance_Provider` FOREIGN KEY(`Insurance_Provider`) REFERENCES `Insurance_Providers` (`Identifier`)
);
