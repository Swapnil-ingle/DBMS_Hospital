## Find the number of patients that were hospitalized in this month

SELECT COUNT(*)
FROM Hospitalization
WHERE MONTH(hospitalized_on) = MONTH(current_timestamp);

## Find the total Expenses incurred, its type, and who handled it for this month, and expense details.

SELECT Amount_Spent, s.Name as Supervised_By, et.name as Expense_Type, e.description as Expense_Description
FROM Expenses e
	JOIN Expense_Type et ON e.type_of_expense = et.Identifier
	JOIN Staff s ON e.Supervised_By = s.Identifier
WHERE MONTH(e.Date) = MONTH(current_timestamp);

## Make a report of all staff leaves. (All staff info and how many leaves they’ve taken)

SELECT s.name as Staff_Name, dep.name as Department, des.name as Designation, s.Address, s.Contact_number, s.Email, COUNT(*) as Num_of_leaves
FROM Leaves l 
	LEFT JOIN Staff s ON l.Staff_ID = s.Identifier
	LEFT JOIN Departments dep ON s.department_id = dep.Identifier
	LEFT JOIN Designations des ON s.designation_id = des.Identifier
GROUP BY s.name, dep.name, des.name, s.Address, s.Contact_number, s.Email;

## Find the number of rooms(and their relevant information) that are vacant.

SELECT r.Room_Number, r.Floor, r.Wing, b.Name as Building
FROM Room r
	LEFT JOIN Buildings b ON r.Building_ID = b.Identifier
WHERE r.Identifier NOT IN (SELECT r.Identifier FROM Hospitalization h LEFT JOIN Room r ON h.Room_Allocated = r.Identifier);

## Find the number of rooms that are occupied with the patient info as well.

SELECT r.Room_Number, r.Floor, r.Wing, b.Name as Building, p.Name as Patient_Name
FROM Hospitalization h
	LEFT JOIN Room r ON h.Room_Allocated = r.Identifier
	LEFT JOIN Buildings b ON r.Building_ID = b.Identifier
	LEFT JOIN Patients p ON h.Patient_ID = p.Identifier;

## Find all the staff(s) that are allocated to hospitalized patients.

SELECT r.Room_Number, b.Name as Building, p.Name as Patient_Name, s.Name as Staff_Allocated
FROM Hospitalization h
	LEFT JOIN Room r ON h.Room_Allocated = r.Identifier
	LEFT JOIN Buildings b ON r.Building_ID = b.Identifier
	LEFT JOIN Patients p ON h.Patient_ID = p.Identifier
	LEFT JOIN Staff s ON h.Staff_Allocated = s.Identifier;

## Find all the staff(s) that are allocated to patient appointments.

SELECT a.Scheduled_On, p.Name as Patient, s.Name as Staff_Allocated
FROM Appointments a
	LEFT JOIN Patients p ON a.Patient_ID = p.Identifier
	LEFT JOIN Staff s ON a.Staff_Allocated = s.Identifier;

## Find the average bill of patients over the last six months.

SELECT AVG(Amount)
FROM Billing
WHERE DATE > current_timestamp - INTERVAL 6 MONTH;

## Find the total bill of patients for the month.

SELECT SUM(AMOUNT)
FROM Billing
WHERE MONTH(DATE) = MONTH(current_timestamp);

## Find all the insurance plans of the Insurance providers who have your(or any certain) hospital covered in their network.

SELECT ipro.Name as Insurance_Provider, iplan.Name as Plan_Name, iplan.Premium, iplan.Coverage
FROM Insurance_Providers ipro
	JOIN Insurance_Plans iplan ON iplan.Insurance_Provider = ipro.Identifier
WHERE ipro.Identifier IN (SELECT ip.Identifier FROM Hospitals_Covered_By_IP hcip LEFT JOIN Insurance_Providers ip ON hcip.Insurance_Provider = ip.Identifier WHERE hcip.Name = 'Atlas Hospitals');

## Find all the head staff working at a particular shift.

SELECT s.Name as Staff, s.Contact_number, d.Name as Department, sh.Name as Shift
FROM Department_Head_Staff dhs
	LEFT JOIN Staff s ON dhs.Head_Staff_ID = s.Identifier
	LEFT JOIN Departments d ON dhs.Department_ID = d.Identifier
	LEFT JOIN Shift sh ON s.Shift_ID = sh.Identifier
WHERE sh.Name = 'Afternoon';

## Find all the transactions, of a patient, that were insured by any Insurance provider.

SELECT b.Amount, p.Name, ip.Name as Insurance_Provider
FROM Billing b
	LEFT JOIN Patients p ON b.Patient_ID = p.Identifier
	RIGHT JOIN Insurance_Providers ip ON b.Insured_ID = ip.Identifier;

## Find the most issued Drug of the month.

SELECT d.Short_Name, COUNT(*) as times_issued
FROM Prescriptions p
	JOIN Drugs d ON p.Drug_Issued = d.Identifier
	GROUP BY d.Short_Name
ORDER BY times_issued DESC
LIMIT 1;