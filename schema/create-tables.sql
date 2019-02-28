CREATE TABLE `Patients` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Contact_Number` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Expense_Type` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` varchar(20)  NOT NULL ,
    `Detail` text  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Buildings` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` varchar(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Insurance_Providers` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` varchar(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Shift` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Drugs` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Short_name` varchar(50) NOT NULL,
    `Long_name` varchar(255) NOT NULL,
    `Stock_quantity` int NOT NULL,
    `Expiry_Date` date NOT NULL,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Designations` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Name` varchar(50) NOT NULL,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Dosage` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Name` varchar(20) NOT NULL,
    `No_Of_Dosage` int NOT NULL,
    `Period_Interval` varchar(10) NOT NULL,
    PRIMARY KEY (`Identifier`)
);

CREATE TABLE `Room` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Room_Number` int NOT NULL,
  `Floor` int NOT NULL,
  `Wing` varchar(20) NOT NULL,
  `Building_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Building_ID` FOREIGN KEY (`Building_ID`) REFERENCES `Buildings` (`Identifier`)
);

CREATE TABLE `Departments` (
  `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
  `Name` varchar(20)  NOT NULL ,
  `Building_ID` bigint(20)  NOT NULL ,
  `Budget` decimal(10,2)  NOT NULL ,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Departments_Building` FOREIGN KEY (`Building_ID`) REFERENCES `Buildings` (`Identifier`)
);

CREATE TABLE `Staff` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Department_ID` bigint(20) NOT NULL,
  `Designation_ID` bigint(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Contact_number` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Shift_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Staff_Shift_ID` FOREIGN KEY (`Shift_ID`) REFERENCES `Shift` (`Identifier`),
  CONSTRAINT `FK_Deparments_Department_ID` FOREIGN KEY (`Department_ID`) REFERENCES `Departments` (`Identifier`),
  CONSTRAINT `FK_Designations_Designation_ID` FOREIGN KEY (`Designation_ID`) REFERENCES `Designations` (`Identifier`)
);

CREATE TABLE `Department_Head_Staff`(
  `Identifier`  bigint(20) NOT NULL AUTO_INCREMENT,
  `Department_ID` bigint(20) NOT NULL,
  `Head_Staff_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `UNQ_Department_ID` UNIQUE (`Department_ID`),
  CONSTRAINT `FK_Departments_ID` FOREIGN KEY (`Department_ID`) REFERENCES `Departments` (`Identifier`),
  CONSTRAINT `FK_Staff_ID` FOREIGN KEY (`Head_Staff_ID`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Appointments` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Scheduled_On` Date NOT NULL,
  `Patient_ID` bigint(20) NOT NULL,
  `Staff_Allocated` bigint(20) NOT NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Appointments_Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Identifier`),
  CONSTRAINT `FK_Appointments_Staff_Allocated` FOREIGN KEY (`Staff_Allocated`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Hospitalization` (
  `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
  `Patient_ID` bigint(20) NOT NULL,
  `Staff_Allocated` bigint(20) NOT NULL,
  `Room_Allocated` bigint(20) NOT NULL,
  `Hospitalized_On` date NOT NULL,
  `Discharged_On` date NULL,
  PRIMARY KEY (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Staff_Allocated` FOREIGN KEY (`Staff_Allocated`) REFERENCES `Staff` (`Identifier`),
  CONSTRAINT `FK_Hospitalization_Room_Allocated` FOREIGN KEY (`Room_Allocated`) REFERENCES `Room` (`Identifier`)
);

CREATE TABLE `Prescriptions` (
    `Identifier` bigint(20) NOT NULL AUTO_INCREMENT,
    `Issued_To` bigint(20)  NOT NULL,
    `Issued_By` bigint(20)  NOT NULL,
    `Drug_Issued` bigint(20)  NOT NULL,
    `Prescription_Date` date  NOT NULL,
    `Dosage` bigint(20)  NOT NULL,
    `Comments` text  NOT NULL,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Issued_To` FOREIGN KEY(`Issued_To`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Issued_By` FOREIGN KEY(`Issued_By`) REFERENCES `Staff` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Drug_Issued` FOREIGN KEY(`Drug_Issued`) REFERENCES `Drugs` (`Identifier`),
    CONSTRAINT `FK_Prescriptions_Dosage` FOREIGN KEY(`Dosage`) REFERENCES `Dosage` (`Identifier`)
);

CREATE TABLE `Billing` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Patient_ID` bigint(20)  NOT NULL ,
    `Amount` decimal(10,2)  NOT NULL ,
    `Date` date  NOT NULL ,
    `Insured_ID` bigint(20)  NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Billing_Patient_ID` FOREIGN KEY(`Patient_ID`) REFERENCES `Patient` (`Identifier`),
    CONSTRAINT `FK_Billing_Insured_ID` FOREIGN KEY(`Insured_ID`) REFERENCES `Insurance_Providers` (`Identifier`)
);

CREATE TABLE `Leaves` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Staff_ID` bigint(20)  NOT NULL ,
    `Date` date  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Leaves_Staff_ID` FOREIGN KEY(`Staff_ID`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Salary` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Staff_ID` bigint(20)  NOT NULL ,
    `Amount` decimal(10,2)  NOT NULL ,
    `Credited_On` date  NOT NULL ,
    `Account_Number` varchar(10)  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Salary_Staff_ID` FOREIGN KEY(`Staff_ID`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Expenses` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Type_Of_Expense` bigint(20)  NOT NULL ,
    `Date` date  NOT NULL ,
    `Amount_Spent` decimal(10,2)  NOT NULL ,
    `Supervised_By` bigint(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Expenses_Type_Of_Expense` FOREIGN KEY(`Type_Of_Expense`) REFERENCES `Expense_Type` (`Identifier`),
    CONSTRAINT `FK_Expenses_Supervised_By` FOREIGN KEY(`Supervised_By`) REFERENCES `Staff` (`Identifier`)
);

CREATE TABLE `Insurance_Plans` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` varchar(20)  NOT NULL ,
    `Premium` decimal(10,2)  NOT NULL ,
    `Coverage` decimal(10,2)  NOT NULL ,
    `Insurance_Provider` bigint(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Insurance_Plans_Insurance_Provider` FOREIGN KEY(`Insurance_Provider`) REFERENCES `Insurance_Providers` (`Identifier`)
);

CREATE TABLE `Hospitals_Covered_By_IP` (
    `Identifier` bigint(20)  NOT NULL AUTO_INCREMENT,
    `Name` varchar(20)  NOT NULL ,
    `Insurance_Provider` bigint(20)  NOT NULL ,
    PRIMARY KEY (`Identifier`),
    CONSTRAINT `FK_Hospitals_Covered_By_IP_Insurance_Provider` FOREIGN KEY(`Insurance_Provider`) REFERENCES `Insurance_Providers` (`Identifier`)
);
