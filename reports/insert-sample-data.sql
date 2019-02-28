## Insert sample data into HIMS DB

INSERT INTO Patient(Name, Address, City, Contact_Number, Email) VALUES 
	('Sam', 'Gate Avenue, Baker St. 312', 'LA', 123456, 'Sam@LA'),
	('Max', 'Gate Avenue, Baker St. 313', 'LA', 123456, 'Max@LA'),
	('Karla', 'Freeway, Indus 12, near Central Park', 'NYC', 123456, 'Karla@NYC'),
	('Ranger', 'Yellowstone national park, Washinton DC', 'WDC', 123456, 'Ranger@WDC'),
	('Chandler', '15 Yemen road, Yemen', 'Yemen', 123456, 'Chan@Yemen');

INSERT INTO Expense_Type(Name, Detail) VALUES
	('Repair', 'Any expense on physical damage that is incurred should be categorized under this expense type'),
	('Upgrade', 'Any upgrade carried out'),
	('Cleaning', 'Any type of cleaning'),
	('Addition', 'If any addition, of any instrument, is done add this under Addition category'),
	('Service', 'Any type of service that the hospital had to outsource');

INSERT INTO Buildings(Name) VALUES
	('Prometheus Arch'),
	('Zeus'),
	('Ragnarok'),
	('Arthur');

INSERT INTO Insurance_Providers(Name) VALUES
	('Oracle IP'),
	('ICICI Lombard health'),
	('Kotak Insured');

INSERT INTO Shift(Name, Start_Time, End_Time) VALUES
	('Morning', '8:00:00', '16:00:00'),
	('Afternoon', '12:00:00', '20:00:00'),
	('Evening', '18:00:00', '2:00:00'),
	('Night', '12:00:00', '8:00:00');

INSERT INTO Drugs(Short_name, Long_name, Stock_quantity, Expiry_date) VALUES
	('Hydrocodone', 'Hydrocodone combined with acetaminophen', 100, '2019-12-12'),
	('Simvastatin', 'Generic Zocor', 100, '2019-12-12'),
	('Lisinopril', 'Lisinopril', 100, '2019-12-12'),
	('Synthroid', 'Levothyroxine sodium', 100, '2019-12-12'),
	('Norvasc', 'Amlodipine besylate', 100, '2019-12-12'),
	('Prilosec', 'Omeprazole', 100, '2019-12-12'),
	('Azithromycin', 'Azithromycin', 100, '2019-12-12'),
	('Amoxicillin', 'Amoxicillin', 100, '2019-12-12'),
	('Glucophage', 'Metformin', 100, '2019-12-12'),
	('Hydrochlorothiazide', 'Hydrochlorothiazide', 100, '2019-12-12');

INSERT INTO Dosage(Name, No_Of_Dosage, Period_Interval) VALUES
	('Thrice a day' ,3, 'Day'),
	('Twice a day' ,2, 'Day'),
	('Once a day' ,1, 'Day'),
	('Once a week' ,1, 'Week'),
	('Once a month' ,1, 'Month');

INSERT INTO Room(Room_Number, Floor, Wing, Building_ID) VALUES
	(101, 1, 'A Wing', 1),
	(102, 1, 'A Wing', 1),
	(103, 1, 'A Wing', 1),
	(104, 1, 'A Wing', 1),
	(105, 1, 'A Wing', 1),
	(201, 2, 'B Wing', 1),
	(202, 2, 'B Wing', 1),
	(203, 2, 'B Wing', 1),
	(204, 2, 'B Wing', 1),
	(205, 2, 'B Wing', 1),
	(101, 1, 'Left', 2),
	(102, 1, 'Left', 2),
	(103, 1, 'Left', 2),
	(104, 1, 'Left', 2),
	(201, 2, 'Left-Upper', 2),
	(202, 2, 'Left-Upper', 2),
	(203, 2, 'Left-Upper', 2),
	(204, 2, 'Left-Upper', 2),
	(205, 2, 'Left-Upper', 2),
	(301, 1, 'Mid-Wing', 3),
	(302, 2, 'Mid-Wing', 3);

INSERT INTO Designations(Name) VALUES
	('Veteran Surgeon'),
	('Neurologist'),
	('Medical receptionist'),
	('Dietitian'),
	('Clinical Nurse'),
	('Nurse Manager');

INSERT INTO Departments(Name, Building_ID, Budget) VALUES
	('Emergency Department', 1, 100000.00),
	('Intensive care unit', 1, 125000.00),
	('Burn Center', 2, 100000.00),
	('Hospital pharmacy', 3, 75000.00),
	('Physical Therapy', 3, 75000.00),
	('Psychiatric hospital', 3, 90000.00);

INSERT INTO Staff(Name, Department_ID, Designation_ID, Address, Contact_number, Email, Shift_ID) VALUES
	('Dr. Blake', 1, 1, 'NYC stern road, NYC', 13245687, 'dr.blake@NYC', 1),
	('Dr. Mark', 6, 2, 'NYC stern road, NYC', 13245687, 'dr.Mark@NYC', 1),
	('Andrew', 1, 3, 'NYC stern road, NYC', 13245687, 'Andrew@NYC', 2),
	('Louise', 1, 5, 'NYC stern road, NYC', 13245687, 'Louise@NYC', 2);

INSERT INTO Department_Head_Staff(Department_ID, Head_Staff_ID) VALUES
	(1, 1),
	(2, 1),
	(3, 4),
	(6, 2);

INSERT INTO Appointments(Scheduled_On, Patient_ID, Staff_Allocated) VALUES
	('2019-03-01', 1, 3),
	('2019-03-02', 2, 3),
	('2019-03-03', 3, 3),
	('2019-03-04', 4, 3),
	('2019-03-05', 5, 3);

INSERT INTO Hospitalization(Patient_ID, Staff_Allocated, Room_Allocated, Hospitalized_On, Discharged_On) VALUES
	(1, 1, 1, '2019-03-01', NULL),
	(4, 2, 21, '2019-03-01', NULL);
